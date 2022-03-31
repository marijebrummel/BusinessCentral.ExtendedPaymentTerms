tableextension 50100 "PTE Payment Terms" extends "Payment Terms"
{
    fields
    {
        modify("Discount %")
        {
            trigger OnAfterValidate()
            begin
                CheckFormulas();
            end;
        }
        modify("Discount Date Calculation")
        {
            trigger OnAfterValidate()
            begin
                CheckFormulas();
            end;
        }
        field(11012000; "Discount Date Calculation 2"; DateFormula)
        {
            Caption = 'Discount Date Calculation 2';
            Description = '4PS';

            trigger OnValidate()
            begin
                CheckFormulas;
            end;
        }
        field(11012001; "Discount % 2"; Decimal)
        {
            Caption = 'Discount % 2';
            DecimalPlaces = 0 : 5;
            Description = '4PS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11012002; "Discount Date Calculation 3"; DateFormula)
        {
            Caption = 'Discount Date Calculation 3';
            Description = '4PS';

            trigger OnValidate()
            begin
                CheckFormulas;
            end;
        }
        field(11012003; "Discount % 3"; Decimal)
        {
            Caption = 'Discount % 3';
            DecimalPlaces = 0 : 5;
            Description = '4PS';
            MaxValue = 100;
            MinValue = 0;
        }
    }
    procedure CheckFormulas()
    var
        Text001: Label 'Due Dates of all formulas must entered based on posting date.'; //**4PS.n
        RefDate: array[5] of Date;
    begin
        //**4PS
        // Startdate
        RefDate[1] := 20000101D; // Take a long month (31 days as a reference month). In this case 1st jan. 2000.

        // Discount Date 1
        if Format("Discount Date Calculation") <> '' then
            RefDate[2] := CalcDate("Discount Date Calculation", RefDate[1])
        else
            RefDate[2] := RefDate[1];

        // Discount Date 2
        if Format("Discount Date Calculation 2") <> '' then
            RefDate[3] := CalcDate("Discount Date Calculation 2", RefDate[1])
        else
            RefDate[3] := RefDate[2];

        // Discount Date 3
        if Format("Discount Date Calculation 3") <> '' then
            RefDate[4] := CalcDate("Discount Date Calculation 3", RefDate[1])
        else
            RefDate[4] := RefDate[3];

        // Due Date
        RefDate[5] := CalcDate("Due Date Calculation", RefDate[1]);

        if RefDate[1] > RefDate[2] then
            Error(Text001)
        else
            if RefDate[2] > RefDate[3] then
                Error(Text001)
            else
                if RefDate[3] > RefDate[4] then
                    Error(Text001)
                else
                    if RefDate[4] > RefDate[5] then
                        Error(Text001);
    end;
}