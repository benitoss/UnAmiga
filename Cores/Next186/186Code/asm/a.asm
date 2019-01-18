.186
.model tiny
.code
        org 100h
start: 
        push    0b800h
        pop     ds
        mov     dx, 80h
        xor     di, di
lop:        
        in      ax, dx
        add     al, 'A'
        mov     [di], al
        inc     di
        inc     di
        inc     dx
        test    dl, 15
        jnz     short lop
        
        mov     di, 160
        push    ds
        pop     es
        mov     cx, 1000h
        mov     ax, 1234h
        rep     stosw
        hlt
        
end start
