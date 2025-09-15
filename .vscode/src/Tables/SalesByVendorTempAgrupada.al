table 50318 "Sales By Vendor Temp Agrupada"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SellToCustomerNo; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; SellToCustomerName; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; SalespersonCode; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; SalespersonName; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(6; FechaVenta; Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; SalespersonCode)
        {
            Clustered = true;
        }
    }
}
