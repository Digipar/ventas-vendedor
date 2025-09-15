page 50310 "Sales History by Salesperson"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Sales Header";
    UsageCategory = Lists;
    Caption = 'Histórico de Ventas por Vendedor';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Salesperson Code"; Rec."Salesperson Code") { }
                field("Document Type"; Rec."Document Type") { }
                field(Amount; Rec.Amount) { }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(FilterBySalesperson)
            {
                Caption = 'Filtrar por Vendedor';
                ApplicationArea = All;
                Image = Filter;

                trigger OnAction()
                var
                    SalespersonRec: Record "Salesperson/Purchaser";
                    Selection: Integer;
                begin
                    if SalespersonRec.FindSet() then begin
                        repeat
                            Selection := StrMenu(
                                SalespersonRec.Code + ' - ' + SalespersonRec.Name,
                                1,
                                'Seleccione Vendedor');

                            if Selection > 0 then begin
                                Rec.SetFilter("Salesperson Code", SalespersonRec.Code);
                                CurrPage.Update(false);
                                exit;
                            end;
                        until SalespersonRec.Next() = 0;
                    end;
                end;
            }
        }
    }
}


