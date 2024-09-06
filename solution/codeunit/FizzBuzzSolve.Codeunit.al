codeunit 99101 "FizzBuzz Solve"
{
    internal procedure Solve(FizzBuzz: Record FizzBuzz): Dictionary of [Integer, Text]
    var
        Solution: Dictionary of [Integer, Text];
        Display: Text;
    begin
        if FizzBuzz.FindSet() then
            repeat
                Display := '';
                if FizzBuzz."No." Mod 3 = 0 then
                    Display += FizzText;
                if FizzBuzz."No." Mod 5 = 0 then
                    Display += BuzzText;
                if FizzBuzz."No." Mod 7 = 0 then
                    Display += FuzzText;

                if Display = '' then
                    Display := Format(FizzBuzz."No.");

                if not Solution.ContainsKey(FizzBuzz."No.") then
                    Solution.Add(FizzBuzz."No.", Display);
            until FizzBuzz.Next() = 0;
        exit(Solution);
    end;

    var
        FizzText: Label 'Fizz', locked = true;
        BuzzText: Label 'Buzz', locked = true;
        FuzzText: Label 'Fuzz', locked = true;
}