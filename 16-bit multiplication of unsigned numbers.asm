.model small
.stack 100h

.data
num1 dw 100       ; First unsigned number
num2 dw 50        ; Second unsigned number
result dw ?       ; Variable to store the result

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    ; Load the unsigned numbers into registers
    mov ax, word ptr [num1]
    mov bx, word ptr [num2]

    ; Perform the unsigned multiplication (result = num1 * num2)
    mul bx

    ; Store the result in the 'result' variable
    mov word ptr [result], ax

    ; Display the result (16-bit unsigned integer)
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

msg db "Result is: $"

end start
