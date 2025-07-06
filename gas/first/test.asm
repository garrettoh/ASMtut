.section .data
# VARIABLES 
# EAX = Current list element
# EBX = Current Highest Value
# EDI = Incrementor Variable
# THIS IS ALL IN AT&T SYNTAX USE "AS" command instead of nasm 
data_items:
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
  .section .text
  .globl _start


_start:
 movl $0, %edi
 movl data_items(,%edi,4), %eax # load the first byte of data %edi incrementer
 movl %eax, %ebx 		# since this is the first item %eax is the biggest


start_loop:
  cmpl $0, %eax 		#Check to see if we hit the end of the array
  je loop_exit
  incl %edi			
  movl data_items(,%edi,4), %eax
  cmpl %ebx, %eax		# Check to see if the new value is smaller
  jle start_loop		 
  movl %eax, %ebx		# 
  jmp start_loop

  loop_exit:
  movl $1, %eax			# 1 is exit call
  int $0x80			
