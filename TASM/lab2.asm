TITLE ЛР_2 
;------------------------------------------------------------------------------
;ЛР  №2
;------------------------------------------------------------------------------
; Програмування 3. Системне програмування
; Завдання:              Робота з відеопам'яттю
; ВУЗ:                  КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                1
; Група:       IT-03
;------------------------------------------------------------------------------
; Автор:        Куксюк Очкас Іванченко
; Дата:         21/02/21
;---------------------------------
model small
dataseg
    line db 23h,73h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h; 0.100.0011.B
         db 23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h,23h,43h; мигание.обводкa.символ в hex 43h
    line_length=$-line ; количество байт в line
codeseg
    Start:
        mov ax, 03;очистка консоли
        int 10h; прерывние BIOS

        mov ax, @data
        mov ds, ax
        mov ax,0B800h; использование первой страницы вывода
        mov es, ax
        mov ax, -160  ;(Y: (10(координата)-2(цикл и отступ))*80(ширина экрана)*2(байт) + X: (40(координата)-1(отступ))*2(байт) = 1358)
        mov cx, 10 ; количество повторений цикла
        writer:
            push cx ;запись значения в стек, чтобы сохранить

            add ax, 160 ;сдвиг на строку вниз
            mov di, ax ;запись начала отрисовки
            mov si, offset line; нужно перезаписывать, так как слетает после rep movsb
            mov cx, line_length ; количество байт вывода
            rep movsb ; отрисовка

            pop cx ; возврат значения из стека, для цикла
        loop writer; запуск цикла writer
        

        mov ah, 4ch; завершение работы
        int 21h

    end Start