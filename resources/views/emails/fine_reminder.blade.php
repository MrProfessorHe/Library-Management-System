@component('mail::message')
# 📚 Oakwood Library – Fine Reminder

Hello **{{ $user->name }}**,

We hope you’re enjoying your reading experience with us.  
Unfortunately, you have some **pending fines** that require your attention.

---

## 📝 Fine Details

@component('mail::table')
| 📖 Book Title       | 💰 Amount | 📅 Due Date |
| ------------------- | --------- | ----------- |
@foreach ($pendingFines as $fine)
| {{ $fine->lending->book->title }} | ₹{{ number_format($fine->amount, 2) }} | {{ optional($fine->lending->return_at)->format('d M Y') ?? 'N/A' }} |
@endforeach
@endcomponent

---

## ⚠ Important Notice  
- Please settle your fines **at the earliest** to avoid additional late charges.  
- Payments can be made via **Cash** or **UPI** at the library counter.  

---


### 📍 Library Information
**Oakwood Library**  
📍 Angamaly  
📞 +91 98765 43210  
📧 oakwoodlibrary@example.com  
🌐 [oakwoodlibrary.com](http://oakwoodlibrary.com)  

---

> 🛈 All fines are **non-refundable**. Please retain this receipt for your records.  
> For any disputes, contact the library **within 7 days**.

Thanks for your prompt attention,  
**Oakwood Library** Team

@endcomponent
