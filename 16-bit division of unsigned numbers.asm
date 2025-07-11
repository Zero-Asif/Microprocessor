.model small
.stack 100h

.data
num1 dw 100       ; First unsigned number (dividend)
num2 dw 7         ; Second unsigned number (divisor)
quotient dw ?     ; Variable to store the quotient
remainder dw ?    ; Variable to store the remainder

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the unsigned numbers into registers
    mov ax, word ptr [num1]
    xor dx, dx     ; Clear DX (DX:AX will be the dividend)

    mov bx, word ptr [num2]
    ; Make sure the divisor (num2) is not zero
    cmp bx, 0
    je division_error ; Exit if the divisor is zero

    ; Perform the unsigned division (quotient = num1 / num2, remainder = num1 % num2)
    div bx

    ; Store the quotient and remainder in the variables
    mov word ptr [quotient], ax
    mov word ptr [remainder], dx

    ; Display the quotient and remainder (16-bit unsigned integers)
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
