@php
use Illuminate\Support\Str;

/** Normalize inputs */
$title        = $book['title'] ?? 'Untitled';
$authorsArr   = $book['authors'] ?? [];
$authors      = !empty($authorsArr) ? implode(', ', $authorsArr) : 'Unknown Author';
$thumb        = $book['thumbnail'] ?? 'https://dummyimage.com/400x600/0f172a/ffffff&text=No+Image';
$publisher    = $book['publisher'] ?? null;
$published    = $book['publishedDate'] ?? null;
$lang         = !empty($book['language']) ? strtoupper($book['language']) : null;
$isbn         = $book['isbn'] ?? null;                // make sure you mapped this from Google items.volumeInfo.industryIdentifiers
$categories   = $book['categories'] ?? [];
$rating       = $book['averageRating'] ?? null;
$ratingsCount = $book['ratingsCount'] ?? null;

/** Try to get a stable Google Books Volume ID (preferred over preview/info links) */
$googleVolumeId = $book['googleId'] ?? $book['id'] ?? null; // ensure you stored Google volume "id" into one of these keys

/** Build robust Google Books URLs */
$gbById   = $googleVolumeId ? "https://books.google.com/books?id={$googleVolumeId}&printsec=frontcover" : null;
$gbByIsbn = $isbn ? "https://books.google.com/books?vid=ISBN{$isbn}" : null;

$previewLink = $book['previewLink'] ?? null; // from Google Books API volumeInfo.previewLink
$infoLink    = $book['infoLink'] ?? null;    // volumeInfo.infoLink
$openLib     = $isbn ? "https://openlibrary.org/isbn/{$isbn}" : null;

/** Final destinations (in order of reliability & UX) */
$viewOnGB   = $gbById ?? $previewLink ?? $infoLink ?? $gbByIsbn ?? $openLib ?? ("https://www.google.com/search?q=" . urlencode($title . ' site:books.google.com'));
$previewUrl = $gbById ? "{$gbById}&source=gbs_api" : ($previewLink ?? $gbByIsbn ?? $infoLink ?? $openLib ?? ("https://www.google.com/search?q=" . urlencode($title . ' preview')));

/** Find Similar — prefer primary category, then first author, then title */
$primaryCategory = $categories[0] ?? null;
$firstAuthor     = !empty($authorsArr) ? $authorsArr[0] : null;
$similarQuery    = $primaryCategory ?? $firstAuthor ?? $title;
$findSimilarUrl  = route('books.search', ['search' => $similarQuery]);
@endphp

@extends('layouts.app')

@section('title', $title)

