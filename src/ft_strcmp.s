section .text
    global _ft_strcmp
; int	ft_strcmp(const char *s1, const char *s2);
; s1 == rdi, s2 == rsi
; ret == rax -> al

_ft_strcmp:
    push    rcx         ; 반복문에서 카운터로 사용되는 레지스터
    xor     rcx, rcx
    jmp     loop

loop_inc:
    inc     rcx         ; jmp가 없으면 아랫줄로

loop:
    cmp     BYTE[rdi+rcx], 0
    je      end
    cmp     BYTE[rsi+rcx], 0
    je      end
    mov     al, BYTE[rdi+rcx]   ; byte가 8bit 이므로
    cmp     al, BYTE[rsi+rcx]   ; rax가 아닌 al 사용
    je      loop_inc

end:
    mov     al, BYTE[rdi+rcx]
    sub     al, BYTE[rsi+rcx]
    pop     rcx
    ret