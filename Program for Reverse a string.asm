.model small
.stack 100h

.data
input_str db "Hello, World!", 0
output_str db 100 dup("$") ; Buffer to store the reversed string with '$' terminator

.code
start:
    mov ax, @data
    mov ds, ax      ; Initialize data segment

    lea si, input_str  ; Load address of the input string
    lea di, output_str ; Load address of the output string
    call reverse_string ; Call the function to reverse the string

    ; Display the reversed string
    mov dx, offset output_str
    mov ah, 09h     ; DOS function to display the string
    int 21h         ; Invoke DOS interrupt

    mov ah, 4Ch     ; Exit program
    int 21h         ; Invoke DOS interrupt

reverse_string:
    ; Find the length of the string
    mov cx, 0
find_length:
    mov al, [si]    ; Load the character from the input string
    cmp al, 0       ; Check if it's the null terminator
    je reverse      ; If it is, jump to the reverse part
    inc si          ; Move to the next character
    inc cx          ; Increment the character count
    jmp find_length ; Repeat the loop to find the length

reverse:
    dec si          ; Move back to the last character before the null terminator
    mov bx, cx      ; Move the character count to BX

reverse_loop:
    mov al, [si]    ; Load the character from the input string
    mov [di], al    ; Store it in the output string
    inc di          ; Move to the next position in the output string
    dec si          ; Move to the previous character in the input string
    loop reverse_loop ; Repeat the loop until all characters are reversed

    mov byte ptr [di], "$" ; Add the '$' terminator to the output string

    ret             ; Return from the function

end start
