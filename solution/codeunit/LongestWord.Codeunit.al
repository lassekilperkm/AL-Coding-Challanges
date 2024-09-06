codeunit 99200 "Longest Word"
{
    internal procedure FindLongestWord(): Text
    var
        ContentText: Text;
        Word: Text;
        CRLF: Text;
        LongestWord: Text;
        Words: List of [Text];
    begin
        LongestWord := '';
        HttpClient.Clear();
        HttpClient.Get(WordListUrl, HttpResponseMessage);
        if not HttpResponseMessage.IsSuccessStatusCode() then
            Error('%1 %2', HttpResponseMessage.HttpStatusCode, HttpResponseMessage.ReasonPhrase);

        CRLF := TypeHelper.CRLFSeparator();
        HttpContent := HttpResponseMessage.Content();
        HttpContent.ReadAs(ContentText);

        if StrLen(ContentText) > 0 then
            Words := ContentText.Split(CRLF[2]);

        if Words.Count > 0 then
            foreach Word in Words do
                if not HasForbiddenChars(Word) then
                    if StrLen(Word) > StrLen(LongestWord) then
                        LongestWord := Word;

        exit(LongestWord);
    end;

    local procedure HasForbiddenChars(Word: Text): Boolean
    var
        LowerCaseWord: Text;
    begin
        LowerCaseWord := Word.ToLower();
        case true of
            LowerCaseWord.Contains('g'),
            LowerCaseWord.Contains('k'),
            LowerCaseWord.Contains('m'),
            LowerCaseWord.Contains('q'),
            LowerCaseWord.Contains('v'),
            LowerCaseWord.Contains('w'),
            LowerCaseWord.Contains('x'),
            LowerCaseWord.Contains('z'),
            LowerCaseWord.Contains('i'),
            LowerCaseWord.Contains('o'):
                exit(true);
            else
                exit(false);
        end;
    end;

    var
        TypeHelper: Codeunit "Type Helper";
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        HttpContent: HttpContent;
        WordListUrl: Label 'https://raw.githubusercontent.com/dwyl/english-words/master/words.txt', Locked = true;
}