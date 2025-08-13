<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Fine Receipt - Oakwood Library</title>
    <style>
        body {
            font-family: 'DejaVu Sans', sans-serif;
            color: #222;
            padding: 40px;
            position: relative;
            background-color: #f8f9fa;
        }
        .receipt-container {
            background: white;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #ddd;
            position: relative;
            z-index: 2;
        }
        .header {
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid #444;
            margin-bottom: 20px;
        }
        .header img {
            height: 80px;
            margin-bottom: 5px;
        }
        .library-info {
            font-size: 14px;
            line-height: 1.5;
            color: #555;
        }
        .title {
            text-align: center;
            font-size: 26px;
            margin: 20px 0;
            font-weight: bold;
            color: #007BFF;
            letter-spacing: 1px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #e0e0e0;
            padding: 10px;
            font-size: 14px;
        }
        th {
            background-color: #f4f6f9;
            font-weight: bold;
            color: #333;
        }
        .terms {
            font-size: 12px;
            margin-top: 30px;
            text-align: center;
            color: #777;
            border-top: 1px dashed #ccc;
            padding-top: 10px;
        }
        .generated {
            font-size: 12px;
            margin-top: 10px;
            text-align: right;
            color: #666;
        }
        /* PAID Watermark fix for DomPDF */
        .watermark {
            position: absolute;
            top: 35%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-30deg);
            font-size: 100px;
            color: rgba(255, 0, 0, 0.18);
            font-weight: bold;
            white-space: nowrap;
            z-index: 9999;
        }
    </style>
</head>
<body>

    {{-- Watermark if Paid --}}
    @if(strtolower($fine->status) === 'paid')
        <div class="watermark">PAID</div>
    @endif

    <div class="receipt-container">
        {{-- Header with Logo and Library Info --}}
        <div class="header">
            <img src="{{ public_path('images/BookLogoB.png') }}" alt="Library Logo">
            <div class="library-info">
                <strong style="font-size:18px;">Oakwood Library</strong><br>
                Angamaly<br>
                Phone: +91 9876543210<br>
                Email: oakwoodlibrary@example.com<br>
                Website: OakwoodLibrary.com
            </div>
        </div>

        <div class="title">Fine Payment Receipt</div>

        {{-- Transaction Info --}}
        <table>
            <tr>
                <th>Receipt No.</th>
                <td>FINE-{{ str_pad($fine->id, 5, '0', STR_PAD_LEFT) }}</td>
            </tr>
            <tr>
                <th>Date</th>
                <td>{{ $fine->created_at->format('d M Y, h:i A') }}</td>
            </tr>
            <tr>
                <th>Member Name</th>
                <td>{{ $fine->user->name }}</td>
            </tr>
            <tr>
                <th>Book Title</th>
                <td>{{ $fine->lending->book->title ?? 'N/A' }}</td>
            </tr>
            <tr>
                <th>Reason for Fine</th>
                <td>Overdue Book</td>
            </tr>
            <tr>
                <th>Amount</th>
                <td><strong>₹{{ number_format($fine->amount, 2) }}</strong></td>
            </tr>
            <tr>
                <th>Payment Method</th>
                <td>{{ ucfirst($fine->payment_method ?? 'Cash / UPI') }}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>{{ ucfirst($fine->status) }}</td>
            </tr>
        </table>

        {{-- Terms --}}
        <div class="terms">
            All fines are non-refundable. Please retain this receipt for your records.<br>
            For any disputes, contact the library within 7 days.
        </div>

        {{-- Generated timestamp --}}
        <div class="generated">
            Receipt generated on: {{ now()->format('d M Y, h:i A') }}
        </div>
    </div>

</body>
</html>
