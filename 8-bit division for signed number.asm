                     .model small
.stack 100h

.data
num1 db -20        ; First signed number (dividend)
num2 db 5         ; Second signed number (divisor)
quotient db ?     ; Variable to store the quotient
remainder db ?    ; Variable to store the remainder

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the signed numbers into registers
    mov al, byte ptr [num1]
    cbw            ; Convert AL (signed 8-bit) to AX (signed 16-bit)

    mov bl, byte ptr [num2]
    cwd            ; Extend BL (signed 8-bit) to DX:AX (signed 16-bit)

    ; Make sure the divisor (num2) is not zero
    cmp bl, 0
    je division_error ; Exit if the divisor is zero

    ; Perform the signed division (quotient = num1 / num2, remainder = num1 % num2)
    idiv bl

    ; Store the quotient and remainder in the variables
    mov byte ptr [quotient], al
    mov byte ptr [remainder], ah

    ; Display the quotient and remainder (8-bit signed integers)
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
