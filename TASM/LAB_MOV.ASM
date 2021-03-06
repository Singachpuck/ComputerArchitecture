 %TITLE "�p���p �ᯮ�짮����� ������ ��p��뫮�"
        IDEAL
        MODEL   small
        STACK   256

        DATASEG

 exCode   DB     0                   ;��� ��६����� exCode १�ࢨ����� ���
                                     ;����� ���� �訡��, �᫨ �ந������ �訡��
                                     ;� �믮������ �ணࠬ�� �㤥� ��ࢠ��.
                                     ;� �⮬ ��� ��� �訡��  �����뢠���� �  
                                     ;�祩�� exCode � �믮������ ������� 
                                     ;JMP Exit.
 dataByte DB     99                  ;���樠����஢����� ��६�����, ������ �
                                     ;���� ���� � ���祭��� 99D  
 dataWord DW     0FACEh              ;���樠����஢����� ��६����� ������ �
                                     ;��� ����(᫮��) � ���祭��� FACEh  
 array1   DB     0,1,2,3,4,5,6,7,8,9 ;���樠����஢���� ���ᨢ
 array2   DB     10 DUP ('*')        ;���樠����஢���� ���ᨢ
 storeAdr DD     ?                   ;�� ���樠����஢����� ��p�������
                                     ;��� �p������ ������� ��p��
        CODESEG

 codeByte DB     11
 codeWord DW     0D57Fh

 Start:              ; ��窠 �室� � �p��p����. ��p�������� � ����
                     ; �p��p���� ��p����: END Start
 ;============================= mov ===================================
        mov     ax, @data  ;ax<-@data
