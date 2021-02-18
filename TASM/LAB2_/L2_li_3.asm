TITLE L2_li_3.asm Line in screen
;------------------------------------------------------------------------------
;ЛР  № 3.1 Кодування Кіріліца Windows-1251
;-----------------------------------------------------------------------------
;----------------I.ЗАГОЛОВОК ПРОГРАМИ-----------------------
IDEAL
MODEL SMALL
STACK 512
;-----------------II.МАКРОСИ----------------------------------------
;2.2 Складний макрос для ініціалізації
MACRO M_Init		; Початок макросу 
mov	ax, @data		; ax <- @data
mov	ds, ax			; ds <- ax
mov	es, ax			; es <- ax
ENDM M_Init		; Кінець макросу

;--------------------III.ПОЧАТОК СЕГМЕНТУ ДАНИХ
DATASEG
;Оголошеня двовимірного єксперіментального масиву 16х16
;Для запису у відеопамять у послідовності [sybol] [attrib]
;Кожні 8 рядков масиву утворюють 80 символів і їх атрибутів, всього 80 знаків – 1ряд
screen1	 db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3
        	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
        	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
        	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
        	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3
	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
 	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         	db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
	 ; 24 рядка по 10 пар знак-атрибут, всього 3 рядка по 80 знаків на екрані 
	; Наступні 24 рядка утворюють 3 рядка на екрані
         	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
         	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
         	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	 db   9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5,  9h, 5
	; Наступні 24 рядка утворюють 3 рядка символів на консолі 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
         db  0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3, 0Ah, 3 
; Довжина масиву 
screen1len=$-screen1
; Утворення масиву з використанням DUP
screen2 dw 0a03h dup (2000)

exCode db 0

;----------------------VI. ПОЧАТОК СЕГМЕНТУ КОДУ-----------------
CODESEG
Start:	
M_Init
;-------------------Test1 variant 2------------------------ 
	mov AX, 0B800h 			; 1. Сегментна адреса відеопамяті 
	mov ES, AX 				; 2. До ES 
						; Налаштування SI, DI и СХ для movsb
	lea SI, [screen1]	
	mov DI, 0 				; ES:DI (0B800:0) лівий верхній кут екрану
	mov CX, screen1len   	; Число байтів на пересилання 
	cld 					; DF - вперед 
	rep movsb 				; Пересилання 

	mov AH,01h 				; Останов 
	int 21h
;-------------------Dos test kb------------------------ 
	mov AH,01h 			; Останов 
	int 21h
;------array example----------------------------
mov CX, 12
load: 
	nop					     ; CX = CX-1
	nop 					 ; do noting 
	loop load 				; go to Load:

Exit:
     mov ah,4ch
     mov al,[exCode]
     int 21h
    end Start
