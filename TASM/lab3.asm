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

mov ah,4ch
int 21h		; виклик функції DOS 4ch
end Start