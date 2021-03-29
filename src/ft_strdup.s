section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
; char *strdup(const char *s1);
; s1 == rdi
_ft_strdup:
	push	rdi			; rdi를 ft_strlen에서 쓸것이므로 미리 push
	call	_ft_strlen	; ft_strlen call
	inc		rax			; rax에 1 증가
	mov		rdi, rax	; rdi에 rax값 넣어놓고(malloc할 크기)
	call	_malloc
	cmp		rax, 0
	jz		error
	pop		rsi
	mov		rdi, rax
	call	_ft_strcpy
	ret

error:
	pop		rdi
	ret