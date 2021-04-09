Cls

DIM message as String = "this is a string from alan"
DIM secretNumber as Integer = 18

Declare Function encrypt(text As String, shift As Integer) As String
Declare Function decode(text As String, shift As Integer) As String
Declare Function solve(text As String) As String
DIM secretMessage as String = encrypt(message, secretNumber)
print secretMessage
DIM crackedCode as String = decode(secretMessage, secretNumber)
print crackedCode
DIM whoKnows as String = solve(message)
End

Function encrypt(text As String, shift As Integer) As String
    DIM toEncrypt as String 
    DIM currChar as String
    DIM newChar as String
    DIM newAscii as Integer
    DIM encoded as String = ""
    DIM size as Integer
    DIM asciiVal as Integer
    size = Len(text)
    toEncrypt = UCase(text)
    for i as Integer = 1 to size step 1
        currChar = Mid(toEncrypt, i, 1)
        asciiVal = Asc(currChar)
        IF asciiVal = 32 THEN
            newAscii = 32
        ELSE
            newAscii = ((asciiVal + shift - 65) Mod 26) + 65
        END IF
        newChar = Chr(newAscii)
        'print newAscii
        'print newChar
        encoded = encoded & newChar
        'print encoded
        NEXT
    return encoded 
END Function 

Function decode(text As String, shift As Integer) As String
    DIM toDecode as String 
    DIM currChar as String
    DIM newChar as String
    DIM newAscii as Integer
    DIM result as String = ""
    DIM size as Integer
    DIM asciiVal as Integer
    DIM newShift as Integer = 26 - shift
    size = Len(text)
    toDecode = UCase(text)
    for i as Integer = 1 to size step 1
        currChar = Mid(toDecode, i, 1)
        asciiVal = Asc(currChar)
        IF asciiVal = 32 THEN
            newAscii = 32
        ELSE
            newAscii = ((asciiVal + newShift - 65) Mod 26) + 65
        END IF
        newChar = Chr(newAscii)
        'print newAscii
       ' print newChar
        result = result & newChar
        'print result
        NEXT
    return result 
END Function

Function solve(text As String) As String
    DIM isThisIt as String
    for i as Integer = 26 to 0 step -1
        isThisIt = encrypt(text, i)
        print "Caesar " & i & ": " & isThisIt
    NEXT
    return text
End Function