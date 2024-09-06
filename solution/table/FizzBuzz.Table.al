table 99100 "FizzBuzz"
{
    DataClassification = CustomerContent;
    Caption = 'FizzBuzz';
    DataPerCompany = false;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Caption = 'No.';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}