@section('content')
<div class="bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 text-slate-100 min-h-screen relative overflow-hidden">
  {{-- ambient glow --}}
  <div aria-hidden="true" class="pointer-events-none absolute inset-0
    [background:radial-gradient(60rem_60rem_at_120%_-10%,rgba(56,189,248,.15),transparent_60%),radial-gradient(60rem_60rem_at_-10%_110%,rgba(99,102,241,.15),transparent_60%)]"></div>
  <div aria-hidden="true" class="absolute inset-0 opacity-[0.06] bg-[linear-gradient(0deg,transparent_24px,rgba(255,255,255,.06)_25px),linear-gradient(90deg,transparent_24px,rgba(255,255,255,.06)_25px)] bg-[length:26px_26px]"></div>

  <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 md:py-10">

    {{-- Back --}}
    <div class="mb-6 md:mb-8">
      <a href="{{ url()->previous() }}"
         class="inline-flex items-center gap-2 px-4 py-2 rounded-xl border border-slate-700/60 text-slate-300 hover:bg-slate-800/60 hover:border-slate-600 transition font-semibold">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
        </svg>
        Back
      </a>
    </div>

    <section itemscope itemtype="https://schema.org/Book"
      class="grid grid-cols-1 lg:grid-cols-3 rounded-3xl border border-white/10 bg-white/5 backdrop-blur-xl shadow-2xl overflow-hidden">

      {{-- LEFT: Cover + Availability --}}
      <aside class="p-6 md:p-8 lg:p-10 border-b lg:border-b-0 lg:border-r border-white/10">
        <div class="space-y-6 lg:sticky lg:top-10">
          {{-- cover --}}
          <div class="group relative mx-auto w-full max-w-[380px]">
            <div class="absolute -inset-2 rounded-2xl bg-gradient-to-tr from-cyan-400/20 to-indigo-500/20 blur-xl opacity-60 group-hover:opacity-100 transition"></div>
            <div class="relative overflow-hidden rounded-2xl border border-white/10 bg-slate-800/40 shadow-xl transform-gpu group-hover:-rotate-1 group-hover:scale-[1.01] transition">
              <img src="{{ $thumb }}" alt="{{ $title }}" itemprop="image" class="w-full h-auto object-contain bg-slate-900/40"/>
            </div>
          </div>

          {{-- availability + actions --}}
          <div class="rounded-2xl border border-white/10 bg-slate-900/40 p-5">
            @if(isset($localBook) && $localBook)
              @if($localBook->quantity > 0)
                <div class="flex items-center justify-between">
                  <p class="font-bold text-emerald-400">Available</p>
                  <p class="text-slate-400">{{ $localBook->quantity }} copies</p>
                </div>
                <form action="{{ route('lendings.request', ['book' => $localBook->id]) }}" method="POST" class="mt-4">
                  @csrf
                  <button type="submit"
                          class="w-full py-3 px-5 rounded-xl bg-gradient-to-r from-cyan-500 to-indigo-500 hover:from-cyan-400 hover:to-indigo-400 text-white font-semibold shadow-lg shadow-cyan-500/10 transition">
                    Request to Borrow
                  </button>
                </form>
              @else
                <p class="py-3 px-4 text-center rounded-xl bg-yellow-500/10 text-yellow-300 border border-yellow-500/30 font-medium">
                  Currently Unavailable
                </p>
              @endif
            @else
              <p class="py-3 px-4 text-center rounded-xl bg-amber-500/10 text-amber-300 border border-amber-500/30 font-medium">
                Not in our library stock
              </p>
            @endif

            <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-3">
              <a href="{{ $findSimilarUrl }}"
                 class="text-center py-3 rounded-xl border border-white/10 hover:bg-white/5 transition font-semibold">
                Find Similar
              </a>
              <a href="{{ $viewOnGB }}" target="_blank" rel="noopener noreferrer"
                 class="text-center py-3 rounded-xl bg-white/10 hover:bg-white/20 transition font-semibold">
                View on Google Books
              </a>
            </div>
          </div>

          {{-- quick actions --}}
          <div class="grid grid-cols-3 gap-3 text-sm">
            <button id="shareBtn" type="button" data-share-title="{{ $title }}"
              class="h-11 rounded-xl border border-white/10 hover:bg-white/5 transition flex items-center justify-center gap-2">
              <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M18 8a3 3 0 0 0-2.816 1.999l-6.3-3.15A3 3 0 0 0 6 6a3 3 0 0 0 .116.811l6.3 3.15a3 3 0 0 0 0 2.078l-6.3 3.15A3 3 0 1 0 8.884 18l6.3-3.15A3 3 0 1 0 18 8z"/></svg>
              Share
            </button>

            <button id="copyIsbnBtn" type="button" @if(!$isbn) disabled @endif data-isbn="{{ $isbn }}"
              class="h-11 rounded-xl border border-white/10 hover:bg-white/5 transition flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed">
              <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M16 1H4c-1.1 0-2 .9-2 2v12h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v15h13c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 17H8V7h11v15z"/></svg>
              Copy ISBN
            </button>

            <a href="{{ $previewUrl }}" target="_blank" rel="noopener noreferrer"
               class="h-11 rounded-xl border border-white/10 hover:bg-white/5 transition flex items-center justify-center gap-2">
              <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M14 3H5a2 2 0 0 0-2 2v14c0 1.103.897 2 2 2h9v-2H5V5h9V3zm5 4h-6v6h6V7zm-2 4h-2V9h2v2zM21 17h-8v2h8v-2z"/></svg>
              Preview
            </a>
          </div>
        </div>
      </aside>

      {{-- RIGHT: Info --}}
      <main class="lg:col-span-2 p-6 md:p-8 lg:p-10">
        {{-- header --}}
        <header class="pb-6 border-b border-white/10">
          <h1 itemprop="name" class="text-3xl md:text-4xl font-black tracking-tight">{{ $title }}</h1>
          <p class="mt-2 text-lg text-slate-300" itemprop="author">by {{ $authors }}</p>

          <div class="mt-4 flex flex-wrap gap-2">
            @if($published)
              <span class="px-3 py-1 rounded-full bg-white/10 text-slate-200 text-xs">Published: {{ $published }}</span>
            @endif
            @if($publisher)
              <span class="px-3 py-1 rounded-full bg-white/10 text-slate-200 text-xs">Publisher: {{ $publisher }}</span>
            @endif
            @if($lang)
              <span class="px-3 py-1 rounded-full bg-white/10 text-slate-200 text-xs">Lang: {{ $lang }}</span>
            @endif
            @if($isbn)
              <span class="px-3 py-1 rounded-full bg-white/10 text-slate-200 text-xs" itemprop="isbn">ISBN: {{ $isbn }}</span>
            @endif
            @foreach(array_slice($categories, 0, 4) as $cat)
              <span class="px-3 py-1 rounded-full bg-cyan-500/10 text-cyan-300 border border-cyan-500/20 text-xs">{{ $cat }}</span>
            @endforeach
          </div>

          @if ($rating)
            <div class="mt-4 flex items-center gap-2">
              <div class="flex text-yellow-400">
                @for ($i = 0; $i < floor($rating); $i++)
                  <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
                @endfor
                @for ($i = floor($rating); $i < 5; $i++)
                  <svg class="w-5 h-5 text-slate-600" viewBox="0 0 20 20" fill="currentColor"><path d="M10 15l-5.878 3.09 1.123-6.545L.49 6.91l6.562-.955L10 0l2.948 5.955 6.562.955-4.755 4.635 1.123 6.545z"/></svg>
                @endfor
              </div>
              <span class="text-slate-300 font-medium">{{ number_format($rating, 1) }}</span>
              <span class="text-slate-500">({{ $ratingsCount ?? 'N/A' }} reviews)</span>
            </div>
          @endif
        </header>

        {{-- details --}}
        <section class="mt-6">
          <h2 class="text-lg font-semibold text-slate-100 mb-3">Book Details</h2>
          <dl class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3 text-sm">
            @if($publisher)
              <div><dt class="text-slate-400">Publisher</dt><dd class="text-slate-200">{{ $publisher }}</dd></div>
            @endif
            @if($published)
              <div><dt class="text-slate-400">Published Date</dt><dd class="text-slate-200">{{ $published }}</dd></div>
            @endif
            @if($lang)
              <div><dt class="text-slate-400">Language</dt><dd class="text-slate-200">{{ $lang }}</dd></div>
            @endif
            @if($isbn)
              <div><dt class="text-slate-400">ISBN</dt><dd class="text-slate-200">{{ $isbn }}</dd></div>
            @endif
            @if(!empty($categories))
              <div class="md:col-span-2">
                <dt class="text-slate-400">Categories</dt>
                <dd class="mt-1 flex flex-wrap gap-2">
                  @foreach($categories as $cat)
                    <span class="px-2.5 py-1 rounded-full bg-white/5 text-slate-200 border border-white/10 text-xs">{{ $cat }}</span>
                  @endforeach
                </dd>
              </div>
            @endif
          </dl>
        </section>

        {{-- description (read more) --}}
        @if(!empty($book['description']))
        <section class="mt-6">
          <h2 class="text-lg font-semibold text-slate-100 mb-3">Description</h2>
          <div id="descBox" class="desc-clamp text-slate-300 leading-relaxed">
            {!! nl2br(e($book['description'])) !!}
          </div>
          <button id="toggleDesc" type="button" class="mt-3 text-cyan-300 hover:text-cyan-200 text-sm font-semibold">
            Read more
          </button>
        </section>
        @endif

        {{-- flash messages --}}
        @if (session('success'))
          <div class="mt-6 p-4 rounded-xl bg-emerald-500/10 text-emerald-300 border border-emerald-500/30">
            {{ session('success') }}
          </div>
        @endif
        @if (session('error'))
          <div class="mt-6 p-4 rounded-xl bg-rose-500/10 text-rose-300 border border-rose-500/30">
            {{ session('error') }}
          </div>
        @endif

      </main>
    </section>
  </div>
