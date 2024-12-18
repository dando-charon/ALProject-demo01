namespace ALProject.ALProject;

using Microsoft.Sales.Customer;
using Microsoft.Inventory.Location;

tableextension 57100 "DA Customer EXT" extends Customer
{
    fields
    {
        field(57100; "DA phone number"; Text[20])
        {
            Caption = 'DA phone number';
            DataClassification = ToBeClassified;
            ToolTip = 'hogehoge';
        }
        field(57101; "DA customer number2"; Code[20])
        {
            Caption = 'DA customer number2';
            DataClassification = ToBeClassified;
        }
        field(57102; "DA location"; Code[10])
        {
            Caption = 'DA location';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(57103; "DA No of branch"; Integer)
        {
            Caption = 'DA No of branch';
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Bill-to Customer No." = field("No.")));
        }

        field(57104; "DA memo"; Text[100])
        {
            Caption = 'DA memo';
            DataClassification = ToBeClassified;
            ToolTip = '注意書き';
        }
    }
}
