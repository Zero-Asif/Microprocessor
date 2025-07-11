.model small
.stack 100h

.data
num1 dw -100          ; First signed number
num2 dw 50            ; Second signed number
result dw ?           ; Variable to store the result

.code
start:
    mov ax, @data
    mov ds, ax         ; Initialize data segment

    ; Set the extra segment (ES) to video segment (0B800h)
    mov ax, 0B800h
    mov es, ax

    ; Load the signed numbers into registers
    mov ax, word ptr [num1]
    mov bx, word ptr [num2]

    ; Perform the signed multiplication (result = num1 * num2)
    imul bx

    ; Store the result in the 'result' variable
    mov word ptr [result], ax

    ; Display the result (16-bit signed integer)
    mov di, offset output_str
    call print_signed_number

    ; Exit the program
    mov ah, 4Ch
    int 21h

print_signed_number:
    ; Check if the result is negative
    test ax, ax
    jns print_positive

    ; Print the negative sign
    mov al, '-'
    stosb

    ; Negate the value to make it positive
    neg ax

print_positive:
    ; Print the positive number
    mov cx, 10         ; Number base (decimal)

print_loop:
    xor dx, dx         ; Clear DX for division
    div cx             ; Divide AX by 10, quotient in AX, remainder in DX
    add dl, '0'        ; Convert the remainder to ASCII
    stosb              ; Store the ASCII character in video memory
    test ax, ax
    jnz print_loop     ; Repeat until AX becomes zero

    ; Reverse the printed number
    mov di, offset output_str
    mov si, di
    mov al, '$'        ; Add the '$' terminator
    stosb

    ret

output_str db 7 dup(0) ; Buffer to store the reversed string

end start