</div>

{{-- Share Fallback Modal --}}
<div id="shareModal" class="hidden fixed inset-0 z-50 items-center justify-center">
  <div class="absolute inset-0 bg-black/60"></div>
  <div class="relative z-10 w-full max-w-md rounded-2xl border border-white/10 bg-slate-900 p-5 shadow-2xl">
    <h3 class="text-lg font-semibold mb-3">Share this book</h3>
    <p class="text-sm text-slate-400 mb-2">Copy this link and share anywhere:</p>
    <div class="flex gap-2">
      <input id="shareLinkInput" type="text" readonly
             class="flex-1 rounded-lg border border-white/10 bg-white/5 px-3 py-2 text-sm"
             value="">
      <button id="copyShareLinkBtn"
              class="px-3 py-2 rounded-lg bg-white/10 hover:bg-white/20 text-sm font-semibold">
        Copy
      </button>
    </div>
    <div class="mt-4 flex justify-end gap-2">
      <button id="closeShareModal" class="px-3 py-2 rounded-lg border border-white/10 hover:bg-white/5 text-sm">
        Close
      </button>
    </div>
  </div>
</div>
@endsection

@section('scripts')
<style>
  /* Works without Tailwind line-clamp plugin */
  .desc-clamp{display:-webkit-box;-webkit-line-clamp:6;-webkit-box-orient:vertical;overflow:hidden;}
  .desc-expanded{display:block;-webkit-line-clamp:unset;-webkit-box-orient:unset;overflow:visible;}
  .no-scrollbar::-webkit-scrollbar{display:none;}
  .no-scrollbar{scrollbar-width:none;-ms-overflow-style:none;}
  .hidden{display:none;}
  .flex-center{display:flex;align-items:center;justify-content:center;}
