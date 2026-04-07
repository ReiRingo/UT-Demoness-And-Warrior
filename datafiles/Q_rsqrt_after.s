	.text
	.globl	_Z11quake_rsqrtf
	.def	_Z11quake_rsqrtf;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11quake_rsqrtf
_Z11quake_rsqrtf:
.LFB118:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movss	%xmm0, 16(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movss	16(%rbp), %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	leaq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	sarl	%eax
	movl	%eax, %edx
	movl	$1597463007, %eax
	subl	%edx, %eax
	movl	%eax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-8(%rbp), %xmm0
	mulss	-12(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-12(%rbp), %xmm1
	movss	.LC0(%rip), %xmm0
	subss	%xmm1, %xmm0
	movss	-12(%rbp), %xmm1
	mulss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Example result: %f\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB119:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	_Z11quake_rsqrtf
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC3(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1069547520
	.align 4
.LC1:
	.long	1056964608
	.align 4
.LC2:
	.long	1078530000
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r5) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
