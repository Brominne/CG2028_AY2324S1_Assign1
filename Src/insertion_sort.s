/*
 * insertion_sort.s
 *
 *  Created on: 10/08/2023
 *      Author: Ni Qingqing
 */
   .syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

		.global insertion_sort

@ Start of executable code
.section .text

@ EE2028 Assignment 1, Sem 1, AY 2023/24
@ (c) ECE NUS, 2023
@ Insertion sort arr in ascending order

@ Write Student 1’s Name here:
@ Write Student 2’s Name here:

@ You could create a look-up table of registers here:

@ R0 ...
@ R1 ...

@ write your program from here:

@ Global var: R4: address of arr[j], R5 j,
@ R6: temp, R7: Swap, R8: i, R9: address of arr[i]
@ R10: n
insertion_sort:
	PUSH {R14}

	LDR R14 ,=0
	B Outter

	POP {R14}


Outter:
	CMP R8, R10 @ i==n, quit otter loop
	BEQ post_loop

	LDR R6, [R9] @use R9 as a[i], temp = arr[ i ];
	MOV R5, R8 @ j = i
	MOV R4, R9 @ address of arr[i] -> address of arr[j]
	ADD R8, #1
	ADD R9, #4

	B Inner

Inner:

	CMP R5, #0 @ inner loop finish, j = 0
	BEQ Outter @ after finish go to outter loop

	LDR R2, [R4, #-4]  @ R2: arr[j-1]
	CMP R2, R6 @arr[j-1] < temp, inner loop finish
	BMI Outter @ after finish go to outter loop

	STR R2, [R4], #-4  @ arr[j] = arr[j-1], move [R4] so [R4] = arr[j-1]
	SUB R5, #-1 @j--
	ADD R7, #1 @swap++

	B Inner_finish

Inner_finish:

	STR R6, [R4] @ arr[j] = temp
	B Outter

post_loop:

	BX LR









