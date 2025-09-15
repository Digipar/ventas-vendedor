table 50313 "Sales By Vendor Temp 2"
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
    }

    keys
    {
        key(PK; DocumentNo, SalespersonCode, Amount)
        {
            Clustered = true;
        }
    }
}