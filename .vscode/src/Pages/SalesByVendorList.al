page 50312 "Sales By Vendor List 2"
{
    PageType = List;
    SourceTable = "Sales By Vendor Temp Nueva";
    ApplicationArea = All;
    Caption = 'Listado de Ventas por Vendedor';
    UsageCategory = None;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SalespersonName; GetSalespersonNameVisible())
                {
                    Caption = 'Nombre Vendedor';
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Importe Total';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PostedSalesInvHeader: Record "Sales Invoice Header";
                        Count: Integer;
                    begin
                        PostedSalesInvHeader.SetFilter("Salesperson Code", Rec.SalespersonCode);
                        PAGE.Run(143, PostedSalesInvHeader);
                    end;
                }
            }
        }


    }

    actions
    {
        area(processing)
        {
            action(Actualizar)
            {
                Caption = 'Actualizar';
                Image = Refresh;
                trigger OnAction()
                var
                    FillSalesByVendorTemp: Codeunit "Fill Sales By Vendor Temp";
                    VendedorFiltro: Code[20];
                    FechaDesde: Date;
                    FechaHasta: Date;
                begin
                    Rec.DeleteAll();
                    VendedorFiltro := Rec.SalespersonCode;
                    FechaDesde := 0D;
                    FechaHasta := 0D;
                    FillSalesByVendorTemp.RunWithFilterFechas(VendedorFiltro, '', FechaDesde, FechaHasta);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    local procedure GetSalespersonNameVisible(): Text[100]
    begin
        if Rec.SalespersonName = '' then
            exit('SIN VENDEDOR');
        exit(Rec.SalespersonName);
    end;
}
