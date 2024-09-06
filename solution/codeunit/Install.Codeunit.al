codeunit 99100 "FizzBuzz Install"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        FizzBuzz: Record FizzBuzz;
        i: Integer;
    begin
        if FizzBuzz.IsEmpty() then
            for i := 1 to 100 do begin
                FizzBuzz.Init();
                FizzBuzz."No." := i;
                FizzBuzz.Insert();
            end;
    end;
}