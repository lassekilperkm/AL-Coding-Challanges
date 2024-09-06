page 99120 "How Many Vowels"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(HowManyVowels)
            {
                Caption = 'How many vowels';
                field(Input; Input)
                {
                    ApplicationArea = All;
                    Caption = 'Input';
                }
                field(VowelCount; VowelCount)
                {
                    ApplicationArea = All;
                    Caption = 'Vowel Count';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CountVowels)
            {
                ApplicationArea = All;
                Caption = 'Count Vowels';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    VowelCount := CountVowels.Count(Input);
                end;
            }
        }
    }

    var
        CountVowels: Codeunit "Count Vowels";
        Input: Text;
        VowelCount: Integer;
}