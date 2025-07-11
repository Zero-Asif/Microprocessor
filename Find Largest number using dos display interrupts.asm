.model small
.stack 100h

.data
numbers db 5 dup(?)      ; Array to store the 5 numbers entered by the user
count equ 5              ; Number of elements in the array

prompt db 13, 10, "Enter 5 numbers: $"
output_msg db 13, 10, "The largest number is: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt the user to enter 5 numbers
    mov ah, 09h
    mov dx, offset prompt
    int 21h

    ; Read the 5 numbers from the user
    mov cx, count           ; Load the number of elements to read
    mov di, offset numbers  ; Point DI to the start of the array

read_loop:
    mov ah, 01h             ; Function to read a character
    int 21h                 ; Read a character from the user

    cmp al, 13              ; Check if Enter key is pressed
    je check_largest        ; If yes, move to check the largest number

    ; Convert the entered character (number) to numeric value
    sub al, '0'             ; Convert ASCII character to numeric value
    mov [di], al            ; Store the numeric value in the array
    inc di                  ; Move to the next position in the array

    loop read_loop          ; Repeat the read loop for the next number

check_largest:
    ; Find the largest number in the array
    mov cx, count           ; Load the number of elements in the array
    mov si, offset numbers  ; Point SI to the start of the array

    ; Initialize the largest number with the first element of the array
    mov al, [si]            ; Load the first element of the array into AL
    mov bl, al              ; Store the first element in BL (used for comparison)

    inc si                  ; Move to the next element in the array
    dec cx                  ; Decrement the loop counter (since the first element was already loaded)

find_largest:
    mov al, [si]            ; Load the current element of the array into AL
    cmp al, bl              ; Compare the current element with the largest number
    jbe skip_update         ; If the current element is not larger, skip the update

    mov bl, al              ; Update the largest number with the current element

skip_update:
    inc si                  ; Move to the next element in the array
    loop find_largest       ; Repeat the loop for the next element

    ; Display the largest number
    mov ah, 09h
    mov dx, offset output_msg
    int 21h

    ; Print the largest number (as an ASCII character)
    mov dl, bl              ; Move the ASCII character representing the largest number to DL
    add dl, '0'             ; Convert the largest number to ASCII
    mov ah, 02h             ; Function to display a character
    int 21h                 ; Print the largest number

    mov ah, 4Ch             ; Exit program
    int 21h
main endp
end main
