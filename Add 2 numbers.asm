.model small
.stack 100h

.data
num1 dw 10      ; First number
num2 dw 20      ; Second number
sum dw ?        ; Variable to store the sum

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the numbers into registers
    mov ax, word ptr [num1]
    mov bx, word ptr [num2]

    ; Add the numbers (sum = num1 + num2)
    add ax, bx

    ; Store the result (sum) in the variable
    mov word ptr [sum], ax

    ; Display the sum (16-bit integer)
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

msg db "Sum is: $"

end start
