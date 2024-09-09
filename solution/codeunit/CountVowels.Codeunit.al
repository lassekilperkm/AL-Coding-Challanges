codeunit 99120 "Count Vowels"
{
    internal procedure Count(Input: Text): Integer
    var
        LowerCaseInput: Text;
        VowelCount: Integer;
    begin
        VowelCount := 0;
        LowerCaseInput := Input.ToLower();
        if StrLen(LowerCaseInput) > 0 then begin
            VowelCount := StrLen(DelChr(LowerCaseInput, '=', DelChr(LowerCaseInput, '=', 'a|e|i|o|u')));
        end;

        exit(VowelCount);
    end;
}