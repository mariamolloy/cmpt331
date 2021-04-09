Program CC;
    var message: string;
    var encodedMess: string;
    var secretNum: integer;
    var decodedMess: string;
    
    procedure encrypt(text: string; shift: integer; var secretMessage: string);
    var newChar: string;
    var asciiVal: integer;
    var newAscii: integer;
    var i: integer;
    begin
    text:=UpCase(text);
    for i:= 1 to Length(text) do
        begin
        asciiVal:=Ord(text[i]);
        if (asciiVal = 32) then
            newAscii:=32
        else
            newAscii:= ((asciiVal + shift - 65) mod 26) + 65;
        newChar:=Chr(newAscii);
        secretMessage:=concat(secretMessage, newChar);
        end;
    end; {end of procedure encrypt}
    
    procedure decode(text: string; shift: integer; var decodedMessage: string);
    begin
    shift:= 26 - shift;
    encrypt(text, shift, decodedMessage);
    end;
    
    procedure solve(text: string; maxShift: integer);
    var i: integer;
    var possibleMess: string;
    var toPrint: string;
    begin
    for i:=0 to maxShift do
        begin
        possibleMess:= '';
        encrypt(text, i, possibleMess);
        toPrint:=concat(': ', possibleMess);
        write('Caesar ');
        write(i);
        writeln(toPrint);
        end;
    end;
    
    begin

    message:='this is a string from alan';
    secretNum:= 18;
    
    encrypt(message, secretNum, encodedMess);
    writeln(encodedMess);
    decode(encodedMess, secretNum, decodedMess);
    writeln(decodedMess);
    solve(message, 26);
end.