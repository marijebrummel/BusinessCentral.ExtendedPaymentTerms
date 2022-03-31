tableextension 50103 "PTE Cust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(11012291; "Pmt. Discount Date 2"; Date)
        {
            Caption = 'Pmt. Discount Date 2';
            Description = '4PS';

            trigger OnValidate()
            begin
                TestField(Open, true);
            end;
        }
        field(11012292; "Original Pmt. Disc. Possible 2"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Pmt. Disc. Possible 2';
            Description = '4PS';
            Editable = false;
        }
        field(11012293; "Pmt. Disc. Tolerance Date 2"; Date)
        {
            Caption = 'Pmt. Disc. Tolerance Date 2';
            Description = '4PS';

            trigger OnValidate()
            begin
                TestField(Open, true);
            end;
        }
        field(11012294; "Pmt. Discount Date 3"; Date)
        {
            Caption = 'Pmt. Discount Date 3';
            Description = '4PS';

            trigger OnValidate()
            begin
                TestField(Open, true);
            end;
        }
        field(11012295; "Original Pmt. Disc. Possible 3"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Pmt. Disc. Possible 3';
            Description = '4PS';
            Editable = false;
        }
        field(11012296; "Pmt. Disc. Tolerance Date 3"; Date)
        {
            Caption = 'Pmt. Disc. Tolerance Date 3';
            Description = '4PS';

            trigger OnValidate()
            begin
                TestField(Open, true);
            end;
        }
        field(11012297; "Remain. Pmt. Disc. Possible 2"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Pmt. Disc. Possible 2';
            Description = '4PS';

            trigger OnValidate()
            var
                Text000: Label 'must have the same sign as %1';
                Text001: Label 'must not be larger than %1';
            begin
                TestField(Open, true);
                CalcFields(Amount, "Original Amount");

                if "Remain. Pmt. Disc. Possible 2" * Amount < 0 then
                    FieldError("Remain. Pmt. Disc. Possible 2", StrSubstNo(Text000, FieldCaption(Amount)));

                if Abs("Remain. Pmt. Disc. Possible 2") > Abs("Original Amount") then
                    FieldError("Remain. Pmt. Disc. Possible 2", StrSubstNo(Text001, FieldCaption("Original Amount")));
            end;
        }
        field(11012298; "Remain. Pmt. Disc. Possible 3"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Pmt. Disc. Possible 3';
            Description = '4PS';

            trigger OnValidate()
            var
                Text000: Label 'must have the same sign as %1';
                Text001: Label 'must not be larger than %1';
            begin
                TestField(Open, true);
                CalcFields(Amount, "Original Amount");

                if "Remain. Pmt. Disc. Possible 3" * Amount < 0 then
                    FieldError("Remain. Pmt. Disc. Possible 3", StrSubstNo(Text000, FieldCaption(Amount)));

                if Abs("Remain. Pmt. Disc. Possible 3") > Abs("Original Amount") then
                    FieldError("Remain. Pmt. Disc. Possible 3", StrSubstNo(Text001, FieldCaption("Original Amount")));
            end;
        }
    }

}