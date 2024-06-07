;Cesar, Seena, Saim
;CIS-11 
;Professor Nyugen
;Final project: Bubble Sort



.ORIG x3000 	

LD R2, COUNT
LD R1, ASCII
LEA R6, NUMS

USERINPUT LEA R0, PROMPT
	  PUTS
	  GETC	         ;Gets character from user
	  OUT	         ;Puts it out
        
	  ADD R0,R0, R1  ;Converts number from ASCII to integer
  	  STR R0, R6, #0 ;Puts that number in a list
	  ADD R6, R6, #1 ;Moves to next memory adress for the next integer



	  ADD R2, R2, #-1    ;This is for the amount of time its gonna ask for user input
	  BRz SORTINGCOUNTER ;Once the counter hits zero, the sorting will begin
 	  BR USERINPUT
	
	

SORTINGCOUNTER   AND R1, R1, #0
	  	 LD R1, OVERALL ;This is for the amount of times a iteration is gonna happen
	  
	 

GETTINGREADY    AND R0, R0, #0
	  	AND R2, R2, #0
	  	AND R3, R3, #0 
	  	AND R4, R4, #0
	  	AND R5, R5, #0 ;Clearing up the registers
	  	AND R6, R6, #0
	  	AND R7, R7, #0
	  	LD R3, TEST ;Keeps count of how many times the program has sorted in a current iteration
          	LEA R0, NUMS ;This is all of the numbers that was stored from the beginning
          
	 
	  
INNERLOOP
        
          LDR R4, R0, #0  ;First number we are sorting 
          LDR R5, R0, #1  ;Second number we are sorting 
	  STI R5, BEFORENEG ;This is to keep store of the current number before it turns into a negative
	  NOT R5, R5
	  ADD R5, R5, #1 
	  ADD R2, R4, R5 ; n-n+1 ;The numbers subtracting
	  
	  BRp IFRTWOPOSTIVE
	  BRn IFRTWONEGATIVE


IFRTWOPOSTIVE
	  AND R5, R5, #0
	  LDI R5, BEFORENEG	


	  ADD R7, R4, #0  
	  AND R4, R4, #0
	  ADD R4, R5, #0
	  ADD R5, R7, #0 ;Moving the numbers to their correct places
	  ADD R5, R7, #0 
	  AND R7, R7, #0
	  
	  STR R4, R0, #0 ;Stores the current number back to the list in its correct position
	  ADD R0, R0, #1 ;Moves to next number that was sorted
	  STR R5, R0, #0 ;Stores the 2nd current number back to the list in its correct position
  	 
  
          ADD R3, R3, #-1 ;Subtracts from counter of current interation

	  BRz SORTINGDONE
	  BR INNERLOOP

IFRTWONEGATIVE
	  AND R5, R5, #0
	  LDI R5, BEFORENEG 
	 
	  STR R4, R0, #0    ;Since the numbers of the current swap resulted in a negative, the program just stores it back in the list
	  ADD R0, R0, #1 
	  STR R5, R0, #0

	  ADD R3, R3, #-1   ;Subtracts from counter of current interation
	  

	  BRz SORTINGDONE
	  BR INNERLOOP


SORTINGDONE
	  ADD R1, R1, #-1  ;Once the current interation is done, it will subtract one then do it for the remaining times it needs to be sorted
          BRz DISPLAY      ;This will go to the sorted iteration once the counter above reaches 0
	  BR GETTINGREADY  ;This goes back so the current iteration of numbers can be sorted

DISPLAY      
	  AND R1, R1, #1
	  AND R4, R4, #1
	  AND R3, R3, #1

	  LD R1, COUNT    ;For the amount of numbers the program is gonna display
	  LD R4, NASCII	  ;This to conver that numbers back into ASCII so the program can display the numbers
	  LEA R3, NUMS     ;List of the user input numbers that are all sorted



DISPLAYNUM
	  AND R0, R0, #1
	  AND R2, R2, #1
	  AND R5, R5, #1
	  AND R6, R6, #1
	  AND R7, R7, #1


	  

	  LEA R0, PROMPTTWO 
	  PUTS

	  LDR R0, R3, #0  ; load the first number into r0   
	  ADD R0, R0, R4  ; add back the ASCII numbers into r0
	  
	  

	  
	  OUT
	  ADD R3, R3, #1  ; go up one in the list
          ADD R1, R1, #-1



	  BRz NUMERSSORTED
	  BR DISPLAYNUM
	  

          

NUMERSSORTED
	LEA R0, OUTPUT 
	PUTS
	HALT


PROMPTTWO .STRINGZ "\n" 
OUTPUT .STRINGZ "      These are your numbers from least to greatest."  
PROMPT .STRINGZ "\n Put a number 1-9 in: "
COUNT .FILL #8
ASCII .FILL X-30
NASCII .FILL x30
BEFORENEG .FILL x4000
NUMS .BLKW 8 
TEST .FILL #7
OVERALL .FILL #7





.END ; code end

