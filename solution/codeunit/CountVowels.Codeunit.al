codeunit 99120 "Count Vowels"
{
    internal procedure Count(Input: Text): Integer
    var
        VowelCount: Integer;
    begin
        VowelCount := 0;
        if StrLen(Input) > 0 then begin
            VowelCount := StrLen(DelChr(Input, '=', DelChr(Input, '=', 'a|e|i|o|u')));
        end;

        exit(VowelCount);
    end;
}