</style>

<script>
  function toast(msg){
    let t=document.createElement('div');
    t.textContent=msg;
    t.className="fixed z-[60] bottom-6 left-1/2 -translate-x-1/2 px-4 py-2 rounded-xl bg-black/70 text-white border border-white/10 backdrop-blur shadow-lg";
    document.body.appendChild(t);
    setTimeout(()=>t.remove(),2200);
  }

  document.addEventListener('DOMContentLoaded', function(){
    // SHARE: use Web Share API on HTTPS; modal fallback on HTTP/desktop
    const shareBtn=document.getElementById('shareBtn');
    const shareModal=document.getElementById('shareModal');
    const shareInput=document.getElementById('shareLinkInput');
    const copyShareBtn=document.getElementById('copyShareLinkBtn');
    const closeShareBtn=document.getElementById('closeShareModal');

    function openShareModal(url){
      shareInput.value=url;
      shareModal.classList.remove('hidden');
      shareModal.classList.add('flex-center');
      shareInput.focus(); shareInput.select();
    }
    function closeShareModal(){
      shareModal.classList.add('hidden');
      shareModal.classList.remove('flex-center');
    }

    if(shareBtn){
      shareBtn.addEventListener('click', async ()=>{
        const title = shareBtn.dataset.shareTitle || document.title;
        const url   = window.location.href;

        // Secure contexts (HTTPS/localhost) typically support Web Share on mobile
        if (navigator.share && (window.isSecureContext || location.hostname === 'localhost')) {
          try {
            await navigator.share({ title, text:'Check this book from Oakwood Library', url });
            return;
          } catch(e){ /* user cancelled */ }
        }
        // Fallback: modal with copy link
        openShareModal(url);
      });
    }
    copyShareBtn?.addEventListener('click', async ()=>{
      try{
        await navigator.clipboard.writeText(shareInput.value);
        toast('Link copied');
      }catch(e){
        shareInput.select();
        document.execCommand('copy');
        toast('Link copied');
      }
    });
    closeShareBtn?.addEventListener('click', closeShareModal);
    shareModal?.addEventListener('click', (e)=>{ if(e.target===shareModal) closeShareModal(); });
    document.addEventListener('keydown', (e)=>{ if(e.key==='Escape') closeShareModal(); });

    // COPY ISBN
    const isbnBtn=document.getElementById('copyIsbnBtn');
    if(isbnBtn){
      isbnBtn.addEventListener('click', async ()=>{
        const isbn=isbnBtn.dataset.isbn;
        if(!isbn) return toast('No ISBN available');
        try{
          await navigator.clipboard.writeText(isbn);
          toast('ISBN copied');
        }catch(e){
          const tmp=document.createElement('input');
          tmp.value=isbn; document.body.appendChild(tmp); tmp.select();
          document.execCommand('copy'); tmp.remove(); toast('ISBN copied');
        }
      });
    }

    // READ MORE
    const desc=document.getElementById('descBox');
    const toggle=document.getElementById('toggleDesc');
    if(desc && toggle){
      toggle.addEventListener('click', ()=>{
        const expanded=desc.classList.toggle('desc-expanded');
        if(expanded){ desc.classList.remove('desc-clamp'); toggle.textContent='Show less'; }
        else{ desc.classList.add('desc-clamp'); toggle.textContent='Read more'; }
      });
    }
  });
</script>
@endsection
