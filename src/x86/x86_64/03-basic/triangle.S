# ----------------------------------------------------------------------------------------
# This is an OSX console program that writes a little triangle of asterisks to standard
# output. Runs on macOS only.
#
#    $ nasm -f elf64 -o triangle.o triangle.asm
#    $ ld -o triangle triangle.o
# ----------------------------------------------------------------------------------------
.section   .data
	.equ maxlines, 8
	.equ dataSize, 44
.section   .bss
	.comm output, dataSize

.section   .text
.globl _start
_start:
          movabs    $output, %rdx            # rdx holds address of next byte to write
          mov       $1, %r8                  # initial line length
          mov       $0, %r9                  # number of stars written on line so far
line:
          movb      $'*', (%rdx)             # write single star
          inc       %rdx                     # advance pointer to next cell to write
          inc       %r9                      # "count" number so far on line
          cmp       %r8, %r9                 # did we reach the number of stars for this line?
          jne       line                     # not yet, keep writing on this line

lineDone:
          movb      $10, (%rdx)              # write a new line char
          inc       %rdx                     # and move pointer to where next char goes
          inc       %r8                      # next line will be one char longer
          mov       $0, %r9                  # reset count of stars written on this line
          cmp       $maxlines, %r8           # wait, did we already finish the last line?
          jng       line                     # if not, begin writing this line
done:
          movq      $1, %rax                 # system call for write
          movq      $1, %rdi                 # file handle 1 is stdout

          movabs    $output, %rsi            # address of string to output
          mov       $dataSize, %rdx          # number of bytes
          syscall                            # invoke operating system to do the write

          mov       $60, %rax                # system call for exit
          xor       %rdi, %rdi               # exit code 0
          syscall                            # invoke operating system to exit
