codeunit 50105 "PTE Customer Ledger Entry"
{
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."Pmt. Disc. Tolerance Date 2" := GenJournalLine."Pmt. Discount Date 2";
        CustLedgerEntry."Pmt. Disc. Tolerance Date 3" := GenJournalLine."Pmt. Discount Date 3";
    end;
}