; @data- 16-� ࠧ�來� �����᪨� ���� ᥣ���� DS ;\
        mov     ds, ax     ;ds<-ax                   ; >  ���樠������ ds � es
        mov     es, ax     ;es<-ax                   ;/

        mov     ah, 1                 ;ah <- 1
        mov     bx, 0FFh              ;bx <- 0FFh

        mov     al, [dataByte]        ;al <- M(DS*16+offset dataByte )
        mov     [dataByte], ah        ;M(DS*16+offset dataByte ) <- ah
        mov     bx, offset dataWord   ;bx <- offset dataWord 
        mov     si, offset dataByte   ;si <- offset dataByte

        mov     cx, ax                ;cx <- ax
        mov     dx, ds                ;dx <- ds

        mov     ax, [bx]              ;al <- M(DS*16+bx)
                                      ;ah <- M(DS*16+bx+1)
        mov     [si], cl              ;M(DS*16+si) <- cl
                                    ;� �祩�� ����� � ���ᮬ,
                                    ;��室�騬�� � si<-cl

        mov     si, 2                 ;si <- 2(������ ���ᨢ�)
        mov     di, 6                 ;di <- 6(������ ���ᨢ�)
        mov     [array1 + si], 16     ;M(DS*16+offset array1+si) <- 16 
                                      ;array1(2)<-16
        mov     [array2 + di], 0EDh   ;M(DS*16+offset array2+di) <-0EDh 
                                      ;array2(6) <- 0EDh
        mov     al, [byte di - 2]     ;al <- M(DS*16+di-2 
        mov     ah, [array2 + di]     ;ah <- M(DS*16+offset array2 +di)

        mov     bl, [cs:codeByte]     ;bl <- M(CS*16+offset codeByte )
        mov     [cs:codeByte], bh     ;M(CS*16+offset codeByte)  <- bh

 ;========================== push & pop ==================================

        pushf                     ; �⥪ <- p�����p 䫠��� 
                                  ;M(SS*16 + SP��� - 1) <- �� RF      
                                  ;M(SS*16 + SP��� - 2) <- �� RF 
                                  ;
        push    [word dataWord]   ; �⥪ <- dataWord
                                  ;M(SS*16 + SP��� - 1) <- �� dataWord      
                                  ;M(SS*16 + SP��� - 2) <- �� dataWord;
                                  ;
        push    ax                ; M(SS*16+SP���-1)<-ah 
                                  ; M(SS*16+SP���-2)<-al ;SP<-SP���-2
        push    bx                ; M(SS*16+SP���-1)<-bh
                                  ; M(SS*16+SP���-2)<-bl ;SP<-SP���-2
                                  
        pop     ax                ; al<-M(SS*16+SP���) = bl
                                  ; ah<-M(SS*16+SP���+1) = bh ;SP<-(SP���+2)
        pop     bx                ; bl<-M(SS*16+SP���) = al
                                  ; bh<-M(SS*16+SP���+1) = ah  ;SP<-(SP+2)
                        ;�ந��襫 ����� ॣ���஢ ax(���������) � bx(����)

        push    ds                ; �⥪ <- ds
                                  ; M(SS*16+SP���-1)<- �� DS
                                  ; M(SS*16+SP���-2)<- �� DS
        pop     es                ; ES <- �⥪
                                  ; l ES <- M(SS*16+SP���)
                                  ; h ES <- M(SS*16+SP���+1) ; SP<-SP���+2
;⠪�� ��ࠧ�� �������⥫�� ᥣ����(es) ��������� ����ਫ ᥣ���� ������(ds)

        pop     [word cs:codeWord]; M(CS*16+offset codeWord )<-M(SS*16+SP���)  
                                 ; M(CS*16+offset codeWord+1 )<-M(SS*16+SP���+1) 
                                  ; SP <- SP��� + 2 
        popf                      ;p�����p 䫠��� <- �⥪


 ;============================== xchg ====================================

        xchg    ax, ax            ;ax<->ax ;����� ������(⮦�, �� � nop)

        xchg    bx, ax            ;bx <-> ax ;����� ᮤ�ন���� bx � ax
        xchg    cl, dh            ;cl <-> dh ;����� ᮤ�ন���� cl � dh

        xchg    [byte dataByte], ah    ;M(DS*16+offset dataByte )<->ah
        xchg    bx, [word cs:codeWord] ;bl <->M(CX*16+offset codeWord )
                                       ;bh <->M(CX*16+offset codeWord+1 )
        xchg    ch, [array1 + 4]       ;ch <-> M(DS*16+offset array1 +4)

 ;=========================== xlat & xlatb ================================

        mov     al, 2                  ; al<-2
        mov     bx, offset array1      ;bx <- offset array1 
        xlatb                          ;al <- M(DS*16 + bx + al)
                                       ;al <- array1(2)
        mov     al, 6                  ;al <- 6
        mov     bx, offset array2      ;bx <- offset array2 
        xlat    [es:bx]                ;al <- M(ES*16 + bx + al)

 ;================================ lea ====================================

        lea     bx, [array1]          ;bx <- EA=offset array1 
        lea     bx, [array2 + 2]      ;bx <- EA=offset array2+2 
        mov     si, 4                 ;si <- 4
        lea     bx, [array1 + si - 1] ;bx <- EA=offset array1+si-1 

 ;================================ lds ====================================
 ;�p���p ��p���� ��p����p�� �p�� �⥪ � �� �����祭��
 ;H����p���⢥���� ��p���� �� ����᪠����
         push   cs                      ; �����뢠�� � �⥪ ��p�� ᥣ����
                                        ; ��p������� codeByte (ᥣ���� CS)
         mov    ax, offset codeByte     ; �����뢠�� � �⥪ ᬥ饭��
         push   ax                      ; ��p������� codeByte
 ;        ...                            ;
 ;        ...                            ;   3���� ����� ��� �����
 ;        ...                            ;      ����
         mov    bp, sp                  ; bp<-sp
         lds    si, [bp]                ;  SI l <- M(SS*16+bp)
                                        ;  SI h<- M(SS*16+bp+1)
                                        ;  DS l<- M(SS*16+bp+2)
                                        ;  DS h<- M(SS*16+bp+3)
                                        ; ����⠭�������� �:
                                        ; DS - ᮤ�ন��� CS;
                                        ; SI - ᬥ饭�� codeByte.
                                        ; ����p� � ds:si ��室���� ��p��
                                        ; ��p������� codeByte
 ;================================ les ====================================
 ;�ਬ�� ��࠭���� �  ����⠭������� ������� ���� ��६����� codeByte
 ;H����p���⢥���� ��p���� �� ����᪠����
      mov    [word storeAdr + 2],@code ;���p��塞 ��p�� ᥣ���� CS
                                    ; M(DS*16+offset storeAdr  + 2) <- CS l       
                                    ; M(DS*16+offset storeAdr  + 2 +1) <- CS h
      mov    [word storeAdr], offset codeByte ;���p��塞 ᬥ饭�� codeByte
                            ; M(DS*16+offset storeAdr) <-offset CodeByte l   
                            ; M(DS*16+offset storeAdr+1) <-offset CodeByte h   

 ;        ...                            ;
 ;        ...                            ;    ��直� ᢮� ����
 ;        ...                            ;
         mov    bx, offset storeAdr      ;bx<-offset storeAdr 
         les    si, [bx]            ; SI l<-M(DS*16+bx)= �� offset CodeByte 
                                    ; SI h<-M(DS*16+bx+1)= �� offset CodeByte 
                                         ; ES l<-M(DS*16+bx+2)= �� CS
                                         ; ES h<-M(DS*16+bx+3)= �� CS
                                         ; ����⠭�������� �:
                                         ; es - ᮤ�ন��� cs;
                                         ; si - ᬥ饭�� CodeByte
 ;========================== lanf & sanf ====================================
 ;
        lahf                    ;ah <- F(7..0)
        xor     ah, 0FFh        ;ah <- ah xor 0FFh ;�������㥬 �� 䫠��
        sahf                    ;F(7..0) <- ah

 ;============================================================================
 Exit:                     ;c⠭��p�� ��室 � DOS �� ����᪠���� �p��p����
        mov     ah,04Ch         ;ah <-04Ch
                                ;4Ch - �㭪�� DOS (�����襭�� ��������
                                ;� �����⮬ �ࠢ����� �ணࠬ�� command.com) 

        mov     al,[exCode]     ;al <- M(DS*16+offset exCode)
                                ;������ � AL ���� �訡��  

        int     21h             ;�p�p뢠��� DOS ,��뢠�饥 �㭪��
                                ;DOS, ��।��塞�� ����� � ॣ���� AH
        END Start
