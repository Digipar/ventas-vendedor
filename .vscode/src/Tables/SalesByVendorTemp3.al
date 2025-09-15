table 50314 "Sales By Vendor Temp 3"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; SellToCustomerNo; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; SellToCustomerName; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; SalespersonCode; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(5; SalespersonName; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(6; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(7; FechaVenta; Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; DocumentNo, SalespersonCode, Amount)
        {
            Clustered = true;
        }
    }
}