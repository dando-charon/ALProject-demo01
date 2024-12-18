namespace ALProject.ALProject;

using Microsoft.Sales.Customer;

pageextension 57101 "DA customer card ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("DA phone number"; Rec."DA phone number")
            {
                ApplicationArea = all;
                ExtendedDatatype = PhoneNo;
            }
            field("DA location"; Rec."DA location")
            {
                ApplicationArea = all;
            }
            field("DA customer number2"; Rec."DA customer number2")
            {
                ApplicationArea = all;
            }
            field("DA No of branch"; Rec."DA No of branch")
            {
                ApplicationArea = all;
            }

            field("DA memo"; Rec."DA memo")
            {
                ApplicationArea = all;
            }
        }
    }
}
