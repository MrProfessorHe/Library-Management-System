<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Fine Receipt - Oakwood Library</title>
    <style>
        body {
            font-family: 'DejaVu Sans', sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 820px;
            margin: 40px auto;
            background: #fff;
            border-radius: 15px;
            padding: 35px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            position: relative;
        }
        /* PAID Watermark */
        .watermark {
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-30deg);
            font-size: 100px;
            color: rgba(0, 128, 0, 0.1);
            font-weight: bold;
            z-index: 0;
        }
        /* Header */
        .header {
            text-align: center;
            margin-bottom: 25px;
        }
        .header img {
            height: 80px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 28px;
            color: #1d4ed8;
        }
        .header p {
            font-size: 12px;
            color: #555;
            margin: 2px 0;
        }
        .title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1d4ed8;
        }
        .user-info, .totals {
            margin: 20px 0;
        }
        .user-info table, .fines-table, .totals table {
            width: 100%;
            border-collapse: collapse;
        }
        .user-info th, .user-info td,
        .fines-table th, .fines-table td,
        .totals th, .totals td {
            padding: 10px;
            font-size: 13px;
        }
        .user-info th {
            width: 25%;
            text-align: left;
            color: #1d4ed8;
        }
        .fines-table th {
            background-color: #e0f2fe;
            color: #1d4ed8;
            font-weight: bold;
        }
        .fines-table td {
            border: 1px solid #e0e0e0;
        }
        .totals td {
            font-weight: bold;
            text-align: right;
        }
        .footer {
            text-align: center;
            font-size: 11px;
            color: #777;
            margin-top: 35px;
            border-top: 1px dashed #ccc;
            padding-top: 10px;
        }
        .thank-you {
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            margin-top: 15px;
            color: #1d4ed8;
        }
    </style>
</head>
<body>
    <div class="container">

        @if(!empty($fines) && strtolower($fines->first()->status) === 'paid')
            <div class="watermark">PAID</div>
        @endif

        <!-- Header -->
        <div class="header">
            <img src="{{ public_path('images/BookLogoB.png') }}" alt="Library Logo">
            <h1>Oakwood Library</h1>
            <p>Angamaly | Phone: +91 9876543210 | Email: oakwoodlibrary@example.com</p>
            <p>Website: OakwoodLibrary.com</p>
        </div>

        <!-- Receipt Title -->
        <div class="title">Fine Payment Receipt</div>

        <!-- Customer Info & Transaction -->
        <div class="user-info">
            <table>
                <tr>
                    <th>Member Name</th>
                    <td>{{ $user->name }}</td>
                    <th>Member ID</th>
                    <td>{{ str_pad($user->id, 5, '0', STR_PAD_LEFT) }}</td>
                </tr>
                <tr>
                    <th>Receipt No.</th>
                    <td>FINE-{{ str_pad($fines->first()->id ?? 0, 5, '0', STR_PAD_LEFT) }}</td>
                    <th>Date</th>
                    <td>{{ now()->format('d M Y, h:i A') }}</td>
                </tr>
            </table>
        </div>

        <!-- Fines Table -->
        <div class="fines">
            <table class="fines-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Book Title</th>
                        <th>Description</th>
                        <th>Amount (₹)</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    @php $subtotal = 0; @endphp
                    @foreach($fines as $index => $fine)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $fine->lending->book->title ?? 'N/A' }}</td>
                            <td>Overdue Fine</td>
                            <td>{{ number_format($fine->amount, 2) }}</td>
                            <td>{{ ucfirst($fine->payment_method ?? 'Cash / UPI') }}</td>
                            <td>{{ ucfirst($fine->status) }}</td>
                        </tr>
                        @php $subtotal += $fine->amount; @endphp
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- Totals & Payment Summary -->
        <div class="totals">
            <table>
                <tr>
                    <td>Subtotal:</td>
                    <td>₹{{ number_format($subtotal, 2) }}</td>
                </tr>
                <tr>
                    <td>Total Paid:</td>
                    <td>₹{{ number_format($subtotal, 2) }}</td>
                </tr>
            </table>
        </div>

        <!-- Thank You Message -->
        <div class="thank-you">Thank you for your payment!</div>

        <!-- Footer -->
        <div class="footer">
            All fines are non-refundable. Please retain this receipt for your records.<br>
            For disputes, contact the library within 7 days.<br>
            Receipt generated on: {{ now()->format('d M Y, h:i A') }}
        </div>

    </div>
</body>
</html>
