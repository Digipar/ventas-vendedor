page 50315 "Filtro por Vendedor"
{
    PageType = Card;
    SourceTable = "Salesperson/Purchaser";
    ApplicationArea = All;
    Caption = 'Ventas por Vendedor';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(VendedorSeleccionado; VendedorSeleccionado)
                {
                    Caption = 'Código Vendedor';
                    TableRelation = "Salesperson/Purchaser".Code;
                    Lookup = true;
                    trigger OnValidate()
                    var
                        Salesperson: Record "Salesperson/Purchaser";
                    begin
                        if Salesperson.Get(VendedorSeleccionado) then
                            NombreVendedor := Salesperson.Name
                        else
                            NombreVendedor := '';
                    end;
                }
                field(NombreVendedor; NombreVendedor)
                {
                    Caption = 'Nombre Vendedor';
                    Editable = false;
                }
                field(FechaDesde; FechaDesde)
                {
                    Caption = 'Fecha Desde';
                }
                field(FechaHasta; FechaHasta)
                {
                    Caption = 'Fecha Hasta';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(VerVentasPorVendedor)
            {
                Caption = 'Ver Ventas por Vendedor';
                Image = View;
                trigger OnAction()
                var
                    FillSalesByVendorTemp: Codeunit "Fill Sales By Vendor Temp";
                begin
                    FillSalesByVendorTemp.RunWithFilterFechas(VendedorSeleccionado, VendedorSeleccionado, FechaDesde, FechaHasta);
                    PAGE.Run(PAGE::"Sales By Vendor List 2");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        if Salesperson.Get(VendedorSeleccionado) then
            NombreVendedor := Salesperson.Name
        else
            NombreVendedor := '';
    end;

    var
        VendedorSeleccionado: Code[20];
        NombreVendedor: Text[100];
        FechaDesde: Date;
        FechaHasta: Date;
}
