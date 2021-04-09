
object CC {
    
    def encrypt(text:String, shift:Int) : String = {
        var asciiVal: Int = 0
        var newAscii: Int = 0
        var currChar: Char = 'a'
        var newChar: Char = 'a'
        var encodedMess: String = ""
        
        var newText:String = text.toUpperCase()
        var i : Int = 0
        
        for (i <- 0 until text.length()){
            currChar = newText.charAt(i)
            asciiVal = currChar.toInt
            if (asciiVal == 32){
                newAscii = 32
            } else {
                newAscii = ((asciiVal + shift - 65) % 26) + 65
            }
            newChar = newAscii.toChar
            encodedMess = encodedMess + newChar
        }
        return encodedMess
    }
    
    def decode(text: String, shift:Int) : String = {
        var newShift: Int = 26 - shift
        return(encrypt(text, newShift))
    }
    
    def solve(text:String, maxShift:Int){
        var i : Int = 0
        for (i <- 0 to maxShift){
            print("Caesar " + i + ": ")
            println(encrypt(text, i))
        }
    }

    def main(args: Array[String]) {
        val secretMessage: String = "maria molloy"
        val secretNum: Int = 7
        
        val encodedMessage : String = encrypt(secretMessage, secretNum)
        println(encodedMessage)
        val crackedMessage : String = decode(encodedMessage, secretNum)
        println(crackedMessage)
        solve(secretMessage, 26)
    }
}