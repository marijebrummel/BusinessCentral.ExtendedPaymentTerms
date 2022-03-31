codeunit 50102 "PTE Gen. Journal Post-Line"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterCalcPmtDiscount', '', false, false)]
    local procedure OnAfterCalcPmtDiscount()
    begin
        // TODO, check if this is the correct event
    end;
}