   ideal
   model small
   stack 256
     dataseg
   exCode db 0
   message db "Hello world!",10,13,'$'
    codeseg
   Start:
     mov ax,@data
     mov ds, ax
     mov es, ax
     mov dx, offset message
     mov ah,9
     int 21h
     mov ah,01h
     int 21h
     mov ah,4ch
     mov al,[exCode]
     int 21h
    end Start
