table 50310 "Sales By Vendor Page"
{
    ObsoleteState = Removed;
    ObsoleteReason = 'Eliminada porque se reemplazó por página 50300.';
    ObsoleteTag = '1.0.0.2';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Campo eliminado';
            ObsoleteTag = '1.0.0.2';
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Campo eliminado';
            ObsoleteTag = '1.0.0.2';
        }
        field(3; "Salesperson Code"; Code[20])
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Campo eliminado';
            ObsoleteTag = '1.0.0.2';
        }
        field(4; Amount; Decimal)
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Campo eliminado';
            ObsoleteTag = '1.0.0.2';
        }
    }

    keys
    {
        key(PK; "Document No.") { Clustered = true; }
    }
}

