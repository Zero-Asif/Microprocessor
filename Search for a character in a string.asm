.model small
.stack 100h

.data
string db "asif", 0   ; Null-terminated string to search in
searchChar db 'abcdefghijklmnopqrstuvwxyz'              ; Character to search for

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset string      ; Point SI to the start of the string
    mov al, searchChar         ; Load the character to search for into AL
    xor bx, bx                 ; Set BX to 0 to keep track of the position

search_loop:
    mov bl, [si]               ; Load the current character from the string
    cmp bl, 0                  ; Check if we reached the null terminator (end of string)
    je not_found               ; If yes, the character is not found

    cmp al, bl                 ; Compare the current character with the search character
    je found                   ; If they match, we found the character

    inc si                     ; Move to the next character in the string
    inc bx                     ; Increment the position counter
    jmp search_loop            ; Repeat the search

found:
    ; The character is found, and its position is stored in BX
    ; You can perform any actions here, such as displaying the position or anything else.

    mov ah, 02h                ; Function to display a character
    mov dl, 'F'                ; Character 'F' to display
    int 21h

    jmp end_program

not_found:
    ; The character is not found in the string
    ; You can perform any actions here if needed.

    mov ah, 02h                ; Function to display a character
    mov dl, 'N'                ; Character 'N' to display
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

main endp
end main
