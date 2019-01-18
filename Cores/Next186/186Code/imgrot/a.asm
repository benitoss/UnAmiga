.186
.model tiny
.code
        org 100h
start: 
        xor bp,bp
        mov word ptr [bp+8*4], offset inth
        mov [bp+8*4+2],cs
        mov word ptr [bp+9*4], offset inth
        mov [bp+9*4+2],cs
        mov word ptr [bp+74h*4], offset inth
        mov [bp+74h*4+2],cs
        xor al,al
        out 0,al
        mov al,0h
        out 21h,al

	mov ax,0ah
	out 8ah,ax
	inc ax
	out 8bh,ax
	inc ax
	out 8ch,ax
	inc ax
	out 8dh,ax
	inc ax
	out 8eh,ax
 
  	mov dx,3c0h
    	mov al,10h
    	out dx,al
    	mov al,01h
    	out dx,al   ; // VGA 640*480

	
	mov	al, 13h
	out 	dx, al
	mov	al, 0
	out	dx, al		; 0 pan

	mov dx, 3d4h
	mov ax, 6h
	out dx, ax
	mov ax, 5013h
	out dx, ax


	mov	dx, 3c4h
	mov	ax, 0f02h
	out	dx, ax		; enable all write planes
	mov	ax, 0804h
	out	dx, ax		; clear planar mode
	mov	dl, 0ceh
	mov	ax, 0001h
	out	dx, ax		; disable set/reset
	mov	ax, 0003h
	out	dx, ax		; reset logical op and rotate count
	mov	ax, 0005h
	out	dx, ax		; set write mode to 00 (CPU access)
	mov	ax, 0ff08h
	out	dx, ax		; set bitmask to CPU access

        sti
        call defpal
;        call cls



newscreen:
        xor si,si

screen:
        push cs
        pop ds
        push si
        mov ax,sintable[si]
        sar ax,3
        mov [p1+2],ax
        mov [p3+2],ax
        mov bx,ax
        add ax,ax
        mov [p2+2],ax
        add ax,bx
        mov [p1a+2],ax
        add ax,bx
        mov [p2a+2],ax
        imul bp,bx,-320
        imul dx,bx,240
        mov si,sintable[si+18]
        sar si,3
        imul ax,si,-240
        add bp,ax
        imul ax,si,-320
        add dx,ax


        push 0a000h;0b2c0h
        pop es 
        push 01000h
        pop ds 

line:
        mov di,0
        mov cx,160
        push bp
        push dx
pixel:
p1 label word
        lea bx,[bp+1234]
        add dx,si
        mov bl,dh
        mov al,[bx]
p2 label word        
        lea bx,[bp+1234]
        add dx,si
        mov bl,dh
        mov ah,[bx]
        stosw
p1a label word
        lea bx,[bp+1234]
        add dx,si
        mov bl,dh
        mov al,[bx]
p2a label word        
        lea bx,[bp+1234]
        add dx,si
        mov bp,bx
        mov bl,dh
        mov ah,[bx]
        stosw
        loop pixel
        pop dx
        pop bp
p3 label word        
        sub dx,1234h
        add bp,si
        mov ax,es
        add ax,40
        mov es,ax
        cmp ax,0eb00h;0d840h;0eb00h
        jne line
        pop si
        add si,2
        cmp si, 72
        jnz screen
        jmp newscreen   

even
sintable    dw 0,44,87,128,164,196,221,240,252,256,252,240,221,196,164,128,87,44,0
            dw -44,-87,-128,-164,-196,-221,-240,-252,-256,-252,-240,-221,-196,-164,-128,-87,-44
            dw 0,44,87,128,164,196,221,240,252


;------------------------------ set default palette ---------
defpal proc near
        mov dx,3c8h
        xor ax,ax
        out dx,al
        inc dx
lop:    
        mov al,ah
        and al,7
        shl al,3
        out dx,al
        mov al,ah
        and al,38h
        out dx,al
        mov al,ah
        ror al,2
        and al,30h
        cmp al,30h
        jne nob
        or al,8
nob:
        out dx,al
        inc ah
        jnz lop
        ret
defpal endp

;------------------------------ get palette ------------------
getpal proc near    ; es:di = mem palette, al=start color, cx = num colors
        mov dx,3c7h
        out dx,al
        inc dx
        inc dx
        imul cx,3
        rep insb
        ret
getpal endp


;------------------------------ set palette ------------------
setpal proc near    ; ds:si = mem palette, al=start color, cx = num colors
        mov dx, 3c8h
        out dx,al
        inc dx
        imul cx,3
        rep outsb
        ret
setpal endp



;------------------------------- copy screen ------------------
copyscr proc near   ; ax = src screen segment
        mov ds,ax
        mov ax,0a000h
        mov es,ax
        mov dx,48
copy1:
        mov cx,3200
        xor si,si
        xor di,di
        rep movsw
        mov ax,ds
        add ax,400
        mov ds,ax
        mov ax,es
        add ax,400
        mov es,ax
        dec dx
        jne copy1
        ret

copyscr endp

;------------------------------- putpixel ----------------------
putpixel proc near  ;cl=color, ax=y, bx=x
        push ds
        mov dx,640
        mul dx
        add bx,ax
        adc dl,0ah
        ror dx,4
        mov ds,dx
        mov [bx],cl
        pop ds
        ret
putpixel endp


;------------------------------- flush --------------------------
flush:  push ds
        mov bh,8
        mov ds,bx
flush1:        
        mov al,[bx]
        dec bh
        jnz flush1
        pop ds
        ret  
    

;---------------------- Timer interrupt 08 ------------------
inth:  
        push ax
        push bp
        mov bp,sp
        mov ax,[bp+4]
        out 0,al
        pop bp
        pop ax
        iret

; ----------------  serial receive byte 115200 bps --------------
srecb   dw  0ff26h  


;----------------------------------- vertical scroll ------------------------
vscroll proc near   ; al = lines
        mov si,0a000h-40
        mov es,si
        xor ah,ah
	  mov dx,480
	  sub dx,ax
        imul ax,ax,40
        add ax,si
        mov ds,ax
vsc1:
        mov ax,es
        add ax,40
        mov es,ax
        mov ax,ds
        add ax,40
        mov ds,ax
        mov cx,320
        xor si,si
        xor di,di
        rep movsw
        dec dx
        jnz vsc1
        ret
vscroll endp


;----------------------------------- CLS -------------------------------------
cls proc near   ; al = color
        mov ah,al
        mov bx,0a000h
        mov dl,4
cls1:
        mov cx,8000h
        call clseg
        add bh,10h
        dec dl
        jnz cls1
        mov cx,22528
clseg:
        push es
        xor di,di
        mov es,bx    
        rep stosw
        pop es
        ret
cls endp
       
even
buf     label byte


end start
