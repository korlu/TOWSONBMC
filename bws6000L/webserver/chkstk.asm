	.386P
_TEXT	SEGMENT PARA PUBLIC 'CODE'

__chkstk PROC public 			; _chkstk
ret 0 
	push	ebp
	mov	ebp, esp

	push	ebx
	mov	ebx, 1000
	mov	al, 'W'
	int	0fh
	pop	ebx

	pop	ebp

	mov	eax, 1ffffh
	push	eax
	pop	esp
	
	ret	0
__chkstk ENDP					; _chkstk

_TEXT	ENDS
END
