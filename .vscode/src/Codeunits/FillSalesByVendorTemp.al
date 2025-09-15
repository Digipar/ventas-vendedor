codeunit 50303 "Fill Sales By Vendor Temp"
{
    procedure RunWithFilter(FromSalesperson: Code[20]; ToSalesperson: Code[20]): Record "Sales By Vendor Temp 3"
    var
        SalesInvLine: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        Salesperson: Record "Salesperson/Purchaser";
        Customer: Record Customer;
        Temp: Record "Sales By Vendor Temp 3";
    begin
        Temp.DeleteAll();

        if SalesInvLine.FindSet() then
            repeat
                if SalesInvHeader.Get(SalesInvLine."Document No.") then begin
                    Message('Documento: %1, SalespersonCode: >%2<', SalesInvLine."Document No.", SalesInvHeader."Salesperson Code");
                    if (FromSalesperson = '') or (SalesInvHeader."Salesperson Code" = FromSalesperson) then begin
                        Message('Comparando: FromSalesperson=%1, SalespersonCode=%2', FromSalesperson, SalesInvHeader."Salesperson Code");
                        if (SalesInvHeader."Salesperson Code" <> '') then begin
                            Temp.Init();
                            Temp.DocumentNo := SalesInvLine."Document No.";
                            Temp.SellToCustomerNo := SalesInvHeader."Sell-to Customer No.";
                            if Customer.Get(SalesInvHeader."Sell-to Customer No.") then
                                Temp.SellToCustomerName := Customer.Name
                            else
                                Temp.SellToCustomerName := '';
                            Message('Insertando registro: DocumentNo=>%1<, SalespersonCode=>%2<', SalesInvLine."Document No.", SalesInvHeader."Salesperson Code");
                            Temp.SalespersonCode := SalesInvHeader."Salesperson Code";
                            if Salesperson.Get(SalesInvHeader."Salesperson Code") then
                                Temp.SalespersonName := Salesperson.Name
                            else
                                Temp.SalespersonName := SalesInvHeader."Salesperson Code";
                            Temp.Amount := SalesInvLine."Line Amount";
                            Temp.FechaVenta := SalesInvHeader."Posting Date";
                            Temp.Insert();
                        end;
                    end;
                end;
            until SalesInvLine.Next() = 0;

        exit(Temp);
    end;

    procedure RunWithFilterFechas(FromSalesperson: Code[20]; ToSalesperson: Code[20]; FechaDesde: Date; FechaHasta: Date): Record "Sales By Vendor Temp Nueva"
    var
        SalesInvLine: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        TempNueva: Record "Sales By Vendor Temp Nueva";
        Salesperson: Record "Salesperson/Purchaser";
    begin
        TempNueva.DeleteAll();
        if SalesInvLine.FindSet() then
            repeat
                if SalesInvHeader.Get(SalesInvLine."Document No.") then begin
                    if ((FromSalesperson = '') or (SalesInvHeader."Salesperson Code" = FromSalesperson)) and
                       ((FechaDesde = 0D) or (SalesInvHeader."Posting Date" >= FechaDesde)) and
                       ((FechaHasta = 0D) or (SalesInvHeader."Posting Date" <= FechaHasta)) then begin
                        if not TempNueva.Get(SalesInvHeader."Salesperson Code") then begin
                            TempNueva.Init();
                            TempNueva.SalespersonCode := SalesInvHeader."Salesperson Code";
                            if Salesperson.Get(SalesInvHeader."Salesperson Code") then
                                TempNueva.SalespersonName := Salesperson.Name
                            else
                                TempNueva.SalespersonName := SalesInvHeader."Salesperson Code";
                            TempNueva.Amount := SalesInvLine."Line Amount";
                            TempNueva.FechaVenta := SalesInvHeader."Posting Date";
                            TempNueva.Insert();
                        end else begin
                            TempNueva.Amount := TempNueva.Amount + SalesInvLine."Line Amount";
                            TempNueva.Modify();
                        end;
                    end;
                end;
            until SalesInvLine.Next() = 0;
        exit(TempNueva);
    end;
}