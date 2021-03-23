section .text
    global _ft_strcmp
; int	ft_strcmp(const char *s1, const char *s2);
; s1 == rdi, s2 == rsi
; ret == rax -> al

_ft_strcmp:
    push    rcx
    xor     rcx, rcx
    jmp     loop

loop_inc:
    inc     rcx

loop:
    cmp     BYTE[rdi+rcx], 0
    je      end
    cmp     BYTE[rsi+rcx], 0
    je      end
    mov     al, BYTE[rdi+rcx]
    cmp     al, BYTE[rsi+rcx]
    je      loop_inc

end:
    mov     al, BYTE[rdi+rcx]
    sub     al, BYTE[rsi+rcx]
    pop     rcx
    ret