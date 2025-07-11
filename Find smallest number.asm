.model small
.stack 100h

.data
numbers db 5 dup(?)      ; Array to store the 5 numbers entered by the user
count equ 5              ; Number of elements in the array
smallest db 127              ; Variable to store the smallest number

prompt db 13, 10, "Enter 5 numbers: $"
output_msg db 13, 10, "The smallest number is: $"

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
    je check_smallest       ; If yes, move to check the smallest number

    ; Convert the entered character (number) to numeric value
    sub al, '0'             ; Convert ASCII character to numeric value
    mov [di], al            ; Store the numeric value in the array
    inc di                  ; Move to the next position in the array

    loop read_loop          ; Repeat the read loop for the next number

check_smallest:
    ; Find the smallest number in the array
    mov cx, count           ; Load the number of elements in the array
    mov si, offset numbers  ; Point SI to the start of the array

    ; Initialize the smallest number with the first element of the array
    mov al, [si]            ; Load the first element of the array into AL
    mov smallest, al

    inc si                  ; Move to the next element in the array
    loop find_smallest      ; Repeat the loop for the next element

find_smallest:
    mov al, [si]            ; Load the current element of the array into AL
    cmp al, smallest        ; Compare the current element with the smallest number
    jae skip_update        ; If the current element is not smaller, skip the update

    mov smallest, al        ; Update the smallest number with the current element

skip_update:
    inc si                  ; Move to the next element in the array
    loop find_smallest      ; Repeat the loop for the next element

    ; Display the smallest number
    mov ah, 09h
    mov dx, offset output_msg
    int 21h

    ; Print the smallest number (as an ASCII character)
    mov ah, 02h             ; Function to display a character
    add smallest, '0'       ; Convert the smallest number to ASCII
    mov dl, smallest        ; Move the ASCII character to DL
    int 21h                 ; Print the smallest number

    mov ah, 4Ch             ; Exit program
    int 21h
main endp
end main
