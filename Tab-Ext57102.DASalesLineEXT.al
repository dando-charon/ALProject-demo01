namespace ALProject.ALProject;

using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;

tableextension 57102 "DA Sales Line EXT" extends "Sales line"
{
    fields
    {
        // field(57100; "DA sales invoice line qty"; Text[100])
        // {
        //     Caption = '過去販売個数';
        //     DataClassification = ToBeClassified;
        // }

        modify("No.")
        {
            trigger OnAfterValidate();

            begin
                ShowPostedOrderInTotal();
                ShowPostedQtyInTotal();
            end;

        }
    }

    local procedure ShowPostedOrderInTotal()
    var
        SalesInvLine: Record "Sales Invoice Line";

    begin
        SalesInvLine.SetRange("No.", Rec."No.");
        SalesInvLine.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        if not SalesInvLine.IsEmpty then
            Message('販売実績あり');
        Message('過去の受注回数 : %1 ', Format(SalesInvLine.Count));

    end;

    local procedure ShowPostedQtyInTotal()
    var
        SalesInvLine: Record "Sales Invoice Line";
        qty: Decimal;

    begin
        SalesInvLine.SetRange("No.", Rec."No.");
        //Message(Format(SalesInvLine.Count));
        SalesInvLine.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        if SalesInvLine.IsEmpty then begin
            Message('販売実績なし001');
            qty := 0;
        end

        else begin
            Message('過去の販売実績を確認中');
            qty := 0;

            if SalesInvLine.findSet() then begin
                //repeatの代わりに下記のように書くことができる。
                //SalesInvLine.CalcSums(Quantity,"Line Amount");
                //qty:= SalesInvLine.Quantity;
                //amount := SalesInvLine."Line Amount";
                repeat
                    // データを表示
                    Message('商品名 : %1, Line No.: %2, Item No.: %3, Quantity: %4, 注文者 : %5',
                            SalesInvLine.Description,
                            SalesInvLine."Line No.",
                            SalesInvLine."No.",
                            SalesInvLine.Quantity,
                            SalesInvLine."Bill-to Customer No.");
                    qty := qty + SalesInvLine.Quantity;
                until SalesInvLine.next() = 0;
                Message('過去の販売実績累計 : %1 個', qty);
            end else begin
                Message('No Sales Invoice Lines found.');
            end;
        end;


    end;

    //sales inv lineから販売実績を取り出して、リストを１件ずつ確認するサンプル
    //     procedure GetSalesForProduct(ProductNo: Code)
    // var
    //     SalesInvoiceLine: Record "Sales Invoice Line";
    //     SalesList: List of [Record "Sales Invoice Line"];
    // begin
    //     // 特定の製品の販売実績を取得
    //     SalesInvoiceLine.SetRange("No.", ProductNo);
    //     if SalesInvoiceLine.FindSet() then begin
    //         repeat
    //             SalesList.Add(SalesInvoiceLine);
    //         until SalesInvoiceLine.Next() = 0;
    //     end;

    //     // リストを表示
    //     foreach Sales in SalesList do begin
    //         Message('Product No: %1, Quantity: %2, Amount: %3', Sales."No.", Sales.Quantity, Sales.Amount);
    //     end;
    // end;

}
