TITLE V сod 3.1
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
;----------- Variant 2. 2DarrSA Symbols and atribute from array in video-memory----------------
msgv2 db 10h, 0Eh, 'T' , 0E0h, 'e' , 0E0h , 'с' , 0E0h, 'т' , 0E0h , 11h , 0Eh 
msglenv2=$-msgv2

;-------Variant 3. 2DarrSA Symbols in video-memory from array and atribute from code------
msgv3    db 'Test of video memory Variant 3' 
 	 db 'Symbols and atribute from array'
	 db 'Test of video memory Variant 3'
	 db 'Symbols and atribute from array'
	 db 'Test of video memory Variant 3'
	
msglenv3=$-msgv3
;----------- Variant 4. 2DarrSA Symbols in video-memory from array and atribute in video
; Простий текст для пересилання 
msgv4 db 'Atribute in video-memor' 
	db 'Test of video memory variant 4'
	db 'Atribute in video-memor'
	db 'Test of video memory variant 4'
	db 'Atribute in video-memor'
msglenv4=$-msgv4

exCode db 0

;----------------------VI. ПОЧАТОК СЕГМЕНТУ КОДУ-----------------
CODESEG
Start:	
M_Init

;----------- Variant 1. Symbols to memory-----------------------------
						;Налаштування ES на сторінку 0 відеопамяті 
	mov AX, 0B800h 			; 1. Сегментна адреса початку відеопамяті   
	mov ES, AX 				; 2. До ES 
	mov BX, 0 				; 3. Зміщення на початок екрану 
	mov SI, 2000				; 4. Зміщення центру eкрану 80*2*12+40*2
	mov DI, 3998			; 5. Зміщення кінець екрану 80*2*25-2
	mov [word ES:BX], 0F01h		; 6. Символ на экран 
	mov [word ES:SI], 3130h		; 7. Символ на экран 
	mov [word ES:DI], 0E40Fh	; 8. Симвл на экран 
	
	mov AH,01h 				; 9.Останов 
	int 21h 
	
;----------- Variant 2. 2DarrSA Symbols and atribute from array in video-memory
	mov AX, 0B800h 			; 1. Сегментна адреса відеопамяті 
	mov ES, AX 				; 2. До ES 
						; Налаштування SI, DI и СХ для movsb
	mov SI, offset msgv2 	
	mov DI, 1994 ; 			; Початок виводу на екран
	mov CX, msglenv2   		; Число байтів на пересилання 
	cld 				; DF - вперед 
	rep movsb 			; Пересилання 

	mov AH,01h 			; Останов 
	int 21h

;-------------------Test1 variant 2------------------------ 
	mov AX, 0B800h 			; 1. Сегментна адреса відеопамяті 
	mov ES, AX 				; 2. До ES 
						; Налаштування SI, DI и СХ для movsb
	lea SI, [screen1]	
	mov DI, 0 				; ES:DI (0B800:0) лівий верхній кут екрану
	mov CX, screen1len   		; Число байтів на пересилання 
	cld 					; DF - вперед 
	rep movsb 				; Пересилання 

	mov AH,01h 				; Останов 
	int 21h


;----------- Variant 3. 2DarrSA Symbols in video-memory from array and atribute from code
	mov AX, 0B800h 			; 1. Сегментна адреса відеопамяті 
	mov ES, AX 				; 2. До ES 
						; Налаштування SI, DI и СХ для movsb
	mov SI, offset msgv3		; Джерело на пересилання 		
	mov DI, 1994 			; Початкове зміщення на екрані
	mov CX, msglenv3   		; Число байтів на пересилання 
	cld 					; DF – вперед пересилаємо
	mov AH, 31h 			; Attribute for all 
load: 
	lodsb					; Symbol to AL
	stosw 					; Symbol + atrib from AX to videomemory
	loop load 				; For msg lengs

	mov AH,01h 				; Останов 
	int 21h

;----------- Variant 4. 2DarrSA Symbols in video-memory from array and atribute 
	mov AX, 0B800h 			; 1. Сегментна адреса відеопамяті 
	mov ES, AX 				; 2. До ES 
						; Налаштування регістрів SI, DI и СХ для movsb
	mov SI, offset msgv4		; Джерело на пересилання 		
	mov DI, 1994 			; Приймач. Початкове зміщення на екрані
	mov CX, msglenv4   		; Число байтів на пересилання 
	cld 					; DF – вперед пересилаємо
load1: 
	lodsb					; Symbol to AL
	stosb 					; To memory (on screen)
	inc DI 					; For msg lengs
	loop load1 

	mov AH,01h 			; Останов 
	int 21h

Exit:
     mov ah,4ch
     mov al,[exCode]
     int 21h
    end Start
