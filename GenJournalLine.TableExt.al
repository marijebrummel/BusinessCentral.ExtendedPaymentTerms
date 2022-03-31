tableextension 50102 "PTE General Journal Line" extends "Gen. Journal Line"
{
    fields
    {
        field(11020263; "Pmt. Discount Date 2"; Date)
        {
            Caption = 'Pmt. Discount Date 2';
            Description = '4PS';
        }
        field(11020264; "Payment Discount % 2"; Decimal)
        {
            Caption = 'Payment Discount % 2';
            DecimalPlaces = 0 : 5;
            Description = '4PS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11020265; "Pmt. Discount Date 3"; Date)
        {
            Caption = 'Pmt. Discount Date 3';
            Description = '4PS';
        }
        field(11020266; "Payment Discount % 3"; Decimal)
        {
            Caption = 'Payment Discount % 3';
            DecimalPlaces = 0 : 5;
            Description = '4PS';
            MaxValue = 100;
            MinValue = 0;
        }
    }

}

// TODO Create Event Subscriber to OnAfterCopyGenJnlLineFromSalesHeaderPayment