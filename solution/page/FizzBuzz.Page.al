page 99100 "FizzBuzz"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = FizzBuzz;
    Caption = 'FizzBuzz';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(FizzBuzzText; GetSolution())
                {
                    ApplicationArea = All;
                    Caption = 'Solution';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Solve)
            {
                ApplicationArea = All;
                Caption = 'Solve';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    SolutionDict := FizzBuzzSolve.Solve(Rec);
                end;
            }
        }
    }

    local procedure GetSolution(): Text
    begin
        if SolutionDict.ContainsKey(Rec."No.") then
            exit(SolutionDict.Get(Rec."No."));
        exit('');
    end;

    var
        FizzBuzzSolve: Codeunit "FizzBuzz Solve";
        SolutionDict: Dictionary of [Integer, Text];

}