section .text
    global _ft_write
    extern ___error
; ssize_t write(int fd, const void *buf, size_t count);
; 프로토타입은 (fd == rdi, buf == rsi, size == rdx) 전달되어서 MOV 안 해줘도 됨

_ft_write:
    mov     rax, 0x02000004 ; 0x02000004 -> write()
    syscall                 ; syscall시 write가 정상적으로 된다
    jc      error           ; 만약 에러 상황 발생시 carry비트가 1이 되면서 error로 넘어감
    ret                     ; 정상적인 종료

error:                      ; 에러 상황일시
    push    rax             ; 오류가 있을 경우 rax에 작은 음수(-1 ~ -4095)를 반환, 그래서 미리 push
    call    ___error        ; extern한 ___error 함수 call
    pop     rdx
    mov     [rax], rdx      ; [rax] -> address에 대하여 접근
    mov     rax, -1         ; 에러상황이라 -1을 반환값에 저장
    ret
