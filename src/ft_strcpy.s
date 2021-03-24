section .text
    global _ft_strcpy
; char    *strcpy(char * dst, const char * src);
; dst == rdi, src == rsi

_ft_strcpy:
    push    rbx     ; 메모리 주소를 저장하기 위한 용도로 사용
    push    rcx     ; 반복문에서 카운터로 사용되는 레지스터
    mov     rax, rdi        ; rdi(목적지)를 rax레지스터로 지정하기
    mov		rbx, rsi		; rsi(출발지)를 rbx레지스터로 지정하기
    mov		rcx, -1			; rcx레지스터의 값을 -1로 지정하기

loop:
	inc		rcx							; rcx의 값 증가시키기
    mov		dl, byte [rbx + rcx]		; dl에 rbx + rcx번째 데이터를 넣기
    mov		byte [rax + rcx], dl		; rax + rcx번째 데이터에 dl값 넣기
    cmp		byte [rbx + rcx], 0			; rbx + rcx번째 데이터를 0으로 만들기
    jnz		loop						; Jump if not zero -> _loop

end:
    pop		rcx							; rcx 스택에서 꺼내기
    pop		rbx							; rbx 스택에서 꺼내기
    ret