table 50319 "Sales By Vendor Temp Nueva"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SalespersonCode; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; SalespersonName; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(4; FechaVenta; Date)
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
