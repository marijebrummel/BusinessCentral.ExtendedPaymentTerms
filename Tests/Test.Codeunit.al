codeunit 50149 "PTE Test Ext. Payment Terms"
{
    Subtype = Test;

    [Test]
    procedure TestExtPaymentTerms()
    begin
        // # GIVEN
        CreateExtendedPaymentTerms();
        CreateVendorWithPaymentTerms();


        // # WHEN

        // # THEN

    end;

    local procedure CreateExtendedPaymentTerms()
    var
        PaymentTerms: Record "Payment Terms";
    begin
        PaymentTerms.Code := 'TEST';
        PaymentTerms.Description := 'Automated Test';
        PaymentTerms."Discount %" := 3;
        PaymentTerms."Discount % 2" := 2;
        PaymentTerms."Discount %" := 1;
        PaymentTerms.Insert();
    end;

    local procedure CreateVendorWithPaymentTerms()
    begin

    end;

}