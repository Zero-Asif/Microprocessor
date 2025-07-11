# 8086 Microprocessor Assembly Language Programs

This repository contains a collection of fundamental assembly language programs written for the 8086 microprocessor. These programs are primarily intended for beginners who are interested in learning about the 8086 architecture, its instruction set, and assembly language programming.

---

## 💻 How to Run the Programs

You will need the **Emu8086 - Microprocessor Emulator** software to run these programs.

### Software Requirements
* **Software:** `Emu8086 v4.08`
* **Download:** You can search for "Emu8086 v4.08 download" on the internet to find and download it from various reliable educational or archive websites.

### Steps to Run
1.  First, install **Emu8086** on your computer.
2.  Download the desired `.asm` file from this repository.
3.  Launch the Emu8086 software and open the downloaded `.asm` file by clicking the **"Open"** button.
4.  Once the code is open in the editor, click the **"Assemble"** or **"Emulate"** button from the toolbar.
5.  If there are no errors, a new emulator window will open.
6.  In that new window, click the **"Run"** button to execute the entire program at once, or click **"Single Step"** to execute it line by line and observe the changes in the registers.

---

## 💡 Understanding Program Output

The programs in this repository produce results that can be viewed in different ways.

* **Variables Window:** This window (**`View -> variables`** in the emulator) is a debugger tool that shows the real-time values stored in memory. For many of the arithmetic programs, this is the quickest way to see the final calculated value (e.g., the value in the `RESULT` or `QUOTIENT` variable).
* **Console Screen:** This is the black text-based window (`emulator screen`) where programs can print formatted messages using `INT 21h`.
* **Virtual Device:** Some programs interface with hardware and require a specific virtual device (e.g., `LED_Display.exe`) to be opened to see the visual output.

---

## 📋 List of Programs

| Sr. No. | Program Name (File Name)                       | How to See the Result                                                                                  | Description                                                              |
| :------ | :----------------------------------------------- | :----------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| 1       | `8-bit division for signed number.asm`           | **Variables Window:** Shows `QUOTIENT` and `REMAINDER`. <br> **Console Screen:** Prints a formatted message.    | Finds the quotient and remainder of two 8-bit signed numbers.      |
| 2       | `8-bit division for unsigned number.asm`         | **Variables Window:** Shows `QUOTIENT` and `REMAINDER`. <br> **Console Screen:** Prints a formatted message.    | Finds the quotient and remainder of two 8-bit unsigned numbers.    |
| 3       | `16-bit division of unsigned numbers.asm`        | **Variables Window:** Shows `QUOTIENT` and `REMAINDER`. <br> **Console Screen:** Prints a formatted message.    | Finds the quotient and remainder of two 16-bit unsigned numbers.   |
| 4       | `16-bit multiplication of signed numbers.asm`    | **Variables Window:** Shows the value in the `RESULT` variable. <br> **Console Screen:** Prints the number.   | Finds the product of two 16-bit signed numbers.                          |
| 5       | `16-bit multiplication of unsigned number.asm`   | **Variables Window:** Shows the value in the `RESULT` variable. <br> **Console Screen:** Prints a message.   | Finds the product of two 16-bit unsigned numbers.                        |
| 6       | `16-bit Subtraction.asm`                         | **Variables Window:** Shows the value in the `RESULT` variable. <br> **Console Screen:** Prints a message.   | Finds the difference between two 16-bit numbers.                         |
| 7       | `Add 2 numbers.asm`                              | **Variables Window:** Shows the value in the `SUM` variable. <br> **Console Screen:** Prints a message.       | Performs the addition of two numbers.                                    |
| 8       | `Convert lowercase letter to uppercase.asm`      | **Console Screen:** The primary output is the converted character displayed here.                          | Converts a lowercase letter to its uppercase equivalent.                 |
| 9       | `Find Largest number using dos display in.asm`   | **Console Screen:** Displays the largest number found in the array.                                        | Finds the largest number in an array and displays it on the DOS screen.      |
| 10      | `Find largest number.asm`                        | **Variables Window:** The largest number is stored in a register (e.g., `AL` or `AX`).                     | Finds the largest number in a given array.                               |
| 11      | `Find smallest number.asm`                       | **Variables Window:** The smallest number is stored in a register (e.g., `AL` or `AX`).                   | Finds the smallest number in a given array.                              |
| 12      | `Program for Reverse a string.asm`               | **Console Screen:** Displays the reversed string.                                                          | Reverses a given string.                                                 |
| 13      | `Program to display a string.asm`                | **Console Screen:** The primary output is the string displayed here.                                       | Displays a specific string on the screen.                                |
| 14      | `Search for a character in a string.asm`         | **Console Screen:** Prints a message indicating if the character was found.                                | Searches for a specific character within a string.                         |
| 15      | `Seven segment display interface.asm`            | **Variables Window:** Shows the defined data for the display.                                          | Displays a specific digit on a 7-segment display.                        |


---
