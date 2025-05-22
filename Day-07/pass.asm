.model small
.stack 100h
.data

m1 db "Enter the Mark1: $"
m2 db "Enter the Mark2: $"
m3 db "Enter the Mark3: $"

n1 db 0
n2 db 0
nlt db 0
nlo db 0
n2t db 0
n2o db 0
n3 db 0
n3t db 0
n3o db 0
t db 0

m5 db "Average of three marks $"

a db 0
ao db 00000

m6 db "The student Passed $"
m7 db "The student failed $"

.code
mov ax, @data
mov ds, ax

mov dx, offset m1
mov ah, 09h
int 21h

mov ah, 01h
int 21h

sub al, 48
mov nlt, al

mov ah, 01h
int 21h

sub al, 48
mov nlo, al

mov bl, 10
mov al, nlt
mul bl
add al, nlo

mov n1, al

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset m2
mov ah, 09h
int 21h

mov ah, 01h
int 21h

sub al, 48
mov n2t, al

mov ah, 01h
int 21h

sub al, 48
mov n2o, al

mov bl, 10
mov al, n2t
mul bl
add al, n2o

mov n2, al

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset m3
mov ah, 09h
int 21h

mov ah, 01h
int 21h

sub al, 48
mov n3t, al

mov ah, 01h
int 21h

sub al, 48
mov n3o, al

mov bl, 10
mov al, n3t
mul bl
add al, n3o

mov n3, al

mov dl, 10
mov ah, 02h
int 21h

mov dl, n1
add dl, n2
add dl, n3
mov t, dl

mov al, t
mov ah, 00
mov bl, 3
div bl
mov a, al

mov dx, offset m5
mov ah, 09h
int 21h

mov al, a
mov bl, 10
mov ah, 00
div bl
mov ao, ah

mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, ao
add dl, 48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov al, a

cmp al,50 ; al>=50
jge pass

fail:
mov dx, offset m7
mov ah, 09h
int 21h
jmp endd

pass:
mov dx, offset m6
mov ah, 09h
int 21h
jmp endd


endd:
mov ax, 4c00h
int 21h
end

