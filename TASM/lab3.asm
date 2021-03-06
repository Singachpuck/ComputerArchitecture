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
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#" 
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"." ,"#"
         db "#", "#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#" ,"#"


CODESEG
Start:
    mov ax, @data ; @data ідентифікатор, що створюється директивою model
	mov ds, ax 	; Завантаження початку сегменту даних в регістр ds 
	mov si, 01h ; Індексний регістр пересування по горизонталі
	mov bx, 0 ; Базовий регістр пересування по вертикалі 
	; згідно з номером команди. У нашому випадку - 4


	mov al, "K"			; Записуємо до АL F
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
	mov al, "V" 			; Записуємо до АL N
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
	mov al, "I" 			; Записуємо до АL S
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
;------------------------------------------------------------------
	mov al, "I" 			; Записуємо до АL H
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
	mov al, "K" 			; Записуємо до АL E
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
		mov al, "V" 			; Записуємо до АL A
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
;------------------------------------------------------------------

	mov al, "O" 			; Записуємо до АL C
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
	mov al, "D" 			; Записуємо до АL A
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10
		mov al, "H" 			; Записуємо до АL Y
	mov [array2Db+bx+si], al; M(DS*16+array2Db+BX+SI)
    inc si ; збільшуємо si на 1, просуваємося по горизонталі на 1
	add bx, 10h ; збільшуємо bx на 10, просуваємося по вертикалі на 10

mov ah,4ch
int 21h		; виклик функції DOS 4ch
end Start