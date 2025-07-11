.model small
.stack 100h

.data
num1 dw 50       ; First number
num2 dw 30       ; Second number
result dw ?      ; Variable to store the result

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the numbers into registers
    mov ax, word ptr [num1]
    mov bx, word ptr [num2]

    ; Subtract the numbers (result = num1 - num2)
    sub ax, bx

    ; Store the result (difference) in the variable
    mov word ptr [result], ax

    ; Display the result (16-bit integer)
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

msg db "Result is: $"

end start

