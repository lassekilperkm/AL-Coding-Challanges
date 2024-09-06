codeunit 99130 "Hacker Language"
{
    internal procedure Convert(Input: Text): Text
    var
        Output: Text;
    begin
        Output := '';
        if StrLen(Input) > 0 then begin
            Output := Input.Replace('a', '4').Replace('A', '4')
                .Replace('e', '3').Replace('E', '3')
                .Replace('i', '1').Replace('I', '1')
                .Replace('o', '0').Replace('O', '0')
                .Replace('s', '5').Replace('S', '5');
        end;
        exit(Output);
    end;
}