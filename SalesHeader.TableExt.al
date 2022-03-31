tableextension 50101 "PTE Sales Header" extends "Sales Header"
{
    fields
    {
        field(11020258; "Payment Discount % 2"; Decimal)
        {
            Caption = 'Payment Discount % 2';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date"), FieldNo("Document Date")]) then
                    TestStatusOpen;
            end;
        }
        field(11020259; "Pmt. Discount Date 2"; Date)
        {
            Caption = 'Pmt. Discount Date 2';
        }
        field(11020260; "Payment Discount % 3"; Decimal)
        {
            Caption = 'Payment Discount % 3';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date"), FieldNo("Document Date")]) then
                    TestStatusOpen;
            end;
        }
        field(11020261; "Pmt. Discount Date 3"; Date)
        {
            Caption = 'Pmt. Discount Date 3';
        }
    }

}

// TODO Add event subscriber to OnValidatePaymentTermsCodeOnBeforeValidateDueDate and OnValidatePaymentTermsCodeOnBeforeCalcPmtDiscDate