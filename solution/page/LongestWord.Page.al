page 99200 "Longest Word"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Longest Word';
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Word; Word)
                {
                    ApplicationArea = All;
                    Caption = 'Found Word';
                    Editable = false;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FindWord)
            {
                ApplicationArea = All;
                Caption = 'Find Word';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Word := LongestWord.FindLongestWord();
                end;
            }
        }
    }

    var
        LongestWord: Codeunit "Longest Word";
        Word: Text;
}