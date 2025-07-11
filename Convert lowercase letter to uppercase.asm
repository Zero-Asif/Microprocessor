.model small
.stack 100h

.data
input db 'a'   ; Lowercase letter to convert

.code
start:
    mov ax, @data
    mov ds, ax     ; Initialize data segment

    mov al, byte ptr [input]

    ; Check if the character is a lowercase letter
    cmp al, 'a'
    jb not_lowercase
    cmp al, 'z'
    ja not_lowercase

    ; Convert the lowercase letter to uppercase
    sub al, 32

    ; Display the converted letter
    mov dl, al
    mov ah, 2       ; DOS function to display a character
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

not_lowercase:
    ; Display a message if the input is not a lowercase letter
    mov dx, offset msg_error
    mov ah, 9
    int 21h

    ; Exit the program with an error code
    mov ah, 4Ch
    int 21h

msg_error db "Input is not a lowercase letter!$"

end start
