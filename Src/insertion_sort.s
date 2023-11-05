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

@ Write Student 1’s Name here: Wang Silang
@ Write Student 2’s Name here: Bian Rui

@ You could create a look-up table of registers here:

@ R0: Address of arr[0]
@ R1: Length of arr
@ R2: arr[j-1]
@ R3:
@ R4: Address of arr[j]
@ R5: Inner loop counter, j
@ R6: temp variable used to store the current element understand inspection
@ R7: Number of swaps
@ R8: Outter loop counter, i
@ R9: Address of arr[i]

@ write your program from here:

insertion_sort:
	PUSH {R4-R11} @ push all registers onto stacks
	MOV R7,#0  @ initialize swap = 0
	MOV R9,R0  @ address of arr[i] = address of arr[0]

Outter:
	CMP R8,R1 @ i==n, quit outter loop
	BEQ post_loop

	@MOV R4,R9 @ address of arr[i] -> address of arr[j]
	LDR R6,[R9] @ temp = arr[i]
	@MOV R5,R8 @ j = i
	PUSH {R8, R9}

Inner:

	CMP R8,#0 @ inner loop finish, j = 0
	BEQ Inner_finish @ after finish go to outter loop

	LDR R2,[R9, #-4]  @ R2: arr[j-1]
	CMP R2,R6 @arr[j-1] < temp, inner loop finish
	BLS Inner_finish @ after finish go to outter loop

	STR R2,[R9],#-4  @ arr[j] = arr[j-1], move [R9] so [R9] = arr[j-1]
	SUB R8,#1 @j--
	ADD R7,#1 @swap++

	B Inner

Inner_finish:
	STR R6,[R9] @ arr[j] = temp
	POP {R8, R9}
	ADD R9,#4 @ select next entry in array
	ADD R8,#1 @ add loop counter
	B Outter

post_loop:
	MOV R0, R7
	POP {R4-R11}
	BX LR
