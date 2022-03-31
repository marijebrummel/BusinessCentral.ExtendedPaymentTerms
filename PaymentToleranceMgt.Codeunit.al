codeunit 50103 "PTE Payment Tolerance Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Payment Tolerance Management", 'OnAfterCalcMaxPmtTolerance', '', false, false)]
    local procedure MyProcedure()
    begin
        // TODO Request Event
    end;
}