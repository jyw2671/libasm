section .text
    global _ft_strcpy
    extern _ft_strlen
; char    *strcpy(char * dst, const char * src);

_ft_strcpy:
    push    rbx     ; 메모리 주소를 저장하기 위한 용도로 사용
    push    rcx     ; 반복문에서 카운터로 사용되는 레지스터

loop:
