TITLE ЛР_3 
;------------------------------------------------------------------------------
;ЛР  №3
;------------------------------------------------------------------------------
; Програмування 3. Системне програмування
; Завдання:              Основи розробки і налагодження
; ВУЗ:                  КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                1
; Група:       ІТ-03
;------------------------------------------------------------------------------
; Автор:        Куксюк Іванченко Очкас
; Дата:         17/03/21
;---------------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 256		; Директива - розмір стеку 

DATASEG
array2Db db "#", "#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "K" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"V" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"I" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"I" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#" 
         db "#", "." ,"." ,"." ,"." ,"." ,"K" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"V" ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"O" ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"D" ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"H" ,"." ,"." ,"." ,"#"
         db "#", "#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#"


CODESEG
Start:

    mov al, 03h ;Число, що буде записано до ділянки дампу
    mov bx, 08h ;До ВХ заносимо ефективну адресу потрібної ділянки коду
    mov [bx], al ;До дампу заносимо значення АХ
    inc bx ;Збільшуємо значення ВХ на 1
    mov [bx], al ;Записуємо в інші ділянки пам’яті
    inc bx
    mov [bx], al ;Записуємо в інші ділянки пам’яті, все це здійснюється циклічно
    inc bx
    mov [bx], al 
    inc bx
    mov [bx], al 
    inc bx
    mov [bx], al 
    inc bx
    mov [bx], al 
    inc bx

    mov bp, 01h ;Етап 1. До ВР заносимо ефективну адресу потрібної ділянки стеку
    mov cx, [bp] ;Етап 2. До СХ заносимо значення з пам’яті за адресою [SS]:[ВР]

mov ah,4ch
int 21h		; виклик функції DOS 4ch
end Start
