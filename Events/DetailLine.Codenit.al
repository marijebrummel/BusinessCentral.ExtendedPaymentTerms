codeunit 50106 "PTE Detail Line"
{

    [EventSubscriber(ObjectType::Table, Database::"Detail Line", 'OnValidateSerialNoEntryOnBeforeValidateAmountFromCustLedgEntry', '', false, false)]
    local procedure OnValidateSerialNoEntryOnBeforeValidateAmountFromCustLedgEntry()
    begin

    end;


}