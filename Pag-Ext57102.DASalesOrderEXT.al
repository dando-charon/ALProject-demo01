namespace ALProject.ALProject;

using Microsoft.Sales.Document;

pageextension 57102 "DA  Sales Order EXT" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("DA memo"; Rec."DA memo")
            {
                ApplicationArea = all;
            }
        }

    }
}
