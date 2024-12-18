namespace ALProject.ALProject;

using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;

tableextension 57101 "DA  Sales Header EXT" extends "Sales Header"
{
    fields
    {
        field(57100; "DA memo"; Text[100])
        {
            Caption = 'DA memo';
            DataClassification = ToBeClassified;
        }

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()

            begin
                GetCustomerMemo()
            end;
        }
    }

    local procedure GetCustomerMemo()
    var
        customer: Record Customer;

    begin
        if customer.get(Rec."Sell-to Customer No.") then
            rec."DA memo" := customer."DA memo";
    end;
}
