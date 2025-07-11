.model small
.stack 100h

.data
num1 db 100       ; First unsigned number (dividend)
num2 db 7         ; Second unsigned number (divisor)
quotient db ?     ; Variable to store the quotient
remainder db ?    ; Variable to store the remainder

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the unsigned numbers into registers
    mov al, byte ptr [num1]
    xor ah, ah     ; Clear AH (zero-extension for AL)

    mov bl, byte ptr [num2]

    ; Make sure the divisor (num2) is not zero
    cmp bl, 0
    je division_error ; Exit if the divisor is zero

    ; Perform the unsigned division (quotient = num1 / num2, remainder = num1 % num2)
    div bl

    ; Store the quotient and remainder in the variables
    mov byte ptr [quotient], al
    mov byte ptr [remainder], ah

    ; Display the quotient and remainder (8-bit unsigned integers)
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

msg db "Quotient: $"
msg2 db 13, 10, "Remainder: $"

division_error:
    ; Display an error message if the divisor is zero
    mov dx, offset msg_error
    mov ah, 9
    int 21h

    ; Exit the program with an error code
    mov ah, 4Ch
    int 21h

msg_error db "Division by zero is not allowed!$"

end start
