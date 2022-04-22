codeunit 50104 "PTE CBG Statement Line"
{

    // TODO, deze functie bestaat helemaal niet in standaard BC. Ik denk dat we een keer heel telebankieren moeten onderzoeken waar daar uberhaupt aan gesleuteld is


    [EventSubscriber(ObjectType::Table, Database::"CBG Statement Line", 'OnAfterValidateEvent', 'Applies-to Doc. No.', false, false)]
    local procedure GetSalesAmountToApply()
    begin

        // procedure GetSalesAmountToApply(Date: Date; var CustLedgerEntry: Record "Cust. Ledger Entry") AmountToApply: Decimal
        // var
        //     BankAccount: Record "Bank Account";
        //     DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        //     BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        //     lvBankAccount: Record "Bank Account";
        //     PaymentBlockedAccount: Decimal;
        //     OpenBlockedAccount: Decimal;
        //     CurrencyExchangeRate: Record "Currency Exchange Rate";
        // begin
        //     //**4PS DP01123
        //     if CustLedgerEntry."Entry No." = 0 then
        //         exit(0);

        //     CustLedgerEntry.CalcFields("Remaining Amount");
        //     AmountToApply := CustLedgerEntry."Remaining Amount";

        //     //Detect BAccount
        //     if CustLedgerEntry."Blocked Amount (Subcontracting" <> 0 then
        //         if BankAccount.Get("Statement No.") then;

        //     //**Call C040601 sn
        //     if CustLedgerEntry."Blocked Amount (Subcontracting" <> 0 then begin
        //         CustLedgerEntry.CalcFields("Original Amount");
        //         if AmountToApply <> CustLedgerEntry."Original Amount" then begin
        //             DetailedCustLedgEntry.SetCurrentKey("Cust. Ledger Entry No.");
        //             DetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
        //             DetailedCustLedgEntry.SetRange("Entry Type", DetailedCustLedgEntry."Entry Type"::Application);
        //             DetailedCustLedgEntry.SetRange("Document Type", DetailedCustLedgEntry."Document Type"::Payment);
        //             if DetailedCustLedgEntry.FindSet then
        //                 repeat
        //                     BankAccountLedgerEntry.SetCurrentKey("Document No.", "Posting Date");
        //                     BankAccountLedgerEntry.SetRange("Document No.", DetailedCustLedgEntry."Document No.");
        //                     BankAccountLedgerEntry.SetRange("Posting Date", DetailedCustLedgEntry."Posting Date");
        //                     if BankAccountLedgerEntry.FindFirst then begin
        //                         lvBankAccount.SetRange("No.", BankAccountLedgerEntry."Bank Account No.");
        //                         lvBankAccount.SetRange("B-Account", true);
        //                         if not BankAccount.IsEmpty then
        //                             PaymentBlockedAccount := PaymentBlockedAccount - DetailedCustLedgEntry.Amount; //**amount has a negative value
        //                     end;
        //                 until DetailedCustLedgEntry.Next = 0;
        //         end;
        //         if PaymentBlockedAccount = 0 then
        //             OpenBlockedAccount := CustLedgerEntry."Blocked Amount (Subcontracting";
        //         //** If Payments are made to Blocked Account, it is assumed that the Blocked Amount is payed,
        //         //** The amount is allowed to differ from CustLedgerEntry."Blocked Amount (Subcontracting"
        //     end;
        //     //**Call C040601 en

        //     if not BankAccount."B-Account" then begin
        //         //Subtract Payment Discount
        //         if ((Date <= CustLedgerEntry."Pmt. Discount Date") and
        //             (CustLedgerEntry."Pmt. Discount Date" <> 0D)) or
        //            ((Date <= CustLedgerEntry."Pmt. Disc. Tolerance Date") and
        //             (CustLedgerEntry."Pmt. Disc. Tolerance Date" <> 0D))
        //         then
        //             AmountToApply := AmountToApply - CustLedgerEntry."Remaining Pmt. Disc. Possible"
        //         else
        //             if ((Date <= CustLedgerEntry."Pmt. Discount Date 2") and
        //                 (CustLedgerEntry."Pmt. Discount Date 2" <> 0D)) or
        //                ((Date <= CustLedgerEntry."Pmt. Disc. Tolerance Date 2") and
        //                 (CustLedgerEntry."Pmt. Disc. Tolerance Date 2" <> 0D))
        //             then
        //                 AmountToApply := AmountToApply - CustLedgerEntry."Remain. Pmt. Disc. Possible 2"
        //             else
        //                 if ((Date <= CustLedgerEntry."Pmt. Discount Date 3") and
        //                     (CustLedgerEntry."Pmt. Discount Date 3" <> 0D)) or
        //                    ((Date <= CustLedgerEntry."Pmt. Disc. Tolerance Date 3") and
        //                     (CustLedgerEntry."Pmt. Disc. Tolerance Date 3" <> 0D))
        //                 then
        //                     AmountToApply := AmountToApply - CustLedgerEntry."Remain. Pmt. Disc. Possible 3";

        //         //Subtract Blocked Amount
        //         if AmountToApply > OpenBlockedAccount then
        //             AmountToApply := AmountToApply - OpenBlockedAccount;
        //     end else
        //         //Reduce to Blocked Amount
        //         if AmountToApply > CustLedgerEntry."Blocked Amount (Subcontracting" then
        //             AmountToApply := CustLedgerEntry."Blocked Amount (Subcontracting";

        //     if CBGStatement.Currency = CustLedgerEntry."Currency Code" then
        //         exit;
        //     GetCBGStatementHeader();
        //     GetCurrency();

        //     case true of
        //         (CBGStatement.Currency = '') and (CustLedgerEntry."Currency Code" <> ''):
        //             if AmountToApply = CustLedgerEntry."Remaining Amount" then begin
        //                 CustLedgerEntry.CalcFields("Remaining Amt. (LCY)");
        //                 AmountToApply := CustLedgerEntry."Remaining Amt. (LCY)";
        //             end else
        //                 AmountToApply :=
        //                     Round(CurrencyExchangeRate.ExchangeAmtFCYToLCY(0, '', Date, CBGStatement.Currency, AmountToApply,
        //                         CurrencyExchangeRate.ExchangeRate(0, '', Date, CBGStatement.Currency, "Account Type" = "Account Type"::Customer),
        //                         "Account Type" = "Account Type"::Customer),
        //                         Currency."Amount Rounding Precision");
        //         (CBGStatement.Currency <> '') and (CustLedgerEntry."Currency Code" = ''):
        //             AmountToApply :=
        //                 Round(CurrencyExchangeRate.ExchangeAmtLCYToFCY(0, '', Date, CBGStatement.Currency, AmountToApply,
        //                     CurrencyExchangeRate.ExchangeRate(0, '', Date, CBGStatement.Currency, "Account Type" = "Account Type"::Customer),
        //                     "Account Type" = "Account Type"::Customer),
        //                     Currency."Amount Rounding Precision");
        //         (CBGStatement.Currency <> '') and (CustLedgerEntry."Currency Code" <> ''):
        //             AmountToApply :=
        //                   Round(CurrencyExchangeRate.ExchangeAmtFCYToFCY(Date, CustLedgerEntry."Currency Code", CBGStatement.Currency,
        //                     AmountToApply, "Account Type" = "Account Type"::Customer), Currency."Amount Rounding Precision");
        //     end;
        // end;


    end;

}