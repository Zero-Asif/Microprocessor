.model small
.stack 100h

.data
message db "Hello, Assembly!", '$'   ; The null-terminated string to display

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h         ; Function to display a string
    mov dx, offset message   ; Load the offset of the string into DX
    int 21h             ; Call the DOS interrupt to display the string

    mov ah, 4Ch         ; Exit program
    int 21h
main endp
end main
