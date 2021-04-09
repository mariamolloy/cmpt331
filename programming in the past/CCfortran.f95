
program CC
	implicit none
	
	INTEGER, PARAMETER :: shift = 18
	CHARACTER (len = 16) :: message = "HAL"

	

	call encrypt(message, shift)
	print *, message
	call decrypt (message, shift)
	print *, message
	call solve(message, 26)
    contains
    
    subroutine encrypt(phrase, shift)
    	CHARACTER (LEN = 16), intent(inout) :: phrase
    	INTEGER, intent(in) :: shift
    
    	CHARACTER (LEN = 1) :: currentChar
    	CHARACTER (LEN = 1) :: newChar
    	CHARACTER (LEN = 16) :: temp 
    	INTEGER :: i
    	INTEGER :: ascii
    	INTEGER :: newAscii
    	
    	temp = ""
    	do i = 1, len(phrase)
    		!temp = encoded
    		currentChar = phrase(i:i+1)
    		ascii = iachar(currentChar)
    		IF (ascii == 32) THEN
    			newAscii = 32
    		ELSE 
    			newAscii = (mod((ascii + shift - 65),26)) + 65
    		END IF
    		newChar = char(newAscii)
    		temp = trim(temp) // trim(newChar)
    	end do
    	phrase = temp

    END subroutine encrypt

    subroutine decrypt(phrase, shift)
        CHARACTER (LEN = 16), intent(inout) :: phrase
    	INTEGER, intent(in) :: shift
    
    	integer :: newShift
    	
    	newShift = 26 - shift
        call encrypt(phrase, newShift)
    END subroutine decrypt

    subroutine solve(phrase, maxShift)
        CHARACTER (LEN = 16), intent(inout) :: phrase
    	INTEGER, intent(in) :: maxShift
    	
    	CHARACTER (LEN = 16):: temp
        INTEGER :: i
        
    	do i = 0, maxShift
    	   temp = phrase
            call encrypt(temp, i)
    	    print *, "Caesar "  
    	    print *, i
    	    print*,": " // temp
    	    !print *, i
    	   ! print *, phrase
    	end do
    
    end subroutine 


end program CC

