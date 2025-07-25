# LIBASM
Recreation of a few functions from the 42 libft in x86_64 System V ABI (Linux)

## _DESCRIPTION_
This project is a recreation of some functions from the 42 libft, implemented in x86_64 assembly language instead of C.

## _FUNCTIONS_
- `ft_strlen`: Computes the length of a string. Key points:
    - Uses a loop to iterate through the string until it finds the null terminator.
    - Returns the length of the string in the `rax` register.
- `ft_strcpy`: Copies a string from source to destination. Key points:
    - Uses a loop to copy each character from the source string to the destination string, using the 8-bit register `dl` as a temporary storage, as memory-to-memory operations are not possible in x86_64 assembly.
    - Returns the destination string in the `rax` register.
- `ft_strcmp`: Compares two strings. Key points:
    - Uses the movzx instruction to cast the characters to unsigned integers before performing the subtraction.
    - Returns the difference between the first non-matching characters in the `eax` register since the return value of strcmp is a 32-bit integer.
- `ft_write`: Writes a string to the standard output.
- `ft_read`: Reads a string from the standard input.
- `ft_strdup`: Duplicates a string by allocating memory for it and copying the content.

## _CHEATSHEET_
- **Registers**:
    - `rax`: Used for 64-bits return values.
    - `eax`: Used for 32-bits return values.
    - `al`: Used for 8-bits return values.
- **Calling Convention**:
    - Arguments are passed in registers: `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`. Additional arguments are passed on the stack.
    - Return values are returned in `rax` for 64-bits, `eax` for 32-bits, and `al` for 8-bits.
- **Memory Operations**:
    - Use `mov` to copy data between registers and memory.
    - Use `movzx` to zero-extend a smaller register to a larger one (i.e. fill the upper bits with 0s).
    - Use `movsx` to sign-extend a smaller register to a larger one (i.e. fill the upper bits with 1s if the value is negative).
- **Arithmetic Operations**:
    - Use `add`, `sub`, `mul`, and `div` for arithmetic operations.
    - Use `xor` to set a register to zero (e.g., `xor rax, rax` sets `rax` to 0).
- **Control Flow**:
    - Use `jmp` for unconditional jumps.
    - Use `je`, `jne`, `jg`, `jl`, etc. for conditional jumps based on the flags set by previous operations.

### _REFERENCES_
- https://diveintosystems.org/singlepage/#_x64_assembly_chapter
- https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
- https://www.tutorialspoint.com/assembly_programming/index.htm
- https://gpfault.net/posts/asm-tut-0.txt.html
- https://scadahacker.com/library/Documents/Cheat_Sheets/Programming%20-%20x86%20Instructions%201.pdf
- https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html