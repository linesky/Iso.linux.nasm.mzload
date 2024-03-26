[bits 16]
org 0h
section text
host_exe_header:
.signature: dw 'MZ'     ; the 'MZ' characters
.last_page_size: dw 1   ; number of used bytes in the final file page, 0 for all
.page_count: dw 1       ; number of file pages including any last partial page
.reloc: dw 0            ; number of relocation entries after the header
.paragraphs: dw 2       ; size of header + relocation table, in paragraphs
.minalloc: dw 0         ; minimum required additional memory, in paragraphs
.maxalloc: dw 0xFFFF    ; maximum memory to be allocated, in paragraphs
.in_ss: dw 100h           ; initial relative value of the stack segment
.in_sp: dw 0xF000       ; initial sp value
.checksum: dw 0         ; checksum: 1's complement of sum of all words
.in_ip: dw main        ; initial ip value
.in_cs: dw  0      ; initial relative value of the text segment
.offset: dw 0         ; offset of the relocation table from start of header
.overlay: dw 0          ; overlay value (0h = main program)
.overlay2: dw 0

main db 090h
jmp start
start:
push cs
push cs
pop ds
pop es		
write_text:
	mov ax,cs
	mov ds,ax
	mov es,ax	
	mov dx,string1
	mov ah,9
	int 0x21
exit:
	mov ax,0x4c00
	int 0x21
halt:
jmp halt
;section data
string1: db "hello world.....",13,10,"$"
string2: db "$",0

