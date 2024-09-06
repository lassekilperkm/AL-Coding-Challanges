page 99130 "Hacker Language"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Hacker Language';

    layout
    {
        area(Content)
        {
            group(Convert)
            {
                Caption = 'Convert';
                field(Input; Input)
                {
                    ApplicationArea = All;
                    Caption = 'Input';
                }
                field(Output; Output)
                {
                    ApplicationArea = All;
                    Caption = 'Output';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ConvertAction)
            {
                ApplicationArea = All;
                Caption = 'Convert';
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Output := HackerLanguage.Convert(Input);
                end;
            }
        }
    }

    var
        HackerLanguage: Codeunit "Hacker Language";
        Input: Text;
        Output: Text;
}