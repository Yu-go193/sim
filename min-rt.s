	j	_min_caml_start
print_int@2638:
	addi	$at, $zero, 128
	bne	$v0, $at, else@9982
	ori	$v0, $zero, 49
	print_char	$v0
	ori	$v0, $zero, 50
	print_char	$v0
	ori	$v0, $zero, 56
	print_char	$v0
	jr	$ra
else@9982:
	addi	$at, $zero, 255
	bne	$v0, $at, else@9984
	ori	$v0, $zero, 50
	print_char	$v0
	ori	$v0, $zero, 53
	print_char	$v0
	ori	$v0, $zero, 53
	print_char	$v0
	jr	$ra
else@9984:
	addi	$v0, $v0, 48
	print_char	$v0
	jr	$ra
kernel_sin@2661:
	mulf	$f1, $f0, $f0
	mulf	$f2, $f0, $f1
	mulf	$f3, $f2, $f1
	mulf	$f1, $f3, $f1
	lui	$at, 15914
	ori	$at, $at, 43692
	mfc2	$f4, $at
	mulf	$f2, $f4, $f2
	subf	$f0, $f0, $f2
	lui	$at, 15368
	ori	$at, $at, 34406
	mfc2	$f2, $at
	mulf	$f2, $f2, $f3
	addf	$f0, $f0, $f2
	lui	$at, 14669
	ori	$at, $at, 25782
	mfc2	$f2, $at
	mulf	$f1, $f2, $f1
	subf	$f0, $f0, $f1
	jr	$ra
kernel_cos@2675:
	mulf	$f0, $f0, $f0
	mulf	$f1, $f0, $f0
	mulf	$f2, $f0, $f1
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f4, $at
	mulf	$f0, $f4, $f0
	subf	$f0, $f3, $f0
	lui	$at, 15658
	ori	$at, $at, 42889
	mfc2	$f3, $at
	mulf	$f1, $f3, $f1
	addf	$f0, $f0, $f1
	lui	$at, 15027
	ori	$at, $at, 33030
	mfc2	$f1, $at
	mulf	$f1, $f1, $f2
	subf	$f0, $f0, $f1
	jr	$ra
sin@2659:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9987
	lui	$at, 16585
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@9988
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9989
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9990
	lui	$at, 16406
	ori	$at, $at, 52196
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9991
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	swc1	$f1, 0($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	kernel_sin@2661
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lwc1	$f1, 0($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@9991:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f0, $f2
	swc1	$f1, 2($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	kernel_cos@2675
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lwc1	$f1, 2($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@9990:
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9992
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	swc1	$f1, 4($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	kernel_cos@2675
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lwc1	$f1, 4($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@9992:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	swc1	$f1, 6($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	kernel_sin@2661
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lwc1	$f1, 6($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@9989:
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9993
	lui	$at, 16406
	ori	$at, $at, 52196
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9994
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	j	kernel_sin@2661
else@9994:
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	kernel_cos@2675
else@9993:
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9995
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	j	kernel_cos@2675
else@9995:
	j	kernel_sin@2661
else@9988:
	lui	$at, 16585
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	sin@2659
else@9987:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	ori	$at, $zero, 0
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	swc1	$f1, 8($sp)
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	sin@2659
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lwc1	$f1, 8($sp)
	subf	$f0, $f1, $f0
	jr	$ra
kernel_sin@2728:
	mulf	$f1, $f0, $f0
	mulf	$f2, $f0, $f1
	mulf	$f3, $f2, $f1
	mulf	$f1, $f3, $f1
	lui	$at, 15914
	ori	$at, $at, 43692
	mfc2	$f4, $at
	mulf	$f2, $f4, $f2
	subf	$f0, $f0, $f2
	lui	$at, 15368
	ori	$at, $at, 34406
	mfc2	$f2, $at
	mulf	$f2, $f2, $f3
	addf	$f0, $f0, $f2
	lui	$at, 14669
	ori	$at, $at, 25782
	mfc2	$f2, $at
	mulf	$f1, $f2, $f1
	subf	$f0, $f0, $f1
	jr	$ra
kernel_cos@2742:
	mulf	$f0, $f0, $f0
	mulf	$f1, $f0, $f0
	mulf	$f2, $f0, $f1
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f4, $at
	mulf	$f0, $f4, $f0
	subf	$f0, $f3, $f0
	lui	$at, 15658
	ori	$at, $at, 42889
	mfc2	$f3, $at
	mulf	$f1, $f3, $f1
	addf	$f0, $f0, $f1
	lui	$at, 15027
	ori	$at, $at, 33030
	mfc2	$f1, $at
	mulf	$f1, $f1, $f2
	subf	$f0, $f0, $f1
	jr	$ra
cos@2726:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9996
	lui	$at, 16585
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@9997
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9998
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@9999
	lui	$at, 16406
	ori	$at, $at, 52196
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10000
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	j	kernel_sin@2728
else@10000:
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	kernel_cos@2742
else@9999:
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10001
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	swc1	$f1, 0($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	kernel_cos@2742
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lwc1	$f1, 0($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10001:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	swc1	$f1, 2($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	kernel_sin@2728
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lwc1	$f1, 2($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@9998:
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10002
	lui	$at, 16406
	ori	$at, $at, 52196
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10003
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	swc1	$f1, 4($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	kernel_cos@2742
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lwc1	$f1, 4($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10003:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f2, $at
	subf	$f0, $f0, $f2
	swc1	$f1, 6($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	kernel_sin@2728
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lwc1	$f1, 6($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10002:
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10004
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	j	kernel_sin@2728
else@10004:
	j	kernel_cos@2742
else@9997:
	lui	$at, 16585
	ori	$at, $at, 4059
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	sin@2659
else@9996:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	j	cos@2726
kernel_atan@2793:
	mulf	$f1, $f0, $f0
	mulf	$f2, $f0, $f1
	mulf	$f3, $f2, $f1
	mulf	$f4, $f3, $f1
	mulf	$f5, $f4, $f1
	mulf	$f6, $f5, $f1
	mulf	$f1, $f6, $f1
	lui	$at, 16042
	ori	$at, $at, 43690
	mfc2	$f7, $at
	mulf	$f2, $f7, $f2
	subf	$f0, $f0, $f2
	lui	$at, 15948
	ori	$at, $at, 52429
	mfc2	$f2, $at
	mulf	$f2, $f2, $f3
	addf	$f0, $f0, $f2
	lui	$at, 15890
	ori	$at, $at, 18725
	mfc2	$f2, $at
	mulf	$f2, $f2, $f4
	subf	$f0, $f0, $f2
	lui	$at, 15843
	ori	$at, $at, 36408
	mfc2	$f2, $at
	mulf	$f2, $f2, $f5
	addf	$f0, $f0, $f2
	lui	$at, 15799
	ori	$at, $at, 54894
	mfc2	$f2, $at
	mulf	$f2, $f2, $f6
	subf	$f0, $f0, $f2
	lui	$at, 15733
	ori	$at, $at, 59333
	mfc2	$f2, $at
	mulf	$f1, $f2, $f1
	addf	$f0, $f0, $f1
	jr	$ra
atan@2791:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10005
	ori	$at, $zero, 0
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	lui	$at, 16096
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10006
	lui	$at, 16412
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10007
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f2, $at
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	divf	$f0, $f3, $f0
	swc1	$f1, 0($sp)
	swc1	$f2, 2($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	kernel_atan@2793
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lwc1	$f1, 2($sp)
	subf	$f0, $f1, $f0
	lwc1	$f1, 0($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10007:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f2, $at
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	subf	$f3, $f0, $f3
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f4, $at
	addf	$f0, $f0, $f4
	divf	$f0, $f3, $f0
	swc1	$f1, 4($sp)
	swc1	$f2, 6($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	kernel_atan@2793
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lwc1	$f1, 6($sp)
	addf	$f0, $f1, $f0
	lwc1	$f1, 4($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10006:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	swc1	$f1, 8($sp)
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	kernel_atan@2793
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lwc1	$f1, 8($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10005:
	lui	$at, 16096
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10008
	lui	$at, 16412
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10009
	lui	$at, 16329
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f2, $at
	divf	$f0, $f2, $f0
	swc1	$f1, 10($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 13
	jal	kernel_atan@2793
	addi	$sp, $sp, -13
	lw	$ra, 12($sp)
	lwc1	$f1, 10($sp)
	subf	$f0, $f1, $f0
	jr	$ra
else@10009:
	lui	$at, 16201
	ori	$at, $at, 4059
	mfc2	$f1, $at
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f2, $at
	subf	$f2, $f0, $f2
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	addf	$f0, $f0, $f3
	divf	$f0, $f2, $f0
	swc1	$f1, 12($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	kernel_atan@2793
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lwc1	$f1, 12($sp)
	addf	$f0, $f1, $f0
	jr	$ra
else@10008:
	j	kernel_atan@2793
sgn@2889:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10010
	ori	$v0, $zero, 1
	j	cont@10011
else@10010:
	ori	$v0, $zero, 0
cont@10011:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10012
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10013
	ori	$v0, $zero, 0
	j	cont@10014
else@10013:
	ori	$v0, $zero, 1
cont@10014:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10015
	lui	$at, 49024
	ori	$at, $at, 0
	mfc2	$f0, $at
	jr	$ra
else@10015:
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	jr	$ra
else@10012:
	ori	$at, $zero, 0
	mfc2	$f0, $at
	jr	$ra
vecset@2905:
	swc1	$f0, 0($v0)
	swc1	$f1, 1($v0)
	swc1	$f2, 2($v0)
	jr	$ra
vecfill@2915:
	swc1	$f0, 0($v0)
	swc1	$f0, 1($v0)
	swc1	$f0, 2($v0)
	jr	$ra
veccpy@2926:
	lwc1	$f0, 0($v1)
	swc1	$f0, 0($v0)
	lwc1	$f0, 1($v1)
	swc1	$f0, 1($v0)
	lwc1	$f0, 2($v1)
	swc1	$f0, 2($v0)
	jr	$ra
vecunit_sgn@2992:
	lwc1	$f0, 0($v0)
	mulf	$f0, $f0, $f0
	lwc1	$f1, 1($v0)
	mulf	$f1, $f1, $f1
	addf	$f0, $f0, $f1
	lwc1	$f1, 2($v0)
	mulf	$f1, $f1, $f1
	addf	$f0, $f0, $f1
	sqrt	$f0, $f0
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10019
	ori	$a0, $zero, 1
	j	cont@10020
else@10019:
	ori	$a0, $zero, 0
cont@10020:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10021
	addi	$at, $zero, 0
	bne	$v1, $at, else@10023
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f1, $f0
	j	cont@10024
else@10023:
	lui	$at, 49024
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f1, $f0
cont@10024:
	j	cont@10022
else@10021:
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
cont@10022:
	lwc1	$f1, 0($v0)
	mulf	$f1, $f1, $f0
	swc1	$f1, 0($v0)
	lwc1	$f1, 1($v0)
	mulf	$f1, $f1, $f0
	swc1	$f1, 1($v0)
	lwc1	$f1, 2($v0)
	mulf	$f0, $f1, $f0
	swc1	$f0, 2($v0)
	jr	$ra
veciprod@3027:
	lwc1	$f0, 0($v0)
	lwc1	$f1, 0($v1)
	mulf	$f0, $f0, $f1
	lwc1	$f1, 1($v0)
	lwc1	$f2, 1($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	lwc1	$f1, 2($v0)
	lwc1	$f2, 2($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	jr	$ra
veciprod2@3046:
	lwc1	$f3, 0($v0)
	mulf	$f0, $f3, $f0
	lwc1	$f3, 1($v0)
	mulf	$f1, $f3, $f1
	addf	$f0, $f0, $f1
	lwc1	$f1, 2($v0)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	jr	$ra
vecaccum@3061:
	lwc1	$f1, 0($v0)
	lwc1	$f2, 0($v1)
	mulf	$f2, $f0, $f2
	addf	$f1, $f1, $f2
	swc1	$f1, 0($v0)
	lwc1	$f1, 1($v0)
	lwc1	$f2, 1($v1)
	mulf	$f2, $f0, $f2
	addf	$f1, $f1, $f2
	swc1	$f1, 1($v0)
	lwc1	$f1, 2($v0)
	lwc1	$f2, 2($v1)
	mulf	$f0, $f0, $f2
	addf	$f0, $f1, $f0
	swc1	$f0, 2($v0)
	jr	$ra
vecadd@3088:
	lwc1	$f0, 0($v0)
	lwc1	$f1, 0($v1)
	addf	$f0, $f0, $f1
	swc1	$f0, 0($v0)
	lwc1	$f0, 1($v0)
	lwc1	$f1, 1($v1)
	addf	$f0, $f0, $f1
	swc1	$f0, 1($v0)
	lwc1	$f0, 2($v0)
	lwc1	$f1, 2($v1)
	addf	$f0, $f0, $f1
	swc1	$f0, 2($v0)
	jr	$ra
vecscale@3134:
	lwc1	$f1, 0($v0)
	mulf	$f1, $f1, $f0
	swc1	$f1, 0($v0)
	lwc1	$f1, 1($v0)
	mulf	$f1, $f1, $f0
	swc1	$f1, 1($v0)
	lwc1	$f1, 2($v0)
	mulf	$f0, $f1, $f0
	swc1	$f0, 2($v0)
	jr	$ra
vecaccumv@3151:
	lwc1	$f0, 0($v0)
	lwc1	$f1, 0($v1)
	lwc1	$f2, 0($a0)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	swc1	$f0, 0($v0)
	lwc1	$f0, 1($v0)
	lwc1	$f1, 1($v1)
	lwc1	$f2, 1($a0)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	swc1	$f0, 1($v0)
	lwc1	$f0, 2($v0)
	lwc1	$f1, 2($v1)
	lwc1	$f2, 2($a0)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	swc1	$f0, 2($v0)
	jr	$ra
read_screen_settings@3590:
	read_word	$at
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65461
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65461
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65461
	swc1	$f0, 2($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	swc1	$f0, 0($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	cos@2726
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lwc1	$f1, 0($sp)
	swc1	$f0, 2($sp)
	mvf	$f0, $f1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	sin@2659
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	read_word	$at
	mfc2	$f1, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f2, $at
	mulf	$f1, $f1, $f2
	swc1	$f0, 4($sp)
	swc1	$f1, 6($sp)
	mvf	$f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	cos@2726
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lwc1	$f1, 6($sp)
	swc1	$f0, 8($sp)
	mvf	$f0, $f1
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	sin@2659
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lwc1	$f1, 2($sp)
	mulf	$f2, $f1, $f0
	lui	$at, 17224
	ori	$at, $at, 0
	mfc2	$f3, $at
	mulf	$f2, $f2, $f3
	lui	$v0, 1
	ori	$v0, $v0, 65362
	swc1	$f2, 0($v0)
	lui	$at, 49992
	ori	$at, $at, 0
	mfc2	$f2, $at
	lwc1	$f3, 4($sp)
	mulf	$f2, $f3, $f2
	lui	$v0, 1
	ori	$v0, $v0, 65362
	swc1	$f2, 1($v0)
	lwc1	$f2, 8($sp)
	mulf	$f4, $f1, $f2
	lui	$at, 17224
	ori	$at, $at, 0
	mfc2	$f5, $at
	mulf	$f4, $f4, $f5
	lui	$v0, 1
	ori	$v0, $v0, 65362
	swc1	$f4, 2($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65368
	swc1	$f2, 0($v0)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	lui	$v0, 1
	ori	$v0, $v0, 65368
	swc1	$f4, 1($v0)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f4, $at
	lui	$v0, 1
	ori	$v0, $v0, 65368
	swc1	$f4, 2($v0)
	mfc1	$at, $f3
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f4, $at
	mulf	$f0, $f4, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65365
	swc1	$f0, 0($v0)
	mfc1	$at, $f1
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65365
	swc1	$f0, 1($v0)
	mfc1	$at, $f3
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	mulf	$f0, $f0, $f2
	lui	$v0, 1
	ori	$v0, $v0, 65365
	swc1	$f0, 2($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65461
	lwc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65362
	lwc1	$f1, 0($v0)
	subf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65458
	swc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65461
	lwc1	$f0, 1($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65362
	lwc1	$f1, 1($v0)
	subf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65458
	swc1	$f0, 1($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65461
	lwc1	$f0, 2($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65362
	lwc1	$f1, 2($v0)
	subf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65458
	swc1	$f0, 2($v0)
	jr	$ra
read_light@3667:
	read_word	$v0
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	swc1	$f0, 0($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	sin@2659
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65455
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lwc1	$f1, 0($sp)
	swc1	$f0, 2($sp)
	mvf	$f0, $f1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	cos@2726
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lwc1	$f1, 2($sp)
	swc1	$f0, 4($sp)
	mvf	$f0, $f1
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	sin@2659
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lwc1	$f1, 4($sp)
	mulf	$f0, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65455
	swc1	$f0, 0($v0)
	lwc1	$f0, 2($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	cos@2726
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lwc1	$f1, 4($sp)
	mulf	$f0, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65455
	swc1	$f0, 2($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65454
	swc1	$f0, 0($v0)
	jr	$ra
rotate_quadratic_matrix@3693:
	lwc1	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	cos@2726
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 0($v0)
	swc1	$f0, 2($sp)
	mvf	$f0, $f1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	sin@2659
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 1($v0)
	swc1	$f0, 4($sp)
	mvf	$f0, $f1
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	cos@2726
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 1($v0)
	swc1	$f0, 6($sp)
	mvf	$f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	sin@2659
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 2($v0)
	swc1	$f0, 8($sp)
	mvf	$f0, $f1
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	cos@2726
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 2($v0)
	swc1	$f0, 10($sp)
	mvf	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 13
	jal	sin@2659
	addi	$sp, $sp, -13
	lw	$ra, 12($sp)
	lwc1	$f1, 10($sp)
	lwc1	$f2, 6($sp)
	mulf	$f3, $f2, $f1
	lwc1	$f4, 8($sp)
	lwc1	$f5, 4($sp)
	mulf	$f6, $f5, $f4
	mulf	$f6, $f6, $f1
	lwc1	$f7, 2($sp)
	mulf	$f8, $f7, $f0
	subf	$f6, $f6, $f8
	mulf	$f8, $f7, $f4
	mulf	$f8, $f8, $f1
	mulf	$f9, $f5, $f0
	addf	$f8, $f8, $f9
	mulf	$f9, $f2, $f0
	mulf	$f10, $f5, $f4
	mulf	$f10, $f10, $f0
	mulf	$f11, $f7, $f1
	addf	$f10, $f10, $f11
	mulf	$f11, $f7, $f4
	mulf	$f0, $f11, $f0
	mulf	$f1, $f5, $f1
	subf	$f0, $f0, $f1
	mfc1	$at, $f4
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	mulf	$f4, $f5, $f2
	mulf	$f2, $f7, $f2
	lw	$v0, 0($sp)
	lwc1	$f5, 0($v0)
	lwc1	$f7, 1($v0)
	lwc1	$f11, 2($v0)
	mulf	$f12, $f3, $f3
	mulf	$f12, $f5, $f12
	mulf	$f13, $f9, $f9
	mulf	$f13, $f7, $f13
	addf	$f12, $f12, $f13
	mulf	$f13, $f1, $f1
	mulf	$f13, $f11, $f13
	addf	$f12, $f12, $f13
	swc1	$f12, 0($v0)
	mulf	$f12, $f6, $f6
	mulf	$f12, $f5, $f12
	mulf	$f13, $f10, $f10
	mulf	$f13, $f7, $f13
	addf	$f12, $f12, $f13
	mulf	$f13, $f4, $f4
	mulf	$f13, $f11, $f13
	addf	$f12, $f12, $f13
	swc1	$f12, 1($v0)
	mulf	$f12, $f8, $f8
	mulf	$f12, $f5, $f12
	mulf	$f13, $f0, $f0
	mulf	$f13, $f7, $f13
	addf	$f12, $f12, $f13
	mulf	$f13, $f2, $f2
	mulf	$f13, $f11, $f13
	addf	$f12, $f12, $f13
	swc1	$f12, 2($v0)
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f12, $at
	mulf	$f13, $f5, $f6
	mulf	$f13, $f13, $f8
	mulf	$f14, $f7, $f10
	mulf	$f14, $f14, $f0
	addf	$f13, $f13, $f14
	mulf	$f14, $f11, $f4
	mulf	$f14, $f14, $f2
	addf	$f13, $f13, $f14
	mulf	$f12, $f12, $f13
	lw	$v0, 1($sp)
	swc1	$f12, 0($v0)
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f12, $at
	mulf	$f13, $f5, $f3
	mulf	$f8, $f13, $f8
	mulf	$f13, $f7, $f9
	mulf	$f0, $f13, $f0
	addf	$f0, $f8, $f0
	mulf	$f8, $f11, $f1
	mulf	$f2, $f8, $f2
	addf	$f0, $f0, $f2
	mulf	$f0, $f12, $f0
	swc1	$f0, 1($v0)
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f0, $at
	mulf	$f2, $f5, $f3
	mulf	$f2, $f2, $f6
	mulf	$f3, $f7, $f9
	mulf	$f3, $f3, $f10
	addf	$f2, $f2, $f3
	mulf	$f1, $f11, $f1
	mulf	$f1, $f1, $f4
	addf	$f1, $f2, $f1
	mulf	$f0, $f0, $f1
	swc1	$f0, 2($v0)
	jr	$ra
read_nth_object@3806:
	read_word	$v1
	addi	$at, $zero, -1
	bne	$v1, $at, else@10033
	ori	$v0, $zero, 0
	jr	$ra
else@10033:
	read_word	$a0
	read_word	$a1
	read_word	$a2
	ori	$a3, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	sw	$a1, 2($sp)
	sw	$a0, 3($sp)
	sw	$a2, 4($sp)
	add	$v0, $a3, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	min_caml_create_float_array
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 2($v0)
	ori	$v1, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 5($sp)
	add	$v0, $v1, $zero
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	min_caml_create_float_array
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 2($v0)
	read_word	$at
	mfc2	$f0, $at
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10034
	ori	$v1, $zero, 0
	j	cont@10035
else@10034:
	ori	$v1, $zero, 1
cont@10035:
	ori	$a0, $zero, 2
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 6($sp)
	sw	$v1, 7($sp)
	add	$v0, $a0, $zero
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	min_caml_create_float_array
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 1($v0)
	ori	$v1, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 8($sp)
	add	$v0, $v1, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	min_caml_create_float_array
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	swc1	$f0, 2($v0)
	ori	$v1, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 9($sp)
	add	$v0, $v1, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	min_caml_create_float_array
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v1, 4($sp)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10036
	j	cont@10037
else@10036:
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	swc1	$f0, 0($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	swc1	$f0, 1($v0)
	read_word	$at
	mfc2	$f0, $at
	lui	$at, 15502
	ori	$at, $at, 64053
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	swc1	$f0, 2($v0)
cont@10037:
	lw	$a0, 3($sp)
	addi	$at, $zero, 2
	bne	$a0, $at, else@10038
	ori	$a1, $zero, 1
	j	cont@10039
else@10038:
	lw	$a1, 7($sp)
cont@10039:
	ori	$a2, $zero, 4
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$a1, 10($sp)
	sw	$v0, 11($sp)
	add	$v0, $a2, $zero
	sw	$ra, 12($sp)
	addi	$sp, $sp, 13
	jal	min_caml_create_float_array
	addi	$sp, $sp, -13
	lw	$ra, 12($sp)
	addi	$gp, $gp, -11
	add	$v1, $zero, $gp
	sw	$v0, 10($v1)
	lw	$v0, 11($sp)
	sw	$v0, 9($v1)
	lw	$a0, 9($sp)
	sw	$a0, 8($v1)
	lw	$a0, 8($sp)
	sw	$a0, 7($v1)
	lw	$a0, 10($sp)
	sw	$a0, 6($v1)
	lw	$a0, 6($sp)
	sw	$a0, 5($v1)
	lw	$a0, 5($sp)
	sw	$a0, 4($v1)
	lw	$a1, 4($sp)
	sw	$a1, 3($v1)
	lw	$a2, 2($sp)
	sw	$a2, 2($v1)
	lw	$a2, 3($sp)
	sw	$a2, 1($v1)
	lw	$a3, 1($sp)
	sw	$a3, 0($v1)
	lui	$a3, 1
	ori	$a3, $a3, 65464
	lw	$t0, 0($sp)
	sll	$t0, $t0, 0
	add	$at, $a3, $t0
	sw	$v1, 0($at)
	addi	$at, $zero, 3
	bne	$a2, $at, else@10040
	lwc1	$f0, 0($a0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10042
	ori	$v1, $zero, 1
	j	cont@10043
else@10042:
	ori	$v1, $zero, 0
cont@10043:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10044
	swc1	$f0, 12($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	sgn@2889
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lwc1	$f1, 12($sp)
	mulf	$f1, $f1, $f1
	divf	$f0, $f0, $f1
	j	cont@10045
else@10044:
	ori	$at, $zero, 0
	mfc2	$f0, $at
cont@10045:
	lw	$v0, 5($sp)
	swc1	$f0, 0($v0)
	lwc1	$f0, 1($v0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10046
	ori	$v1, $zero, 1
	j	cont@10047
else@10046:
	ori	$v1, $zero, 0
cont@10047:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10048
	swc1	$f0, 14($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 17
	jal	sgn@2889
	addi	$sp, $sp, -17
	lw	$ra, 16($sp)
	lwc1	$f1, 14($sp)
	mulf	$f1, $f1, $f1
	divf	$f0, $f0, $f1
	j	cont@10049
else@10048:
	ori	$at, $zero, 0
	mfc2	$f0, $at
cont@10049:
	lw	$v0, 5($sp)
	swc1	$f0, 1($v0)
	lwc1	$f0, 2($v0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10050
	ori	$v1, $zero, 1
	j	cont@10051
else@10050:
	ori	$v1, $zero, 0
cont@10051:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10052
	swc1	$f0, 16($sp)
	sw	$ra, 18($sp)
	addi	$sp, $sp, 19
	jal	sgn@2889
	addi	$sp, $sp, -19
	lw	$ra, 18($sp)
	lwc1	$f1, 16($sp)
	mulf	$f1, $f1, $f1
	divf	$f0, $f0, $f1
	j	cont@10053
else@10052:
	ori	$at, $zero, 0
	mfc2	$f0, $at
cont@10053:
	lw	$v0, 5($sp)
	swc1	$f0, 2($v0)
	j	cont@10041
else@10040:
	addi	$at, $zero, 2
	bne	$a2, $at, else@10054
	lw	$v1, 7($sp)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10056
	ori	$v1, $zero, 1
	j	cont@10057
else@10056:
	ori	$v1, $zero, 0
cont@10057:
	add	$v0, $a0, $zero
	sw	$ra, 18($sp)
	addi	$sp, $sp, 19
	jal	vecunit_sgn@2992
	addi	$sp, $sp, -19
	lw	$ra, 18($sp)
	j	cont@10055
else@10054:
cont@10055:
cont@10041:
	lw	$v0, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10058
	j	cont@10059
else@10058:
	lw	$v0, 5($sp)
	lw	$v1, 11($sp)
	sw	$ra, 18($sp)
	addi	$sp, $sp, 19
	jal	rotate_quadratic_matrix@3693
	addi	$sp, $sp, -19
	lw	$ra, 18($sp)
cont@10059:
	ori	$v0, $zero, 1
	jr	$ra
read_object@3936:
	slti	$at, $v0, 60
	bne	$at, $zero, else@10060
	jr	$ra
else@10060:
	sw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	read_nth_object@3806
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10062
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v1, 0($sp)
	sw	$v1, 0($v0)
	jr	$ra
else@10062:
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	read_object@3936
read_net_item@3947:
	read_word	$v1
	addi	$at, $zero, -1
	bne	$v1, $at, else@10064
	addi	$v0, $v0, 1
	lui	$v1, 65535
	ori	$v1, $v1, 65535
	j	min_caml_create_array
else@10064:
	addi	$a0, $v0, 1
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	read_net_item@3947
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	sll	$v1, $v1, 0
	lw	$a0, 0($sp)
	add	$at, $v0, $v1
	sw	$a0, 0($at)
	jr	$ra
read_or_network@3961:
	ori	$v1, $zero, 0
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	read_net_item@3947
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	add	$v1, $zero, $v0
	lw	$v0, 0($v1)
	addi	$at, $zero, -1
	bne	$v0, $at, else@10065
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	min_caml_create_array
else@10065:
	lw	$v0, 0($sp)
	addi	$a0, $v0, 1
	sw	$v1, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	read_or_network@3961
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 0
	lw	$a0, 1($sp)
	add	$at, $v0, $v1
	sw	$a0, 0($at)
	jr	$ra
read_and_network@3975:
	ori	$v1, $zero, 0
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	read_net_item@3947
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v1, 0($v0)
	addi	$at, $zero, -1
	bne	$v1, $at, else@10066
	jr	$ra
else@10066:
	lui	$v1, 1
	ori	$v1, $v1, 65403
	lw	$a0, 0($sp)
	sll	$a1, $a0, 0
	add	$at, $v1, $a1
	sw	$v0, 0($at)
	addi	$v0, $a0, 1
	j	read_and_network@3975
read_parameter@3986:
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	read_screen_settings@3590
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	read_light@3667
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	read_object@3936
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	read_and_network@3975
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	read_or_network@3961
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65401
	sw	$v0, 0($v1)
	jr	$ra
solver_rect_surface@3999:
	sll	$a3, $a0, 0
	add	$at, $v1, $a3
	lwc1	$f3, 0($at)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	eqf	$f3, $f4
	bc1f	else@10069
	ori	$a3, $zero, 1
	j	cont@10070
else@10069:
	ori	$a3, $zero, 0
cont@10070:
	addi	$at, $zero, 0
	bne	$a3, $at, else@10071
	lw	$a3, 4($v0)
	lw	$v0, 6($v0)
	sll	$t0, $a0, 0
	add	$at, $v1, $t0
	lwc1	$f3, 0($at)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	lef	$f4, $f3
	bc1f	else@10072
	ori	$t0, $zero, 0
	j	cont@10073
else@10072:
	ori	$t0, $zero, 1
cont@10073:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10074
	add	$v0, $zero, $t0
	j	cont@10075
else@10074:
	addi	$at, $zero, 0
	bne	$t0, $at, else@10076
	ori	$v0, $zero, 1
	j	cont@10077
else@10076:
	ori	$v0, $zero, 0
cont@10077:
cont@10075:
	sll	$t0, $a0, 0
	add	$at, $a3, $t0
	lwc1	$f3, 0($at)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10078
	mfc1	$at, $f3
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	j	cont@10079
else@10078:
cont@10079:
	subf	$f0, $f3, $f0
	sll	$v0, $a0, 0
	add	$at, $v1, $v0
	lwc1	$f3, 0($at)
	divf	$f0, $f0, $f3
	sll	$v0, $a1, 0
	add	$at, $v1, $v0
	lwc1	$f3, 0($at)
	mulf	$f3, $f0, $f3
	addf	$f1, $f3, $f1
	abs	$f1, $f1
	sll	$v0, $a1, 0
	add	$at, $a3, $v0
	lwc1	$f3, 0($at)
	lef	$f3, $f1
	bc1f	else@10080
	ori	$v0, $zero, 0
	j	cont@10081
else@10080:
	ori	$v0, $zero, 1
cont@10081:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10082
	ori	$v0, $zero, 0
	jr	$ra
else@10082:
	sll	$v0, $a2, 0
	add	$at, $v1, $v0
	lwc1	$f1, 0($at)
	mulf	$f1, $f0, $f1
	addf	$f1, $f1, $f2
	abs	$f1, $f1
	sll	$v0, $a2, 0
	add	$at, $a3, $v0
	lwc1	$f2, 0($at)
	lef	$f2, $f1
	bc1f	else@10083
	ori	$v0, $zero, 0
	j	cont@10084
else@10083:
	ori	$v0, $zero, 1
cont@10084:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10085
	ori	$v0, $zero, 0
	jr	$ra
else@10085:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
else@10071:
	ori	$v0, $zero, 0
	jr	$ra
solver_rect@4037:
	ori	$a0, $zero, 0
	ori	$a1, $zero, 1
	ori	$a2, $zero, 2
	swc1	$f0, 0($sp)
	swc1	$f2, 2($sp)
	swc1	$f1, 4($sp)
	sw	$v1, 6($sp)
	sw	$v0, 7($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	solver_rect_surface@3999
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10086
	ori	$a0, $zero, 1
	ori	$a1, $zero, 2
	ori	$a2, $zero, 0
	lwc1	$f0, 4($sp)
	lwc1	$f1, 2($sp)
	lwc1	$f2, 0($sp)
	lw	$v0, 7($sp)
	lw	$v1, 6($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	solver_rect_surface@3999
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10087
	ori	$a0, $zero, 2
	ori	$a1, $zero, 0
	ori	$a2, $zero, 1
	lwc1	$f0, 2($sp)
	lwc1	$f1, 0($sp)
	lwc1	$f2, 4($sp)
	lw	$v0, 7($sp)
	lw	$v1, 6($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	solver_rect_surface@3999
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10088
	ori	$v0, $zero, 0
	jr	$ra
else@10088:
	ori	$v0, $zero, 3
	jr	$ra
else@10087:
	ori	$v0, $zero, 2
	jr	$ra
else@10086:
	ori	$v0, $zero, 1
	jr	$ra
solver_surface@4058:
	lw	$v0, 4($v0)
	swc1	$f2, 0($sp)
	swc1	$f1, 2($sp)
	swc1	$f0, 4($sp)
	sw	$v0, 6($sp)
	add	$at, $v1, $zero
	add	$v1, $v0, $zero
	add	$v0, $at, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	veciprod@3027
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10089
	ori	$v0, $zero, 0
	j	cont@10090
else@10089:
	ori	$v0, $zero, 1
cont@10090:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10091
	ori	$v0, $zero, 0
	jr	$ra
else@10091:
	lwc1	$f1, 4($sp)
	lwc1	$f2, 2($sp)
	lwc1	$f3, 0($sp)
	lw	$v0, 6($sp)
	swc1	$f0, 8($sp)
	mvf	$f0, $f1
	mvf	$f1, $f2
	mvf	$f2, $f3
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	veciprod2@3046
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lwc1	$f1, 8($sp)
	divf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
quadratic@4073:
	mulf	$f3, $f0, $f0
	lw	$v1, 4($v0)
	lwc1	$f4, 0($v1)
	mulf	$f3, $f3, $f4
	mulf	$f4, $f1, $f1
	lw	$v1, 4($v0)
	lwc1	$f5, 1($v1)
	mulf	$f4, $f4, $f5
	addf	$f3, $f3, $f4
	mulf	$f4, $f2, $f2
	lw	$v1, 4($v0)
	lwc1	$f5, 2($v1)
	mulf	$f4, $f4, $f5
	addf	$f3, $f3, $f4
	lw	$v1, 3($v0)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10093
	mvf	$f0, $f3
	jr	$ra
else@10093:
	mulf	$f4, $f1, $f2
	lw	$v1, 9($v0)
	lwc1	$f5, 0($v1)
	mulf	$f4, $f4, $f5
	addf	$f3, $f3, $f4
	mulf	$f2, $f2, $f0
	lw	$v1, 9($v0)
	lwc1	$f4, 1($v1)
	mulf	$f2, $f2, $f4
	addf	$f2, $f3, $f2
	mulf	$f0, $f0, $f1
	lw	$v0, 9($v0)
	lwc1	$f1, 2($v0)
	mulf	$f0, $f0, $f1
	addf	$f0, $f2, $f0
	jr	$ra
bilinear@4102:
	mulf	$f6, $f0, $f3
	lw	$v1, 4($v0)
	lwc1	$f7, 0($v1)
	mulf	$f6, $f6, $f7
	mulf	$f7, $f1, $f4
	lw	$v1, 4($v0)
	lwc1	$f8, 1($v1)
	mulf	$f7, $f7, $f8
	addf	$f6, $f6, $f7
	mulf	$f7, $f2, $f5
	lw	$v1, 4($v0)
	lwc1	$f8, 2($v1)
	mulf	$f7, $f7, $f8
	addf	$f6, $f6, $f7
	lw	$v1, 3($v0)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10094
	mvf	$f0, $f6
	jr	$ra
else@10094:
	mulf	$f7, $f2, $f4
	mulf	$f8, $f1, $f5
	addf	$f7, $f7, $f8
	lw	$v1, 9($v0)
	lwc1	$f8, 0($v1)
	mulf	$f7, $f7, $f8
	mulf	$f5, $f0, $f5
	mulf	$f2, $f2, $f3
	addf	$f2, $f5, $f2
	lw	$v1, 9($v0)
	lwc1	$f5, 1($v1)
	mulf	$f2, $f2, $f5
	addf	$f2, $f7, $f2
	mulf	$f0, $f0, $f4
	mulf	$f1, $f1, $f3
	addf	$f0, $f0, $f1
	lw	$v0, 9($v0)
	lwc1	$f1, 2($v0)
	mulf	$f0, $f0, $f1
	addf	$f0, $f2, $f0
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	addf	$f0, $f6, $f0
	jr	$ra
solver_second@4141:
	lwc1	$f3, 0($v1)
	lwc1	$f4, 1($v1)
	lwc1	$f5, 2($v1)
	swc1	$f2, 0($sp)
	swc1	$f1, 2($sp)
	swc1	$f0, 4($sp)
	sw	$v0, 6($sp)
	sw	$v1, 7($sp)
	mvf	$f2, $f5
	mvf	$f1, $f4
	mvf	$f0, $f3
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	quadratic@4073
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10095
	ori	$v0, $zero, 1
	j	cont@10096
else@10095:
	ori	$v0, $zero, 0
cont@10096:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10097
	lw	$v0, 7($sp)
	lwc1	$f1, 0($v0)
	lwc1	$f2, 1($v0)
	lwc1	$f3, 2($v0)
	lwc1	$f4, 4($sp)
	lwc1	$f5, 2($sp)
	lwc1	$f6, 0($sp)
	lw	$v0, 6($sp)
	swc1	$f0, 8($sp)
	mvf	$f0, $f1
	mvf	$f1, $f2
	mvf	$f2, $f3
	mvf	$f3, $f4
	mvf	$f4, $f5
	mvf	$f5, $f6
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	bilinear@4102
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lwc1	$f1, 4($sp)
	lwc1	$f2, 2($sp)
	lwc1	$f3, 0($sp)
	lw	$v0, 6($sp)
	swc1	$f0, 10($sp)
	mvf	$f0, $f1
	mvf	$f1, $f2
	mvf	$f2, $f3
	sw	$ra, 12($sp)
	addi	$sp, $sp, 13
	jal	quadratic@4073
	addi	$sp, $sp, -13
	lw	$ra, 12($sp)
	lw	$v0, 6($sp)
	lw	$v1, 1($v0)
	addi	$at, $zero, 3
	bne	$v1, $at, else@10098
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	cont@10099
else@10098:
cont@10099:
	lwc1	$f1, 10($sp)
	mulf	$f2, $f1, $f1
	lwc1	$f3, 8($sp)
	mulf	$f0, $f3, $f0
	subf	$f0, $f2, $f0
	ori	$at, $zero, 0
	mfc2	$f2, $at
	lef	$f0, $f2
	bc1f	else@10100
	ori	$v1, $zero, 0
	j	cont@10101
else@10100:
	ori	$v1, $zero, 1
cont@10101:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10102
	ori	$v0, $zero, 0
	jr	$ra
else@10102:
	sqrt	$f0, $f0
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10103
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	j	cont@10104
else@10103:
cont@10104:
	subf	$f0, $f0, $f1
	divf	$f0, $f0, $f3
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
else@10097:
	ori	$v0, $zero, 0
	jr	$ra
solver@4181:
	lui	$a1, 1
	ori	$a1, $a1, 65464
	sll	$v0, $v0, 0
	add	$at, $a1, $v0
	lw	$v0, 0($at)
	lwc1	$f0, 0($a0)
	lw	$a1, 5($v0)
	lwc1	$f1, 0($a1)
	subf	$f0, $f0, $f1
	lwc1	$f1, 1($a0)
	lw	$a1, 5($v0)
	lwc1	$f2, 1($a1)
	subf	$f1, $f1, $f2
	lwc1	$f2, 2($a0)
	lw	$a0, 5($v0)
	lwc1	$f3, 2($a0)
	subf	$f2, $f2, $f3
	lw	$a0, 1($v0)
	addi	$at, $zero, 1
	bne	$a0, $at, else@10105
	j	solver_rect@4037
else@10105:
	addi	$at, $zero, 2
	bne	$a0, $at, else@10106
	j	solver_surface@4058
else@10106:
	j	solver_second@4141
solver_rect_fast@4201:
	lwc1	$f3, 0($a0)
	subf	$f3, $f3, $f0
	lwc1	$f4, 1($a0)
	mulf	$f3, $f3, $f4
	lwc1	$f4, 1($v1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f1
	abs	$f4, $f4
	lw	$a1, 4($v0)
	lwc1	$f5, 1($a1)
	lef	$f5, $f4
	bc1f	else@10107
	ori	$a1, $zero, 0
	j	cont@10108
else@10107:
	ori	$a1, $zero, 1
cont@10108:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10109
	ori	$a1, $zero, 0
	j	cont@10110
else@10109:
	lwc1	$f4, 2($v1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f2
	abs	$f4, $f4
	lw	$a1, 4($v0)
	lwc1	$f5, 2($a1)
	lef	$f5, $f4
	bc1f	else@10111
	ori	$a1, $zero, 0
	j	cont@10112
else@10111:
	ori	$a1, $zero, 1
cont@10112:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10113
	ori	$a1, $zero, 0
	j	cont@10114
else@10113:
	lwc1	$f4, 1($a0)
	ori	$at, $zero, 0
	mfc2	$f5, $at
	eqf	$f4, $f5
	bc1f	else@10115
	ori	$a1, $zero, 1
	j	cont@10116
else@10115:
	ori	$a1, $zero, 0
cont@10116:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10117
	ori	$a1, $zero, 1
	j	cont@10118
else@10117:
	ori	$a1, $zero, 0
cont@10118:
cont@10114:
cont@10110:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10119
	lwc1	$f3, 2($a0)
	subf	$f3, $f3, $f1
	lwc1	$f4, 3($a0)
	mulf	$f3, $f3, $f4
	lwc1	$f4, 0($v1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f0
	abs	$f4, $f4
	lw	$a1, 4($v0)
	lwc1	$f5, 0($a1)
	lef	$f5, $f4
	bc1f	else@10120
	ori	$a1, $zero, 0
	j	cont@10121
else@10120:
	ori	$a1, $zero, 1
cont@10121:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10122
	ori	$a1, $zero, 0
	j	cont@10123
else@10122:
	lwc1	$f4, 2($v1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f2
	abs	$f4, $f4
	lw	$a1, 4($v0)
	lwc1	$f5, 2($a1)
	lef	$f5, $f4
	bc1f	else@10124
	ori	$a1, $zero, 0
	j	cont@10125
else@10124:
	ori	$a1, $zero, 1
cont@10125:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10126
	ori	$a1, $zero, 0
	j	cont@10127
else@10126:
	lwc1	$f4, 3($a0)
	ori	$at, $zero, 0
	mfc2	$f5, $at
	eqf	$f4, $f5
	bc1f	else@10128
	ori	$a1, $zero, 1
	j	cont@10129
else@10128:
	ori	$a1, $zero, 0
cont@10129:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10130
	ori	$a1, $zero, 1
	j	cont@10131
else@10130:
	ori	$a1, $zero, 0
cont@10131:
cont@10127:
cont@10123:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10132
	lwc1	$f3, 4($a0)
	subf	$f2, $f3, $f2
	lwc1	$f3, 5($a0)
	mulf	$f2, $f2, $f3
	lwc1	$f3, 0($v1)
	mulf	$f3, $f2, $f3
	addf	$f0, $f3, $f0
	abs	$f0, $f0
	lw	$a1, 4($v0)
	lwc1	$f3, 0($a1)
	lef	$f3, $f0
	bc1f	else@10133
	ori	$a1, $zero, 0
	j	cont@10134
else@10133:
	ori	$a1, $zero, 1
cont@10134:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10135
	ori	$v0, $zero, 0
	j	cont@10136
else@10135:
	lwc1	$f0, 1($v1)
	mulf	$f0, $f2, $f0
	addf	$f0, $f0, $f1
	abs	$f0, $f0
	lw	$v0, 4($v0)
	lwc1	$f1, 1($v0)
	lef	$f1, $f0
	bc1f	else@10137
	ori	$v0, $zero, 0
	j	cont@10138
else@10137:
	ori	$v0, $zero, 1
cont@10138:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10139
	ori	$v0, $zero, 0
	j	cont@10140
else@10139:
	lwc1	$f0, 5($a0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10141
	ori	$v0, $zero, 1
	j	cont@10142
else@10141:
	ori	$v0, $zero, 0
cont@10142:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10143
	ori	$v0, $zero, 1
	j	cont@10144
else@10143:
	ori	$v0, $zero, 0
cont@10144:
cont@10140:
cont@10136:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10145
	ori	$v0, $zero, 0
	jr	$ra
else@10145:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f2, 0($v0)
	ori	$v0, $zero, 3
	jr	$ra
else@10132:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f3, 0($v0)
	ori	$v0, $zero, 2
	jr	$ra
else@10119:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f3, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
solver_surface_fast@4298:
	lwc1	$f3, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	lef	$f4, $f3
	bc1f	else@10146
	ori	$v0, $zero, 0
	j	cont@10147
else@10146:
	ori	$v0, $zero, 1
cont@10147:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10148
	ori	$v0, $zero, 0
	jr	$ra
else@10148:
	lwc1	$f3, 1($v1)
	mulf	$f0, $f3, $f0
	lwc1	$f3, 2($v1)
	mulf	$f1, $f3, $f1
	addf	$f0, $f0, $f1
	lwc1	$f1, 3($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
solver_second_fast@4321:
	lwc1	$f3, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	eqf	$f3, $f4
	bc1f	else@10149
	ori	$a0, $zero, 1
	j	cont@10150
else@10149:
	ori	$a0, $zero, 0
cont@10150:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10151
	lwc1	$f4, 1($v1)
	mulf	$f4, $f4, $f0
	lwc1	$f5, 2($v1)
	mulf	$f5, $f5, $f1
	addf	$f4, $f4, $f5
	lwc1	$f5, 3($v1)
	mulf	$f5, $f5, $f2
	addf	$f4, $f4, $f5
	sw	$v1, 0($sp)
	swc1	$f3, 2($sp)
	swc1	$f4, 4($sp)
	sw	$v0, 6($sp)
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	quadratic@4073
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 6($sp)
	lw	$v1, 1($v0)
	addi	$at, $zero, 3
	bne	$v1, $at, else@10153
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	cont@10154
else@10153:
cont@10154:
	lwc1	$f1, 4($sp)
	mulf	$f2, $f1, $f1
	lwc1	$f3, 2($sp)
	mulf	$f0, $f3, $f0
	subf	$f0, $f2, $f0
	ori	$at, $zero, 0
	mfc2	$f2, $at
	lef	$f0, $f2
	bc1f	else@10155
	ori	$v1, $zero, 0
	j	cont@10156
else@10155:
	ori	$v1, $zero, 1
cont@10156:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10157
	ori	$v0, $zero, 0
	jr	$ra
else@10157:
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10158
	sqrt	$f0, $f0
	subf	$f0, $f1, $f0
	lw	$v0, 0($sp)
	lwc1	$f1, 4($v0)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	j	cont@10159
else@10158:
	sqrt	$f0, $f0
	addf	$f0, $f1, $f0
	lw	$v0, 0($sp)
	lwc1	$f1, 4($v0)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
cont@10159:
	ori	$v0, $zero, 1
	jr	$ra
else@10151:
	ori	$v0, $zero, 0
	jr	$ra
solver_fast@4367:
	lui	$a1, 1
	ori	$a1, $a1, 65464
	sll	$a2, $v0, 0
	add	$at, $a1, $a2
	lw	$a1, 0($at)
	lwc1	$f0, 0($a0)
	lw	$a2, 5($a1)
	lwc1	$f1, 0($a2)
	subf	$f0, $f0, $f1
	lwc1	$f1, 1($a0)
	lw	$a2, 5($a1)
	lwc1	$f2, 1($a2)
	subf	$f1, $f1, $f2
	lwc1	$f2, 2($a0)
	lw	$a0, 5($a1)
	lwc1	$f3, 2($a0)
	subf	$f2, $f2, $f3
	lw	$a0, 1($v1)
	sll	$v0, $v0, 0
	add	$at, $a0, $v0
	lw	$a0, 0($at)
	lw	$v0, 1($a1)
	addi	$at, $zero, 1
	bne	$v0, $at, else@10160
	lw	$v1, 0($v1)
	add	$v0, $a1, $zero
	j	solver_rect_fast@4201
else@10160:
	addi	$at, $zero, 2
	bne	$v0, $at, else@10161
	add	$v1, $a0, $zero
	add	$v0, $a1, $zero
	j	solver_surface_fast@4298
else@10161:
	add	$v1, $a0, $zero
	add	$v0, $a1, $zero
	j	solver_second_fast@4321
solver_surface_fast2@4390:
	lwc1	$f0, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10162
	ori	$v0, $zero, 0
	j	cont@10163
else@10162:
	ori	$v0, $zero, 1
cont@10163:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10164
	ori	$v0, $zero, 0
	jr	$ra
else@10164:
	lwc1	$f0, 0($v1)
	lwc1	$f1, 3($a0)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	ori	$v0, $zero, 1
	jr	$ra
solver_second_fast2@4408:
	lwc1	$f3, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f4, $at
	eqf	$f3, $f4
	bc1f	else@10165
	ori	$a1, $zero, 1
	j	cont@10166
else@10165:
	ori	$a1, $zero, 0
cont@10166:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10167
	lwc1	$f4, 1($v1)
	mulf	$f0, $f4, $f0
	lwc1	$f4, 2($v1)
	mulf	$f1, $f4, $f1
	addf	$f0, $f0, $f1
	lwc1	$f1, 3($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	lwc1	$f1, 3($a0)
	mulf	$f2, $f0, $f0
	mulf	$f1, $f3, $f1
	subf	$f1, $f2, $f1
	ori	$at, $zero, 0
	mfc2	$f2, $at
	lef	$f1, $f2
	bc1f	else@10168
	ori	$a0, $zero, 0
	j	cont@10169
else@10168:
	ori	$a0, $zero, 1
cont@10169:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10170
	ori	$v0, $zero, 0
	jr	$ra
else@10170:
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10171
	sqrt	$f1, $f1
	subf	$f0, $f0, $f1
	lwc1	$f1, 4($v1)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
	j	cont@10172
else@10171:
	sqrt	$f1, $f1
	addf	$f0, $f0, $f1
	lwc1	$f1, 4($v1)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65400
	swc1	$f0, 0($v0)
cont@10172:
	ori	$v0, $zero, 1
	jr	$ra
else@10167:
	ori	$v0, $zero, 0
	jr	$ra
solver_fast2@4452:
	lui	$a0, 1
	ori	$a0, $a0, 65464
	sll	$a1, $v0, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	lw	$a1, 10($a0)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 1($a1)
	lwc1	$f2, 2($a1)
	lw	$a2, 1($v1)
	sll	$v0, $v0, 0
	add	$at, $a2, $v0
	lw	$v0, 0($at)
	lw	$a2, 1($a0)
	addi	$at, $zero, 1
	bne	$a2, $at, else@10173
	lw	$v1, 0($v1)
	add	$at, $a0, $zero
	add	$a0, $v0, $zero
	add	$v0, $at, $zero
	j	solver_rect_fast@4201
else@10173:
	addi	$at, $zero, 2
	bne	$a2, $at, else@10174
	add	$v1, $v0, $zero
	add	$v0, $a0, $zero
	add	$a0, $a1, $zero
	j	solver_surface_fast2@4390
else@10174:
	add	$v1, $v0, $zero
	add	$v0, $a0, $zero
	add	$a0, $a1, $zero
	j	solver_second_fast2@4408
setup_rect_table@4469:
	ori	$a0, $zero, 6
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	lwc1	$f0, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10175
	ori	$a0, $zero, 1
	j	cont@10176
else@10175:
	ori	$a0, $zero, 0
cont@10176:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10177
	lw	$a0, 0($sp)
	lw	$a1, 6($a0)
	lwc1	$f0, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10179
	ori	$a2, $zero, 0
	j	cont@10180
else@10179:
	ori	$a2, $zero, 1
cont@10180:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10181
	add	$a1, $zero, $a2
	j	cont@10182
else@10181:
	addi	$at, $zero, 0
	bne	$a2, $at, else@10183
	ori	$a1, $zero, 1
	j	cont@10184
else@10183:
	ori	$a1, $zero, 0
cont@10184:
cont@10182:
	lw	$a2, 4($a0)
	lwc1	$f0, 0($a2)
	addi	$at, $zero, 0
	bne	$a1, $at, else@10185
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	j	cont@10186
else@10185:
cont@10186:
	swc1	$f0, 0($v0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lwc1	$f1, 0($v1)
	divf	$f0, $f0, $f1
	swc1	$f0, 1($v0)
	j	cont@10178
else@10177:
	ori	$at, $zero, 0
	mfc2	$f0, $at
	swc1	$f0, 1($v0)
cont@10178:
	lwc1	$f0, 1($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10187
	ori	$a0, $zero, 1
	j	cont@10188
else@10187:
	ori	$a0, $zero, 0
cont@10188:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10189
	lw	$a0, 0($sp)
	lw	$a1, 6($a0)
	lwc1	$f0, 1($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10191
	ori	$a2, $zero, 0
	j	cont@10192
else@10191:
	ori	$a2, $zero, 1
cont@10192:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10193
	add	$a1, $zero, $a2
	j	cont@10194
else@10193:
	addi	$at, $zero, 0
	bne	$a2, $at, else@10195
	ori	$a1, $zero, 1
	j	cont@10196
else@10195:
	ori	$a1, $zero, 0
cont@10196:
cont@10194:
	lw	$a2, 4($a0)
	lwc1	$f0, 1($a2)
	addi	$at, $zero, 0
	bne	$a1, $at, else@10197
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	j	cont@10198
else@10197:
cont@10198:
	swc1	$f0, 2($v0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lwc1	$f1, 1($v1)
	divf	$f0, $f0, $f1
	swc1	$f0, 3($v0)
	j	cont@10190
else@10189:
	ori	$at, $zero, 0
	mfc2	$f0, $at
	swc1	$f0, 3($v0)
cont@10190:
	lwc1	$f0, 2($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10199
	ori	$a0, $zero, 1
	j	cont@10200
else@10199:
	ori	$a0, $zero, 0
cont@10200:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10201
	lw	$a0, 0($sp)
	lw	$a1, 6($a0)
	lwc1	$f0, 2($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10203
	ori	$a2, $zero, 0
	j	cont@10204
else@10203:
	ori	$a2, $zero, 1
cont@10204:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10205
	add	$a1, $zero, $a2
	j	cont@10206
else@10205:
	addi	$at, $zero, 0
	bne	$a2, $at, else@10207
	ori	$a1, $zero, 1
	j	cont@10208
else@10207:
	ori	$a1, $zero, 0
cont@10208:
cont@10206:
	lw	$a0, 4($a0)
	lwc1	$f0, 2($a0)
	addi	$at, $zero, 0
	bne	$a1, $at, else@10209
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	j	cont@10210
else@10209:
cont@10210:
	swc1	$f0, 4($v0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lwc1	$f1, 2($v1)
	divf	$f0, $f0, $f1
	swc1	$f0, 5($v0)
	j	cont@10202
else@10201:
	ori	$at, $zero, 0
	mfc2	$f0, $at
	swc1	$f0, 5($v0)
cont@10202:
	jr	$ra
setup_surface_table@4538:
	ori	$a0, $zero, 4
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	lwc1	$f0, 0($v1)
	lw	$a0, 0($sp)
	lw	$a1, 4($a0)
	lwc1	$f1, 0($a1)
	mulf	$f0, $f0, $f1
	lwc1	$f1, 1($v1)
	lw	$a1, 4($a0)
	lwc1	$f2, 1($a1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	lwc1	$f1, 2($v1)
	lw	$v1, 4($a0)
	lwc1	$f2, 2($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10211
	ori	$v1, $zero, 0
	j	cont@10212
else@10211:
	ori	$v1, $zero, 1
cont@10212:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10213
	ori	$at, $zero, 0
	mfc2	$f0, $at
	swc1	$f0, 0($v0)
	j	cont@10214
else@10213:
	lui	$at, 49024
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f1, $f1, $f0
	swc1	$f1, 0($v0)
	lw	$v1, 4($a0)
	lwc1	$f1, 0($v1)
	divf	$f1, $f1, $f0
	mfc1	$at, $f1
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	swc1	$f1, 1($v0)
	lw	$v1, 4($a0)
	lwc1	$f1, 1($v1)
	divf	$f1, $f1, $f0
	mfc1	$at, $f1
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	swc1	$f1, 2($v0)
	lw	$v1, 4($a0)
	lwc1	$f1, 2($v1)
	divf	$f0, $f1, $f0
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	swc1	$f0, 3($v0)
cont@10214:
	jr	$ra
setup_second_table@4581:
	ori	$a0, $zero, 5
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	lwc1	$f0, 0($v1)
	lwc1	$f1, 1($v1)
	lwc1	$f2, 2($v1)
	lw	$a0, 0($sp)
	sw	$v0, 2($sp)
	add	$v0, $a0, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	quadratic@4073
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 1($sp)
	lwc1	$f1, 0($v0)
	lw	$v1, 0($sp)
	lw	$a0, 4($v1)
	lwc1	$f2, 0($a0)
	mulf	$f1, $f1, $f2
	mfc1	$at, $f1
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lwc1	$f2, 1($v0)
	lw	$a0, 4($v1)
	lwc1	$f3, 1($a0)
	mulf	$f2, $f2, $f3
	mfc1	$at, $f2
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f2, $at
	lwc1	$f3, 2($v0)
	lw	$a0, 4($v1)
	lwc1	$f4, 2($a0)
	mulf	$f3, $f3, $f4
	mfc1	$at, $f3
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	lw	$a0, 2($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 3($v1)
	addi	$at, $zero, 0
	bne	$a1, $at, else@10215
	swc1	$f1, 1($a0)
	swc1	$f2, 2($a0)
	swc1	$f3, 3($a0)
	j	cont@10216
else@10215:
	lwc1	$f4, 2($v0)
	lw	$a1, 9($v1)
	lwc1	$f5, 1($a1)
	mulf	$f4, $f4, $f5
	lwc1	$f5, 1($v0)
	lw	$a1, 9($v1)
	lwc1	$f6, 2($a1)
	mulf	$f5, $f5, $f6
	addf	$f4, $f4, $f5
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f5, $at
	mulf	$f4, $f4, $f5
	subf	$f1, $f1, $f4
	swc1	$f1, 1($a0)
	lwc1	$f1, 2($v0)
	lw	$a1, 9($v1)
	lwc1	$f4, 0($a1)
	mulf	$f1, $f1, $f4
	lwc1	$f4, 0($v0)
	lw	$a1, 9($v1)
	lwc1	$f5, 2($a1)
	mulf	$f4, $f4, $f5
	addf	$f1, $f1, $f4
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f4, $at
	mulf	$f1, $f1, $f4
	subf	$f1, $f2, $f1
	swc1	$f1, 2($a0)
	lwc1	$f1, 1($v0)
	lw	$a1, 9($v1)
	lwc1	$f2, 0($a1)
	mulf	$f1, $f1, $f2
	lwc1	$f2, 0($v0)
	lw	$v0, 9($v1)
	lwc1	$f4, 1($v0)
	mulf	$f2, $f2, $f4
	addf	$f1, $f1, $f2
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f2, $at
	mulf	$f1, $f1, $f2
	subf	$f1, $f3, $f1
	swc1	$f1, 3($a0)
cont@10216:
	ori	$at, $zero, 0
	mfc2	$f1, $at
	eqf	$f0, $f1
	bc1f	else@10217
	ori	$v0, $zero, 1
	j	cont@10218
else@10217:
	ori	$v0, $zero, 0
cont@10218:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10219
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f1, $f0
	swc1	$f0, 4($a0)
	j	cont@10220
else@10219:
cont@10220:
	add	$v0, $zero, $a0
	jr	$ra
iter_setup_dirvec_constants@4663:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10221
	lui	$a0, 1
	ori	$a0, $a0, 65464
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	lw	$a1, 1($v0)
	lw	$a2, 0($v0)
	lw	$a3, 1($a0)
	sw	$v0, 0($sp)
	addi	$at, $zero, 1
	bne	$a3, $at, else@10222
	sw	$a1, 1($sp)
	sw	$v1, 2($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	setup_rect_table@4469
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v1, 2($sp)
	sll	$a0, $v1, 0
	lw	$a1, 1($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	j	cont@10223
else@10222:
	addi	$at, $zero, 2
	bne	$a3, $at, else@10224
	sw	$a1, 1($sp)
	sw	$v1, 2($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	setup_surface_table@4538
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v1, 2($sp)
	sll	$a0, $v1, 0
	lw	$a1, 1($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	j	cont@10225
else@10224:
	sw	$a1, 1($sp)
	sw	$v1, 2($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	setup_second_table@4581
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v1, 2($sp)
	sll	$a0, $v1, 0
	lw	$a1, 1($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
cont@10225:
cont@10223:
	addi	$v1, $v1, -1
	lw	$v0, 0($sp)
	j	iter_setup_dirvec_constants@4663
else@10221:
	jr	$ra
setup_startp_constants@4685:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10227
	lui	$a0, 1
	ori	$a0, $a0, 65464
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	lw	$a1, 10($a0)
	lw	$a2, 1($a0)
	lwc1	$f0, 0($v0)
	lw	$a3, 5($a0)
	lwc1	$f1, 0($a3)
	subf	$f0, $f0, $f1
	swc1	$f0, 0($a1)
	lwc1	$f0, 1($v0)
	lw	$a3, 5($a0)
	lwc1	$f1, 1($a3)
	subf	$f0, $f0, $f1
	swc1	$f0, 1($a1)
	lwc1	$f0, 2($v0)
	lw	$a3, 5($a0)
	lwc1	$f1, 2($a3)
	subf	$f0, $f0, $f1
	swc1	$f0, 2($a1)
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	addi	$at, $zero, 2
	bne	$a2, $at, else@10228
	lw	$a0, 4($a0)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 1($a1)
	lwc1	$f2, 2($a1)
	sw	$a1, 2($sp)
	add	$v0, $a0, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	veciprod2@3046
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 2($sp)
	swc1	$f0, 3($v0)
	j	cont@10229
else@10228:
	addi	$at, $zero, 2
	slt	$at, $at, $a2
	bne	$at, $zero, else@10230
	j	cont@10231
else@10230:
	lwc1	$f0, 0($a1)
	lwc1	$f1, 1($a1)
	lwc1	$f2, 2($a1)
	sw	$a1, 2($sp)
	sw	$a2, 3($sp)
	add	$v0, $a0, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	quadratic@4073
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lw	$v0, 3($sp)
	addi	$at, $zero, 3
	bne	$v0, $at, else@10232
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	cont@10233
else@10232:
cont@10233:
	lw	$v0, 2($sp)
	swc1	$f0, 3($v0)
cont@10231:
cont@10229:
	lw	$v0, 1($sp)
	addi	$v1, $v0, -1
	lw	$v0, 0($sp)
	j	setup_startp_constants@4685
else@10227:
	jr	$ra
setup_startp@4735:
	lui	$v1, 1
	ori	$v1, $v1, 65371
	sw	$v0, 0($sp)
	add	$at, $v1, $zero
	add	$v1, $v0, $zero
	add	$v0, $at, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	veccpy@2926
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lw	$v0, 0($sp)
	j	setup_startp_constants@4685
is_rect_outside@4742:
	abs	$f0, $f0
	lw	$v1, 4($v0)
	lwc1	$f3, 0($v1)
	lef	$f3, $f0
	bc1f	else@10235
	ori	$v1, $zero, 0
	j	cont@10236
else@10235:
	ori	$v1, $zero, 1
cont@10236:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10237
	ori	$v1, $zero, 0
	j	cont@10238
else@10237:
	abs	$f0, $f1
	lw	$v1, 4($v0)
	lwc1	$f1, 1($v1)
	lef	$f1, $f0
	bc1f	else@10239
	ori	$v1, $zero, 0
	j	cont@10240
else@10239:
	ori	$v1, $zero, 1
cont@10240:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10241
	ori	$v1, $zero, 0
	j	cont@10242
else@10241:
	abs	$f0, $f2
	lw	$v1, 4($v0)
	lwc1	$f1, 2($v1)
	lef	$f1, $f0
	bc1f	else@10243
	ori	$v1, $zero, 0
	j	cont@10244
else@10243:
	ori	$v1, $zero, 1
cont@10244:
cont@10242:
cont@10238:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10245
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10246
	ori	$v0, $zero, 1
	jr	$ra
else@10246:
	ori	$v0, $zero, 0
	jr	$ra
else@10245:
	lw	$v0, 6($v0)
	jr	$ra
is_plane_outside@4761:
	lw	$v1, 4($v0)
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	veciprod2@3046
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v0, 0($sp)
	lw	$v0, 6($v0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10247
	ori	$v1, $zero, 0
	j	cont@10248
else@10247:
	ori	$v1, $zero, 1
cont@10248:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10249
	add	$v0, $zero, $v1
	j	cont@10250
else@10249:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10251
	ori	$v0, $zero, 1
	j	cont@10252
else@10251:
	ori	$v0, $zero, 0
cont@10252:
cont@10250:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10253
	ori	$v0, $zero, 1
	jr	$ra
else@10253:
	ori	$v0, $zero, 0
	jr	$ra
is_second_outside@4772:
	sw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	quadratic@4073
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v0, 0($sp)
	lw	$v1, 1($v0)
	addi	$at, $zero, 3
	bne	$v1, $at, else@10254
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	j	cont@10255
else@10254:
cont@10255:
	lw	$v0, 6($v0)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10256
	ori	$v1, $zero, 0
	j	cont@10257
else@10256:
	ori	$v1, $zero, 1
cont@10257:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10258
	add	$v0, $zero, $v1
	j	cont@10259
else@10258:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10260
	ori	$v0, $zero, 1
	j	cont@10261
else@10260:
	ori	$v0, $zero, 0
cont@10261:
cont@10259:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10262
	ori	$v0, $zero, 1
	jr	$ra
else@10262:
	ori	$v0, $zero, 0
	jr	$ra
is_outside@4786:
	lw	$v1, 5($v0)
	lwc1	$f3, 0($v1)
	subf	$f0, $f0, $f3
	lw	$v1, 5($v0)
	lwc1	$f3, 1($v1)
	subf	$f1, $f1, $f3
	lw	$v1, 5($v0)
	lwc1	$f3, 2($v1)
	subf	$f2, $f2, $f3
	lw	$v1, 1($v0)
	addi	$at, $zero, 1
	bne	$v1, $at, else@10263
	j	is_rect_outside@4742
else@10263:
	addi	$at, $zero, 2
	bne	$v1, $at, else@10264
	j	is_plane_outside@4761
else@10264:
	j	is_second_outside@4772
check_all_inside@4800:
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$a0, 0($at)
	addi	$at, $zero, -1
	bne	$a0, $at, else@10265
	ori	$v0, $zero, 1
	jr	$ra
else@10265:
	lui	$a1, 1
	ori	$a1, $a1, 65464
	sll	$a0, $a0, 0
	add	$at, $a1, $a0
	lw	$a0, 0($at)
	swc1	$f2, 0($sp)
	swc1	$f1, 2($sp)
	swc1	$f0, 4($sp)
	sw	$v1, 6($sp)
	sw	$v0, 7($sp)
	add	$v0, $a0, $zero
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	is_outside@4786
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10266
	lw	$v0, 7($sp)
	addi	$v0, $v0, 1
	lwc1	$f0, 4($sp)
	lwc1	$f1, 2($sp)
	lwc1	$f2, 0($sp)
	lw	$v1, 6($sp)
	j	check_all_inside@4800
else@10266:
	ori	$v0, $zero, 0
	jr	$ra
shadow_check_and_group@4814:
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$a0, 0($at)
	addi	$at, $zero, -1
	bne	$a0, $at, else@10267
	ori	$v0, $zero, 0
	jr	$ra
else@10267:
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$a0, 0($at)
	lui	$a1, 1
	ori	$a1, $a1, 65395
	lui	$a2, 1
	ori	$a2, $a2, 65287
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	sw	$a0, 2($sp)
	add	$v1, $a2, $zero
	add	$v0, $a0, $zero
	add	$a0, $a1, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solver_fast@4367
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65400
	lwc1	$f0, 0($v1)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10268
	ori	$v0, $zero, 0
	j	cont@10269
else@10268:
	lui	$at, 48716
	ori	$at, $at, 52429
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10270
	ori	$v0, $zero, 0
	j	cont@10271
else@10270:
	ori	$v0, $zero, 1
cont@10271:
cont@10269:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10272
	lui	$v0, 1
	ori	$v0, $v0, 65464
	lw	$v1, 2($sp)
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10273
	ori	$v0, $zero, 0
	jr	$ra
else@10273:
	lw	$v0, 1($sp)
	addi	$v0, $v0, 1
	lw	$v1, 0($sp)
	j	shadow_check_and_group@4814
else@10272:
	lui	$at, 15395
	ori	$at, $at, 55050
	mfc2	$f1, $at
	addf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65455
	lwc1	$f1, 0($v0)
	mulf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65395
	lwc1	$f2, 0($v0)
	addf	$f1, $f1, $f2
	lui	$v0, 1
	ori	$v0, $v0, 65455
	lwc1	$f2, 1($v0)
	mulf	$f2, $f2, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65395
	lwc1	$f3, 1($v0)
	addf	$f2, $f2, $f3
	lui	$v0, 1
	ori	$v0, $v0, 65455
	lwc1	$f3, 2($v0)
	mulf	$f0, $f3, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65395
	lwc1	$f3, 2($v0)
	addf	$f0, $f0, $f3
	ori	$v0, $zero, 0
	lw	$v1, 0($sp)
	mvf	$f30, $f2
	mvf	$f2, $f0
	mvf	$f0, $f1
	mvf	$f1, $f30
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	check_all_inside@4800
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10274
	lw	$v0, 1($sp)
	addi	$v0, $v0, 1
	lw	$v1, 0($sp)
	j	shadow_check_and_group@4814
else@10274:
	ori	$v0, $zero, 1
	jr	$ra
shadow_check_one_or_group@4858:
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$a0, 0($at)
	addi	$at, $zero, -1
	bne	$a0, $at, else@10275
	ori	$v0, $zero, 0
	jr	$ra
else@10275:
	lui	$a1, 1
	ori	$a1, $a1, 65403
	sll	$a0, $a0, 0
	add	$at, $a1, $a0
	lw	$a0, 0($at)
	ori	$a1, $zero, 0
	sw	$v1, 0($sp)
	sw	$v0, 1($sp)
	add	$v1, $a0, $zero
	add	$v0, $a1, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	shadow_check_and_group@4814
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10276
	lw	$v0, 1($sp)
	addi	$v0, $v0, 1
	lw	$v1, 0($sp)
	j	shadow_check_one_or_group@4858
else@10276:
	ori	$v0, $zero, 1
	jr	$ra
shadow_check_one_or_matrix@4870:
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$a0, 0($at)
	lw	$a1, 0($a0)
	addi	$at, $zero, -1
	bne	$a1, $at, else@10277
	ori	$v0, $zero, 0
	jr	$ra
else@10277:
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	addi	$at, $zero, 99
	bne	$a1, $at, else@10278
	ori	$v0, $zero, 1
	j	cont@10279
else@10278:
	lui	$a2, 1
	ori	$a2, $a2, 65395
	lui	$a3, 1
	ori	$a3, $a3, 65287
	add	$a0, $a2, $zero
	add	$v1, $a3, $zero
	add	$v0, $a1, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solver_fast@4367
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10280
	ori	$v0, $zero, 0
	j	cont@10281
else@10280:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	lwc1	$f0, 0($v0)
	lui	$at, 48588
	ori	$at, $at, 52429
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10282
	ori	$v0, $zero, 0
	j	cont@10283
else@10282:
	ori	$v0, $zero, 1
cont@10283:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10284
	ori	$v0, $zero, 0
	j	cont@10285
else@10284:
	ori	$v0, $zero, 1
	lw	$v1, 0($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	shadow_check_one_or_group@4858
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10286
	ori	$v0, $zero, 0
	j	cont@10287
else@10286:
	ori	$v0, $zero, 1
cont@10287:
cont@10285:
cont@10281:
cont@10279:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10288
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	j	shadow_check_one_or_matrix@4870
else@10288:
	ori	$v0, $zero, 1
	lw	$v1, 0($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	shadow_check_one_or_group@4858
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10289
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	j	shadow_check_one_or_matrix@4870
else@10289:
	ori	$v0, $zero, 1
	jr	$ra
solve_each_element@4898:
	sll	$a1, $v0, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	addi	$at, $zero, -1
	bne	$a1, $at, else@10290
	jr	$ra
else@10290:
	lui	$a2, 1
	ori	$a2, $a2, 65374
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	sw	$a1, 3($sp)
	add	$v1, $a0, $zero
	add	$v0, $a1, $zero
	add	$a0, $a2, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	solver@4181
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10292
	lui	$v0, 1
	ori	$v0, $v0, 65464
	lw	$v1, 3($sp)
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10293
	jr	$ra
else@10293:
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	solve_each_element@4898
else@10292:
	lui	$v1, 1
	ori	$v1, $v1, 65400
	lwc1	$f0, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10295
	ori	$v1, $zero, 0
	j	cont@10296
else@10295:
	ori	$v1, $zero, 1
cont@10296:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10297
	j	cont@10298
else@10297:
	lui	$v1, 1
	ori	$v1, $v1, 65398
	lwc1	$f1, 0($v1)
	lef	$f1, $f0
	bc1f	else@10299
	ori	$v1, $zero, 0
	j	cont@10300
else@10299:
	ori	$v1, $zero, 1
cont@10300:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10301
	j	cont@10302
else@10301:
	lui	$at, 15395
	ori	$at, $at, 55050
	mfc2	$f1, $at
	addf	$f0, $f0, $f1
	lw	$v1, 0($sp)
	lwc1	$f1, 0($v1)
	mulf	$f1, $f1, $f0
	lui	$a0, 1
	ori	$a0, $a0, 65374
	lwc1	$f2, 0($a0)
	addf	$f1, $f1, $f2
	lwc1	$f2, 1($v1)
	mulf	$f2, $f2, $f0
	lui	$a0, 1
	ori	$a0, $a0, 65374
	lwc1	$f3, 1($a0)
	addf	$f2, $f2, $f3
	lwc1	$f3, 2($v1)
	mulf	$f3, $f3, $f0
	lui	$a0, 1
	ori	$a0, $a0, 65374
	lwc1	$f4, 2($a0)
	addf	$f3, $f3, $f4
	ori	$a0, $zero, 0
	lw	$a1, 1($sp)
	sw	$v0, 4($sp)
	swc1	$f3, 6($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 10($sp)
	swc1	$f0, 12($sp)
	add	$v1, $a1, $zero
	add	$v0, $a0, $zero
	mvf	$f0, $f1
	mvf	$f1, $f2
	mvf	$f2, $f3
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	check_all_inside@4800
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10304
	j	cont@10305
else@10304:
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f0, 12($sp)
	swc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65395
	lwc1	$f0, 10($sp)
	lwc1	$f1, 8($sp)
	lwc1	$f2, 6($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	vecset@2905
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65394
	lw	$v1, 3($sp)
	sw	$v1, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65399
	lw	$v1, 4($sp)
	sw	$v1, 0($v0)
cont@10305:
cont@10302:
cont@10298:
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	solve_each_element@4898
solve_one_or_network@4953:
	sll	$a1, $v0, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	addi	$at, $zero, -1
	bne	$a1, $at, else@10306
	jr	$ra
else@10306:
	lui	$a2, 1
	ori	$a2, $a2, 65403
	sll	$a1, $a1, 0
	add	$at, $a2, $a1
	lw	$a1, 0($at)
	ori	$a2, $zero, 0
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solve_each_element@4898
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	solve_one_or_network@4953
trace_or_matrix@4965:
	sll	$a1, $v0, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	lw	$a2, 0($a1)
	addi	$at, $zero, -1
	bne	$a2, $at, else@10308
	jr	$ra
else@10308:
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	addi	$at, $zero, 99
	bne	$a2, $at, else@10310
	ori	$a2, $zero, 1
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solve_one_or_network@4953
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	j	cont@10311
else@10310:
	lui	$a3, 1
	ori	$a3, $a3, 65374
	sw	$a1, 3($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	add	$a0, $a3, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	solver@4181
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10312
	j	cont@10313
else@10312:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	lwc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f1, 0($v0)
	lef	$f1, $f0
	bc1f	else@10314
	ori	$v0, $zero, 0
	j	cont@10315
else@10314:
	ori	$v0, $zero, 1
cont@10315:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10316
	j	cont@10317
else@10316:
	ori	$v0, $zero, 1
	lw	$v1, 3($sp)
	lw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	solve_one_or_network@4953
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10317:
cont@10313:
cont@10311:
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	trace_or_matrix@4965
judge_intersection@4988:
	lui	$at, 20078
	ori	$at, $at, 27432
	mfc2	$f0, $at
	lui	$v1, 1
	ori	$v1, $v1, 65398
	swc1	$f0, 0($v1)
	ori	$v1, $zero, 0
	lui	$a0, 1
	ori	$a0, $a0, 65401
	lw	$a0, 0($a0)
	add	$at, $a0, $zero
	add	$a0, $v0, $zero
	add	$v0, $v1, $zero
	add	$v1, $at, $zero
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	trace_or_matrix@4965
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f0, 0($v0)
	lui	$at, 48588
	ori	$at, $at, 52429
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10318
	ori	$v0, $zero, 0
	j	cont@10319
else@10318:
	ori	$v0, $zero, 1
cont@10319:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10320
	ori	$v0, $zero, 0
	jr	$ra
else@10320:
	lui	$at, 19646
	ori	$at, $at, 48160
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10321
	ori	$v0, $zero, 0
	jr	$ra
else@10321:
	ori	$v0, $zero, 1
	jr	$ra
solve_each_element_fast@5003:
	lw	$a1, 0($a0)
	sll	$a2, $v0, 0
	add	$at, $v1, $a2
	lw	$a2, 0($at)
	addi	$at, $zero, -1
	bne	$a2, $at, else@10322
	jr	$ra
else@10322:
	sw	$a1, 0($sp)
	sw	$a0, 1($sp)
	sw	$v1, 2($sp)
	sw	$v0, 3($sp)
	sw	$a2, 4($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	solver_fast2@4452
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10324
	lui	$v0, 1
	ori	$v0, $v0, 65464
	lw	$v1, 4($sp)
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	lw	$v0, 6($v0)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10325
	jr	$ra
else@10325:
	lw	$v0, 3($sp)
	addi	$v0, $v0, 1
	lw	$v1, 2($sp)
	lw	$a0, 1($sp)
	j	solve_each_element_fast@5003
else@10324:
	lui	$v1, 1
	ori	$v1, $v1, 65400
	lwc1	$f0, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10327
	ori	$v1, $zero, 0
	j	cont@10328
else@10327:
	ori	$v1, $zero, 1
cont@10328:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10329
	j	cont@10330
else@10329:
	lui	$v1, 1
	ori	$v1, $v1, 65398
	lwc1	$f1, 0($v1)
	lef	$f1, $f0
	bc1f	else@10331
	ori	$v1, $zero, 0
	j	cont@10332
else@10331:
	ori	$v1, $zero, 1
cont@10332:
	addi	$at, $zero, 0
	bne	$v1, $at, else@10333
	j	cont@10334
else@10333:
	lui	$at, 15395
	ori	$at, $at, 55050
	mfc2	$f1, $at
	addf	$f0, $f0, $f1
	lw	$v1, 0($sp)
	lwc1	$f1, 0($v1)
	mulf	$f1, $f1, $f0
	lui	$a0, 1
	ori	$a0, $a0, 65371
	lwc1	$f2, 0($a0)
	addf	$f1, $f1, $f2
	lwc1	$f2, 1($v1)
	mulf	$f2, $f2, $f0
	lui	$a0, 1
	ori	$a0, $a0, 65371
	lwc1	$f3, 1($a0)
	addf	$f2, $f2, $f3
	lwc1	$f3, 2($v1)
	mulf	$f3, $f3, $f0
	lui	$v1, 1
	ori	$v1, $v1, 65371
	lwc1	$f4, 2($v1)
	addf	$f3, $f3, $f4
	ori	$v1, $zero, 0
	lw	$a0, 2($sp)
	sw	$v0, 5($sp)
	swc1	$f3, 6($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 10($sp)
	swc1	$f0, 12($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	mvf	$f0, $f1
	mvf	$f1, $f2
	mvf	$f2, $f3
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	check_all_inside@4800
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10335
	j	cont@10336
else@10335:
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f0, 12($sp)
	swc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65395
	lwc1	$f0, 10($sp)
	lwc1	$f1, 8($sp)
	lwc1	$f2, 6($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	vecset@2905
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65394
	lw	$v1, 4($sp)
	sw	$v1, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65399
	lw	$v1, 5($sp)
	sw	$v1, 0($v0)
cont@10336:
cont@10334:
cont@10330:
	lw	$v0, 3($sp)
	addi	$v0, $v0, 1
	lw	$v1, 2($sp)
	lw	$a0, 1($sp)
	j	solve_each_element_fast@5003
solve_one_or_network_fast@5060:
	sll	$a1, $v0, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	addi	$at, $zero, -1
	bne	$a1, $at, else@10337
	jr	$ra
else@10337:
	lui	$a2, 1
	ori	$a2, $a2, 65403
	sll	$a1, $a1, 0
	add	$at, $a2, $a1
	lw	$a1, 0($at)
	ori	$a2, $zero, 0
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solve_each_element_fast@5003
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	solve_one_or_network_fast@5060
trace_or_matrix_fast@5072:
	sll	$a1, $v0, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	lw	$a2, 0($a1)
	addi	$at, $zero, -1
	bne	$a2, $at, else@10339
	jr	$ra
else@10339:
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	addi	$at, $zero, 99
	bne	$a2, $at, else@10341
	ori	$a2, $zero, 1
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	solve_one_or_network_fast@5060
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	j	cont@10342
else@10341:
	sw	$a1, 3($sp)
	add	$v1, $a0, $zero
	add	$v0, $a2, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	solver_fast2@4452
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10343
	j	cont@10344
else@10343:
	lui	$v0, 1
	ori	$v0, $v0, 65400
	lwc1	$f0, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f1, 0($v0)
	lef	$f1, $f0
	bc1f	else@10345
	ori	$v0, $zero, 0
	j	cont@10346
else@10345:
	ori	$v0, $zero, 1
cont@10346:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10347
	j	cont@10348
else@10347:
	ori	$v0, $zero, 1
	lw	$v1, 3($sp)
	lw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	solve_one_or_network_fast@5060
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10348:
cont@10344:
cont@10342:
	lw	$v0, 2($sp)
	addi	$v0, $v0, 1
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	trace_or_matrix_fast@5072
judge_intersection_fast@5095:
	lui	$at, 20078
	ori	$at, $at, 27432
	mfc2	$f0, $at
	lui	$v1, 1
	ori	$v1, $v1, 65398
	swc1	$f0, 0($v1)
	ori	$v1, $zero, 0
	lui	$a0, 1
	ori	$a0, $a0, 65401
	lw	$a0, 0($a0)
	add	$at, $a0, $zero
	add	$a0, $v0, $zero
	add	$v0, $v1, $zero
	add	$v1, $at, $zero
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	trace_or_matrix_fast@5072
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65398
	lwc1	$f0, 0($v0)
	lui	$at, 48588
	ori	$at, $at, 52429
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10349
	ori	$v0, $zero, 0
	j	cont@10350
else@10349:
	ori	$v0, $zero, 1
cont@10350:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10351
	ori	$v0, $zero, 0
	jr	$ra
else@10351:
	lui	$at, 19646
	ori	$at, $at, 48160
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10352
	ori	$v0, $zero, 0
	jr	$ra
else@10352:
	ori	$v0, $zero, 1
	jr	$ra
get_nvector_rect@5110:
	lui	$v1, 1
	ori	$v1, $v1, 65399
	lw	$v1, 0($v1)
	ori	$at, $zero, 0
	mfc2	$f0, $at
	lui	$a0, 1
	ori	$a0, $a0, 65391
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	vecfill@2915
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v0, 1($sp)
	addi	$v1, $v0, -1
	addi	$v0, $v0, -1
	sll	$v0, $v0, 0
	lw	$a0, 0($sp)
	add	$at, $a0, $v0
	lwc1	$f0, 0($at)
	sw	$v1, 2($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	sgn@2889
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65391
	lw	$v1, 2($sp)
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	swc1	$f0, 0($at)
	jr	$ra
get_nvector_plane@5122:
	lw	$v1, 4($v0)
	lwc1	$f0, 0($v1)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f0, 0($v1)
	lw	$v1, 4($v0)
	lwc1	$f0, 1($v1)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f0, 1($v1)
	lw	$v0, 4($v0)
	lwc1	$f0, 2($v0)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65391
	swc1	$f0, 2($v0)
	jr	$ra
get_nvector_second@5135:
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lwc1	$f0, 0($v1)
	lw	$v1, 5($v0)
	lwc1	$f1, 0($v1)
	subf	$f0, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lwc1	$f1, 1($v1)
	lw	$v1, 5($v0)
	lwc1	$f2, 1($v1)
	subf	$f1, $f1, $f2
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lwc1	$f2, 2($v1)
	lw	$v1, 5($v0)
	lwc1	$f3, 2($v1)
	subf	$f2, $f2, $f3
	lw	$v1, 4($v0)
	lwc1	$f3, 0($v1)
	mulf	$f3, $f0, $f3
	lw	$v1, 4($v0)
	lwc1	$f4, 1($v1)
	mulf	$f4, $f1, $f4
	lw	$v1, 4($v0)
	lwc1	$f5, 2($v1)
	mulf	$f5, $f2, $f5
	lw	$v1, 3($v0)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10355
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f3, 0($v1)
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f4, 1($v1)
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f5, 2($v1)
	j	cont@10356
else@10355:
	lw	$v1, 9($v0)
	lwc1	$f6, 2($v1)
	mulf	$f6, $f1, $f6
	lw	$v1, 9($v0)
	lwc1	$f7, 1($v1)
	mulf	$f7, $f2, $f7
	addf	$f6, $f6, $f7
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f7, $at
	mulf	$f6, $f6, $f7
	addf	$f3, $f3, $f6
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f3, 0($v1)
	lw	$v1, 9($v0)
	lwc1	$f3, 2($v1)
	mulf	$f3, $f0, $f3
	lw	$v1, 9($v0)
	lwc1	$f6, 0($v1)
	mulf	$f2, $f2, $f6
	addf	$f2, $f3, $f2
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f3, $at
	mulf	$f2, $f2, $f3
	addf	$f2, $f4, $f2
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f2, 1($v1)
	lw	$v1, 9($v0)
	lwc1	$f2, 1($v1)
	mulf	$f0, $f0, $f2
	lw	$v1, 9($v0)
	lwc1	$f2, 0($v1)
	mulf	$f1, $f1, $f2
	addf	$f0, $f0, $f1
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	addf	$f0, $f5, $f0
	lui	$v1, 1
	ori	$v1, $v1, 65391
	swc1	$f0, 2($v1)
cont@10356:
	lw	$v1, 6($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65391
	j	vecunit_sgn@2992
utexture@5196:
	lw	$a0, 0($v0)
	lw	$a1, 8($v0)
	lwc1	$f0, 0($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65388
	swc1	$f0, 0($a1)
	lw	$a1, 8($v0)
	lwc1	$f0, 1($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65388
	swc1	$f0, 1($a1)
	lw	$a1, 8($v0)
	lwc1	$f0, 2($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65388
	swc1	$f0, 2($a1)
	addi	$at, $zero, 1
	bne	$a0, $at, else@10357
	lwc1	$f0, 0($v1)
	lw	$a0, 5($v0)
	lwc1	$f1, 0($a0)
	subf	$f0, $f0, $f1
	lui	$at, 15692
	ori	$at, $at, 52429
	mfc2	$f1, $at
	mulf	$f1, $f0, $f1
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f2, $at
	subf	$f1, $f1, $f2
	roundwfmt	$f30, $f1
	mfc1	$a0, $f30
	mfc2	$f1, $a0
	cvtsw	$f1, $f1
	lui	$at, 16800
	ori	$at, $at, 0
	mfc2	$f2, $at
	mulf	$f1, $f1, $f2
	subf	$f0, $f0, $f1
	lui	$at, 16672
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10358
	ori	$a0, $zero, 0
	j	cont@10359
else@10358:
	ori	$a0, $zero, 1
cont@10359:
	lwc1	$f0, 2($v1)
	lw	$v0, 5($v0)
	lwc1	$f1, 2($v0)
	subf	$f0, $f0, $f1
	lui	$at, 15692
	ori	$at, $at, 52429
	mfc2	$f1, $at
	mulf	$f1, $f0, $f1
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f2, $at
	subf	$f1, $f1, $f2
	roundwfmt	$f30, $f1
	mfc1	$v0, $f30
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	lui	$at, 16800
	ori	$at, $at, 0
	mfc2	$f2, $at
	mulf	$f1, $f1, $f2
	subf	$f0, $f0, $f1
	lui	$at, 16672
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10360
	ori	$v0, $zero, 0
	j	cont@10361
else@10360:
	ori	$v0, $zero, 1
cont@10361:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10362
	addi	$at, $zero, 0
	bne	$v0, $at, else@10364
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f0, $at
	j	cont@10365
else@10364:
	ori	$at, $zero, 0
	mfc2	$f0, $at
cont@10365:
	j	cont@10363
else@10362:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10366
	ori	$at, $zero, 0
	mfc2	$f0, $at
	j	cont@10367
else@10366:
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f0, $at
cont@10367:
cont@10363:
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f0, 1($v0)
	jr	$ra
else@10357:
	addi	$at, $zero, 2
	bne	$a0, $at, else@10369
	lwc1	$f0, 1($v1)
	lui	$at, 16000
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	sin@2659
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	mulf	$f0, $f0, $f0
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f1, 0($v0)
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f1, $at
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	mulf	$f0, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f0, 1($v0)
	jr	$ra
else@10369:
	addi	$at, $zero, 3
	bne	$a0, $at, else@10371
	lwc1	$f0, 0($v1)
	lw	$a0, 5($v0)
	lwc1	$f1, 0($a0)
	subf	$f0, $f0, $f1
	lwc1	$f1, 2($v1)
	lw	$v0, 5($v0)
	lwc1	$f2, 2($v0)
	subf	$f1, $f1, $f2
	mulf	$f0, $f0, $f0
	mulf	$f1, $f1, $f1
	addf	$f0, $f0, $f1
	sqrt	$f0, $f0
	lui	$at, 16672
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f1, $f0, $f1
	roundwfmt	$f30, $f1
	mfc1	$v0, $f30
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	subf	$f0, $f0, $f1
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	cos@2726
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	mulf	$f0, $f0, $f0
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f1, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f1, 1($v0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f0, $f1, $f0
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f0, 2($v0)
	jr	$ra
else@10371:
	addi	$at, $zero, 4
	bne	$a0, $at, else@10373
	lwc1	$f0, 0($v1)
	lw	$a0, 5($v0)
	lwc1	$f1, 0($a0)
	subf	$f0, $f0, $f1
	lw	$a0, 4($v0)
	lwc1	$f1, 0($a0)
	sqrt	$f1, $f1
	mulf	$f0, $f0, $f1
	lwc1	$f1, 2($v1)
	lw	$a0, 5($v0)
	lwc1	$f2, 2($a0)
	subf	$f1, $f1, $f2
	lw	$a0, 4($v0)
	lwc1	$f2, 2($a0)
	sqrt	$f2, $f2
	mulf	$f1, $f1, $f2
	mulf	$f2, $f0, $f0
	mulf	$f3, $f1, $f1
	addf	$f2, $f2, $f3
	abs	$f3, $f0
	lui	$at, 14545
	ori	$at, $at, 46871
	mfc2	$f4, $at
	lef	$f4, $f3
	bc1f	else@10374
	ori	$a0, $zero, 0
	j	cont@10375
else@10374:
	ori	$a0, $zero, 1
cont@10375:
	swc1	$f2, 0($sp)
	sw	$v0, 2($sp)
	sw	$v1, 3($sp)
	addi	$at, $zero, 0
	bne	$a0, $at, else@10376
	divf	$f0, $f1, $f0
	abs	$f0, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	atan@2791
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lui	$at, 16880
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	j	cont@10377
else@10376:
	lui	$at, 16752
	ori	$at, $at, 0
	mfc2	$f0, $at
cont@10377:
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f1, $f0, $f1
	roundwfmt	$f30, $f1
	mfc1	$v0, $f30
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	subf	$f0, $f0, $f1
	lw	$v0, 3($sp)
	lwc1	$f1, 1($v0)
	lw	$v0, 2($sp)
	lw	$v1, 5($v0)
	lwc1	$f2, 1($v1)
	subf	$f1, $f1, $f2
	lw	$v0, 4($v0)
	lwc1	$f2, 1($v0)
	sqrt	$f2, $f2
	mulf	$f1, $f1, $f2
	lwc1	$f2, 0($sp)
	abs	$f3, $f2
	lui	$at, 14545
	ori	$at, $at, 46871
	mfc2	$f4, $at
	lef	$f4, $f3
	bc1f	else@10378
	ori	$v0, $zero, 0
	j	cont@10379
else@10378:
	ori	$v0, $zero, 1
cont@10379:
	swc1	$f0, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10380
	divf	$f1, $f1, $f2
	abs	$f1, $f1
	mvf	$f0, $f1
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	atan@2791
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lui	$at, 16880
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lui	$at, 16457
	ori	$at, $at, 4059
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	j	cont@10381
else@10380:
	lui	$at, 16752
	ori	$at, $at, 0
	mfc2	$f0, $at
cont@10381:
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	subf	$f1, $f0, $f1
	roundwfmt	$f30, $f1
	mfc1	$v0, $f30
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	subf	$f0, $f0, $f1
	lui	$at, 15897
	ori	$at, $at, 39322
	mfc2	$f1, $at
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f2, $at
	lwc1	$f3, 4($sp)
	subf	$f2, $f2, $f3
	mulf	$f2, $f2, $f2
	subf	$f1, $f1, $f2
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f2, $at
	subf	$f0, $f2, $f0
	mulf	$f0, $f0, $f0
	subf	$f0, $f1, $f0
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10382
	ori	$v0, $zero, 0
	j	cont@10383
else@10382:
	ori	$v0, $zero, 1
cont@10383:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10384
	j	cont@10385
else@10384:
	ori	$at, $zero, 0
	mfc2	$f0, $at
cont@10385:
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f1, $at
	mulf	$f0, $f1, $f0
	lui	$at, 16025
	ori	$at, $at, 39322
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65388
	swc1	$f0, 2($v0)
	jr	$ra
else@10373:
	jr	$ra
add_light@5353:
	ori	$at, $zero, 0
	mfc2	$f3, $at
	lef	$f0, $f3
	bc1f	else@10388
	ori	$v0, $zero, 0
	j	cont@10389
else@10388:
	ori	$v0, $zero, 1
cont@10389:
	swc1	$f2, 0($sp)
	swc1	$f1, 2($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10390
	j	cont@10391
else@10390:
	lui	$v1, 1
	ori	$v1, $v1, 65388
	lui	$v0, 1
	ori	$v0, $v0, 65382
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	vecaccum@3061
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10391:
	ori	$at, $zero, 0
	mfc2	$f0, $at
	lwc1	$f1, 2($sp)
	lef	$f1, $f0
	bc1f	else@10392
	ori	$v0, $zero, 0
	j	cont@10393
else@10392:
	ori	$v0, $zero, 1
cont@10393:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10394
	jr	$ra
else@10394:
	mulf	$f0, $f1, $f1
	mulf	$f0, $f0, $f0
	lwc1	$f1, 0($sp)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 0($v0)
	addf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f1, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 1($v0)
	addf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f1, 1($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 2($v0)
	addf	$f0, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f0, 2($v0)
	jr	$ra
trace_reflections@5379:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10397
	lui	$a0, 1
	ori	$a0, $a0, 65102
	sll	$a1, $v0, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	lw	$a1, 1($a0)
	sw	$v0, 0($sp)
	swc1	$f1, 2($sp)
	sw	$v1, 4($sp)
	swc1	$f0, 6($sp)
	sw	$a1, 8($sp)
	sw	$a0, 9($sp)
	add	$v0, $a1, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	judge_intersection_fast@5095
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10400
	j	cont@10401
else@10400:
	lui	$v0, 1
	ori	$v0, $v0, 65394
	lw	$v0, 0($v0)
	addi	$v0, $v0, -4
	lui	$v1, 1
	ori	$v1, $v1, 65399
	lw	$v1, 0($v1)
	add	$v0, $v0, $v1
	lw	$v1, 9($sp)
	lw	$a0, 0($v1)
	bne	$v0, $a0, else@10402
	ori	$v0, $zero, 0
	lui	$a0, 1
	ori	$a0, $a0, 65401
	lw	$a0, 0($a0)
	add	$v1, $a0, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	shadow_check_one_or_matrix@4870
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10404
	lw	$v0, 8($sp)
	lw	$v1, 0($v0)
	lui	$a0, 1
	ori	$a0, $a0, 65391
	add	$v0, $a0, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	veciprod@3027
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v0, 9($sp)
	lwc1	$f1, 2($v0)
	lwc1	$f2, 6($sp)
	mulf	$f3, $f1, $f2
	mulf	$f0, $f3, $f0
	lw	$v0, 8($sp)
	lw	$v1, 0($v0)
	lw	$v0, 4($sp)
	swc1	$f0, 10($sp)
	swc1	$f1, 12($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	veciprod@3027
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lwc1	$f1, 12($sp)
	mulf	$f1, $f1, $f0
	lwc1	$f0, 10($sp)
	lwc1	$f2, 2($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	add_light@5353
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	j	cont@10405
else@10404:
cont@10405:
	j	cont@10403
else@10402:
cont@10403:
cont@10401:
	lw	$v0, 0($sp)
	addi	$v0, $v0, -1
	lwc1	$f0, 6($sp)
	lwc1	$f1, 2($sp)
	lw	$v1, 4($sp)
	j	trace_reflections@5379
else@10397:
	jr	$ra
trace_ray@5413:
	addi	$at, $zero, 4
	slt	$at, $at, $v0
	bne	$at, $zero, else@10407
	lw	$a1, 2($a0)
	swc1	$f1, 0($sp)
	sw	$a0, 2($sp)
	swc1	$f0, 4($sp)
	sw	$v1, 6($sp)
	sw	$a1, 7($sp)
	sw	$v0, 8($sp)
	add	$v0, $v1, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	judge_intersection@4988
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10409
	lui	$v0, 65535
	ori	$v0, $v0, 65535
	lw	$v1, 8($sp)
	sll	$a0, $v1, 0
	lw	$a1, 7($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	addi	$at, $zero, 0
	bne	$v1, $at, else@10410
	jr	$ra
else@10410:
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lw	$v0, 6($sp)
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	veciprod@3027
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10412
	ori	$v0, $zero, 0
	j	cont@10413
else@10412:
	ori	$v0, $zero, 1
cont@10413:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10414
	jr	$ra
else@10414:
	mulf	$f1, $f0, $f0
	mulf	$f0, $f1, $f0
	lwc1	$f1, 4($sp)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65454
	lwc1	$f1, 0($v0)
	mulf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 0($v0)
	addf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f1, 0($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 1($v0)
	addf	$f1, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f1, 1($v0)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f1, 2($v0)
	addf	$f0, $f1, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65382
	swc1	$f0, 2($v0)
	jr	$ra
else@10409:
	lui	$v0, 1
	ori	$v0, $v0, 65394
	lw	$v0, 0($v0)
	lui	$v1, 1
	ori	$v1, $v1, 65464
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$v1, 0($at)
	lw	$a0, 2($v1)
	lw	$a1, 7($v1)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 4($sp)
	mulf	$f0, $f0, $f1
	lw	$a1, 1($v1)
	sw	$a0, 9($sp)
	swc1	$f0, 10($sp)
	sw	$v0, 12($sp)
	sw	$v1, 13($sp)
	addi	$at, $zero, 1
	bne	$a1, $at, else@10417
	lw	$a1, 6($sp)
	add	$v0, $a1, $zero
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	get_nvector_rect@5110
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	j	cont@10418
else@10417:
	addi	$at, $zero, 2
	bne	$a1, $at, else@10419
	add	$v0, $v1, $zero
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	get_nvector_plane@5122
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	j	cont@10420
else@10419:
	add	$v0, $v1, $zero
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	get_nvector_second@5135
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
cont@10420:
cont@10418:
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lui	$v0, 1
	ori	$v0, $v0, 65374
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	veccpy@2926
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lw	$v0, 13($sp)
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	utexture@5196
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lw	$v0, 12($sp)
	addi	$v0, $v0, -4
	lui	$v1, 1
	ori	$v1, $v1, 65399
	lw	$v1, 0($v1)
	add	$v0, $v0, $v1
	lw	$v1, 8($sp)
	sll	$a0, $v1, 0
	lw	$a1, 7($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	lw	$v0, 2($sp)
	lw	$a0, 1($v0)
	sll	$a2, $v1, 0
	add	$at, $a0, $a2
	lw	$a0, 0($at)
	lui	$a2, 1
	ori	$a2, $a2, 65395
	add	$v1, $a2, $zero
	add	$v0, $a0, $zero
	sw	$ra, 14($sp)
	addi	$sp, $sp, 15
	jal	veccpy@2926
	addi	$sp, $sp, -15
	lw	$ra, 14($sp)
	lw	$v0, 2($sp)
	lw	$v1, 3($v0)
	lw	$a0, 13($sp)
	lw	$a1, 7($a0)
	lwc1	$f0, 0($a1)
	lui	$at, 16128
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10421
	ori	$a1, $zero, 0
	j	cont@10422
else@10421:
	ori	$a1, $zero, 1
cont@10422:
	addi	$at, $zero, 0
	bne	$a1, $at, else@10423
	ori	$a1, $zero, 1
	lw	$a2, 8($sp)
	sll	$a3, $a2, 0
	add	$at, $v1, $a3
	sw	$a1, 0($at)
	lw	$v1, 4($v0)
	sll	$a1, $a2, 0
	add	$at, $v1, $a1
	lw	$a1, 0($at)
	lui	$a3, 1
	ori	$a3, $a3, 65388
	sw	$v1, 14($sp)
	add	$v1, $a3, $zero
	add	$v0, $a1, $zero
	sw	$ra, 15($sp)
	addi	$sp, $sp, 16
	jal	veccpy@2926
	addi	$sp, $sp, -16
	lw	$ra, 15($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 0
	lw	$a0, 14($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lui	$at, 17280
	ori	$at, $at, 0
	mfc2	$f0, $at
	lui	$at, 15232
	ori	$at, $at, 0
	mfc2	$f0, $at
	lwc1	$f1, 10($sp)
	mulf	$f0, $f0, $f1
	add	$v0, $v1, $zero
	sw	$ra, 15($sp)
	addi	$sp, $sp, 16
	jal	vecscale@3134
	addi	$sp, $sp, -16
	lw	$ra, 15($sp)
	lw	$v0, 2($sp)
	lw	$v1, 7($v0)
	lw	$a0, 8($sp)
	sll	$a1, $a0, 0
	add	$at, $v1, $a1
	lw	$v1, 0($at)
	lui	$a1, 1
	ori	$a1, $a1, 65391
	add	$v0, $v1, $zero
	add	$v1, $a1, $zero
	sw	$ra, 15($sp)
	addi	$sp, $sp, 16
	jal	veccpy@2926
	addi	$sp, $sp, -16
	lw	$ra, 15($sp)
	j	cont@10424
else@10423:
	ori	$a1, $zero, 0
	lw	$a2, 8($sp)
	sll	$a3, $a2, 0
	add	$at, $v1, $a3
	sw	$a1, 0($at)
cont@10424:
	lui	$at, 49152
	ori	$at, $at, 0
	mfc2	$f0, $at
	lui	$v1, 1
	ori	$v1, $v1, 65391
	lw	$v0, 6($sp)
	swc1	$f0, 16($sp)
	sw	$ra, 18($sp)
	addi	$sp, $sp, 19
	jal	veciprod@3027
	addi	$sp, $sp, -19
	lw	$ra, 18($sp)
	lwc1	$f1, 16($sp)
	mulf	$f0, $f1, $f0
	lui	$v1, 1
	ori	$v1, $v1, 65391
	lw	$v0, 6($sp)
	sw	$ra, 18($sp)
	addi	$sp, $sp, 19
	jal	vecaccum@3061
	addi	$sp, $sp, -19
	lw	$ra, 18($sp)
	lw	$v0, 13($sp)
	lw	$v1, 7($v0)
	lwc1	$f0, 1($v1)
	lwc1	$f1, 4($sp)
	mulf	$f0, $f1, $f0
	ori	$v1, $zero, 0
	lui	$a0, 1
	ori	$a0, $a0, 65401
	lw	$a0, 0($a0)
	swc1	$f0, 18($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 20($sp)
	addi	$sp, $sp, 21
	jal	shadow_check_one_or_matrix@4870
	addi	$sp, $sp, -21
	lw	$ra, 20($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10426
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lui	$v0, 1
	ori	$v0, $v0, 65391
	sw	$ra, 20($sp)
	addi	$sp, $sp, 21
	jal	veciprod@3027
	addi	$sp, $sp, -21
	lw	$ra, 20($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lwc1	$f1, 10($sp)
	mulf	$f0, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lw	$v0, 6($sp)
	swc1	$f0, 20($sp)
	sw	$ra, 22($sp)
	addi	$sp, $sp, 23
	jal	veciprod@3027
	addi	$sp, $sp, -23
	lw	$ra, 22($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lwc1	$f0, 20($sp)
	lwc1	$f2, 18($sp)
	sw	$ra, 22($sp)
	addi	$sp, $sp, 23
	jal	add_light@5353
	addi	$sp, $sp, -23
	lw	$ra, 22($sp)
	j	cont@10427
else@10426:
cont@10427:
	lui	$v0, 1
	ori	$v0, $v0, 65395
	sw	$ra, 22($sp)
	addi	$sp, $sp, 23
	jal	setup_startp@4735
	addi	$sp, $sp, -23
	lw	$ra, 22($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65101
	lw	$v0, 0($v0)
	addi	$v0, $v0, -1
	lwc1	$f0, 10($sp)
	lwc1	$f1, 18($sp)
	lw	$v1, 6($sp)
	sw	$ra, 22($sp)
	addi	$sp, $sp, 23
	jal	trace_reflections@5379
	addi	$sp, $sp, -23
	lw	$ra, 22($sp)
	lui	$at, 15820
	ori	$at, $at, 52429
	mfc2	$f0, $at
	lwc1	$f1, 4($sp)
	lef	$f1, $f0
	bc1f	else@10428
	ori	$v0, $zero, 0
	j	cont@10429
else@10428:
	ori	$v0, $zero, 1
cont@10429:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10430
	jr	$ra
else@10430:
	lw	$v0, 8($sp)
	slti	$at, $v0, 4
	bne	$at, $zero, else@10432
	j	cont@10433
else@10432:
	addi	$v1, $v0, 1
	lui	$a0, 65535
	ori	$a0, $a0, 65535
	sll	$v1, $v1, 0
	lw	$a1, 7($sp)
	add	$at, $a1, $v1
	sw	$a0, 0($at)
cont@10433:
	lw	$v1, 9($sp)
	addi	$at, $zero, 2
	bne	$v1, $at, else@10434
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lw	$v1, 13($sp)
	lw	$v1, 7($v1)
	lwc1	$f2, 0($v1)
	subf	$f0, $f0, $f2
	mulf	$f0, $f1, $f0
	addi	$v0, $v0, 1
	lui	$v1, 1
	ori	$v1, $v1, 65398
	lwc1	$f1, 0($v1)
	lwc1	$f2, 0($sp)
	addf	$f1, $f2, $f1
	lw	$v1, 6($sp)
	lw	$a0, 2($sp)
	sw	$ra, 22($sp)
	addi	$sp, $sp, 23
	jal	trace_ray@5413
	addi	$sp, $sp, -23
	lw	$ra, 22($sp)
	j	cont@10435
else@10434:
cont@10435:
	jr	$ra
else@10407:
	jr	$ra
trace_diffuse_ray@5533:
	swc1	$f0, 0($sp)
	sw	$v0, 2($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	judge_intersection_fast@5095
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10438
	jr	$ra
else@10438:
	lui	$v0, 1
	ori	$v0, $v0, 65394
	lw	$v0, 0($v0)
	lui	$v1, 1
	ori	$v1, $v1, 65464
	sll	$v0, $v0, 0
	add	$at, $v1, $v0
	lw	$v0, 0($at)
	lw	$v1, 2($sp)
	lw	$v1, 0($v1)
	lw	$a0, 1($v0)
	sw	$v0, 3($sp)
	addi	$at, $zero, 1
	bne	$a0, $at, else@10440
	add	$v0, $v1, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	get_nvector_rect@5110
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	j	cont@10441
else@10440:
	addi	$at, $zero, 2
	bne	$a0, $at, else@10442
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	get_nvector_plane@5122
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	j	cont@10443
else@10442:
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	get_nvector_second@5135
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10443:
cont@10441:
	lui	$v1, 1
	ori	$v1, $v1, 65395
	lw	$v0, 3($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	utexture@5196
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	ori	$v0, $zero, 0
	lui	$v1, 1
	ori	$v1, $v1, 65401
	lw	$v1, 0($v1)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	shadow_check_one_or_matrix@4870
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10444
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lui	$v0, 1
	ori	$v0, $v0, 65391
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	veciprod@3027
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f0, $f1
	bc1f	else@10445
	ori	$v0, $zero, 0
	j	cont@10446
else@10445:
	ori	$v0, $zero, 1
cont@10446:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10447
	ori	$at, $zero, 0
	mfc2	$f0, $at
	j	cont@10448
else@10447:
cont@10448:
	lwc1	$f1, 0($sp)
	mulf	$f0, $f1, $f0
	lw	$v0, 3($sp)
	lw	$v0, 7($v0)
	lwc1	$f1, 0($v0)
	mulf	$f0, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65388
	lui	$v0, 1
	ori	$v0, $v0, 65385
	j	vecaccum@3061
else@10444:
	jr	$ra
iter_trace_diffuse_rays@5557:
	slti	$at, $a1, 0
	bne	$at, $zero, else@10450
	sll	$a2, $a1, 0
	add	$at, $v0, $a2
	lw	$a2, 0($at)
	lw	$a2, 0($a2)
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	sw	$a1, 3($sp)
	add	$v0, $a2, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	veciprod@3027
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10451
	ori	$v0, $zero, 0
	j	cont@10452
else@10451:
	ori	$v0, $zero, 1
cont@10452:
	addi	$at, $zero, 0
	bne	$v0, $at, else@10453
	lw	$v0, 3($sp)
	sll	$v1, $v0, 0
	lw	$a0, 2($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$at, 17174
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	add	$v0, $v1, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	trace_diffuse_ray@5533
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	j	cont@10454
else@10453:
	lw	$v0, 3($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 0
	lw	$a0, 2($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$at, 49942
	ori	$at, $at, 0
	mfc2	$f1, $at
	divf	$f0, $f0, $f1
	add	$v0, $v1, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	trace_diffuse_ray@5533
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10454:
	lw	$v0, 3($sp)
	addi	$a1, $v0, -2
	lw	$v0, 2($sp)
	lw	$v1, 1($sp)
	lw	$a0, 0($sp)
	j	iter_trace_diffuse_rays@5557
else@10450:
	jr	$ra
trace_diffuse_ray_80percent@5585:
	sw	$v1, 0($sp)
	sw	$a0, 1($sp)
	sw	$v0, 2($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10456
	j	cont@10457
else@10456:
	lui	$a1, 1
	ori	$a1, $a1, 65352
	lw	$a1, 0($a1)
	sw	$a1, 3($sp)
	add	$v0, $a0, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	setup_startp@4735
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	ori	$a1, $zero, 118
	lw	$v0, 3($sp)
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	iter_trace_diffuse_rays@5557
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
cont@10457:
	lw	$v0, 2($sp)
	addi	$at, $zero, 1
	bne	$v0, $at, else@10458
	j	cont@10459
else@10458:
	lui	$v1, 1
	ori	$v1, $v1, 65352
	lw	$v1, 1($v1)
	lw	$a0, 1($sp)
	sw	$v1, 4($sp)
	add	$v0, $a0, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	setup_startp@4735
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	ori	$a1, $zero, 118
	lw	$v0, 4($sp)
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	iter_trace_diffuse_rays@5557
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
cont@10459:
	lw	$v0, 2($sp)
	addi	$at, $zero, 2
	bne	$v0, $at, else@10460
	j	cont@10461
else@10460:
	lui	$v1, 1
	ori	$v1, $v1, 65352
	lw	$v1, 2($v1)
	lw	$a0, 1($sp)
	sw	$v1, 5($sp)
	add	$v0, $a0, $zero
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	setup_startp@4735
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	ori	$a1, $zero, 118
	lw	$v0, 5($sp)
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	iter_trace_diffuse_rays@5557
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
cont@10461:
	lw	$v0, 2($sp)
	addi	$at, $zero, 3
	bne	$v0, $at, else@10462
	j	cont@10463
else@10462:
	lui	$v1, 1
	ori	$v1, $v1, 65352
	lw	$v1, 3($v1)
	lw	$a0, 1($sp)
	sw	$v1, 6($sp)
	add	$v0, $a0, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	setup_startp@4735
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	ori	$a1, $zero, 118
	lw	$v0, 6($sp)
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	iter_trace_diffuse_rays@5557
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
cont@10463:
	lw	$v0, 2($sp)
	addi	$at, $zero, 4
	bne	$v0, $at, else@10464
	jr	$ra
else@10464:
	lui	$v0, 1
	ori	$v0, $v0, 65352
	lw	$v0, 4($v0)
	lw	$v1, 1($sp)
	sw	$v0, 7($sp)
	add	$v0, $v1, $zero
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	setup_startp@4735
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	ori	$a1, $zero, 118
	lw	$v0, 7($sp)
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	j	iter_trace_diffuse_rays@5557
calc_diffuse_using_1point@5608:
	lw	$a0, 5($v0)
	lw	$a1, 7($v0)
	lw	$a2, 1($v0)
	lw	$a3, 4($v0)
	sll	$t0, $v1, 0
	add	$at, $a0, $t0
	lw	$a0, 0($at)
	lui	$t0, 1
	ori	$t0, $t0, 65385
	sw	$a3, 0($sp)
	sw	$a2, 1($sp)
	sw	$a1, 2($sp)
	sw	$v1, 3($sp)
	sw	$v0, 4($sp)
	add	$v1, $a0, $zero
	add	$v0, $t0, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	veccpy@2926
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	lw	$v0, 6($v0)
	lw	$v0, 0($v0)
	lw	$v1, 3($sp)
	sll	$a0, $v1, 0
	lw	$a1, 2($sp)
	add	$at, $a1, $a0
	lw	$a0, 0($at)
	sll	$a1, $v1, 0
	lw	$a2, 1($sp)
	add	$at, $a2, $a1
	lw	$a1, 0($at)
	add	$v1, $a0, $zero
	add	$a0, $a1, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	trace_diffuse_ray_80percent@5585
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 3($sp)
	sll	$v0, $v0, 0
	lw	$v1, 0($sp)
	add	$at, $v1, $v0
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	lui	$v0, 1
	ori	$v0, $v0, 65382
	j	vecaccumv@3151
calc_diffuse_using_5points@5622:
	sll	$a3, $v0, 0
	add	$at, $v1, $a3
	lw	$v1, 0($at)
	lw	$v1, 5($v1)
	addi	$a3, $v0, -1
	sll	$a3, $a3, 0
	add	$at, $a0, $a3
	lw	$a3, 0($at)
	lw	$a3, 5($a3)
	sll	$t0, $v0, 0
	add	$at, $a0, $t0
	lw	$t0, 0($at)
	lw	$t0, 5($t0)
	addi	$t1, $v0, 1
	sll	$t1, $t1, 0
	add	$at, $a0, $t1
	lw	$t1, 0($at)
	lw	$t1, 5($t1)
	sll	$t2, $v0, 0
	add	$at, $a1, $t2
	lw	$a1, 0($at)
	lw	$a1, 5($a1)
	sll	$t2, $a2, 0
	add	$at, $v1, $t2
	lw	$v1, 0($at)
	lui	$t2, 1
	ori	$t2, $t2, 65385
	sw	$a0, 0($sp)
	sw	$v0, 1($sp)
	sw	$a1, 2($sp)
	sw	$t1, 3($sp)
	sw	$t0, 4($sp)
	sw	$a3, 5($sp)
	sw	$a2, 6($sp)
	add	$v0, $t2, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	veccpy@2926
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 6($sp)
	sll	$v1, $v0, 0
	lw	$a0, 5($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	add	$v0, $a0, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	vecadd@3088
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 6($sp)
	sll	$v1, $v0, 0
	lw	$a0, 4($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	add	$v0, $a0, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	vecadd@3088
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 6($sp)
	sll	$v1, $v0, 0
	lw	$a0, 3($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	add	$v0, $a0, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	vecadd@3088
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 6($sp)
	sll	$v1, $v0, 0
	lw	$a0, 2($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	add	$v0, $a0, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	vecadd@3088
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	lw	$v0, 1($sp)
	sll	$v0, $v0, 0
	lw	$v1, 0($sp)
	add	$at, $v1, $v0
	lw	$v0, 0($at)
	lw	$v0, 4($v0)
	lw	$v1, 6($sp)
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	lw	$v1, 0($at)
	lui	$a0, 1
	ori	$a0, $a0, 65385
	lui	$v0, 1
	ori	$v0, $v0, 65382
	j	vecaccumv@3151
do_without_neighbors@5655:
	addi	$at, $zero, 4
	slt	$at, $at, $v1
	bne	$at, $zero, else@10466
	lw	$a0, 2($v0)
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	slti	$at, $a0, 0
	bne	$at, $zero, else@10467
	lw	$a0, 3($v0)
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	addi	$at, $zero, 0
	bne	$a0, $at, else@10468
	j	cont@10469
else@10468:
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	calc_diffuse_using_1point@5608
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
cont@10469:
	lw	$v0, 1($sp)
	addi	$v1, $v0, 1
	lw	$v0, 0($sp)
	j	do_without_neighbors@5655
else@10467:
	jr	$ra
else@10466:
	jr	$ra
neighbors_exist@5668:
	lui	$a0, 1
	ori	$a0, $a0, 65380
	lw	$a0, 1($a0)
	addi	$a1, $v1, 1
	slt	$at, $a1, $a0
	bne	$at, $zero, else@10472
	ori	$v0, $zero, 0
	jr	$ra
else@10472:
	addi	$at, $zero, 0
	slt	$at, $at, $v1
	bne	$at, $zero, else@10473
	ori	$v0, $zero, 0
	jr	$ra
else@10473:
	lui	$v1, 1
	ori	$v1, $v1, 65380
	lw	$v1, 0($v1)
	addi	$a0, $v0, 1
	slt	$at, $a0, $v1
	bne	$at, $zero, else@10474
	ori	$v0, $zero, 0
	jr	$ra
else@10474:
	addi	$at, $zero, 0
	slt	$at, $at, $v0
	bne	$at, $zero, else@10475
	ori	$v0, $zero, 0
	jr	$ra
else@10475:
	ori	$v0, $zero, 1
	jr	$ra
neighbors_are_available@5686:
	sll	$a3, $v0, 0
	add	$at, $a0, $a3
	lw	$a3, 0($at)
	lw	$a3, 2($a3)
	sll	$t0, $a2, 0
	add	$at, $a3, $t0
	lw	$a3, 0($at)
	sll	$t0, $v0, 0
	add	$at, $v1, $t0
	lw	$v1, 0($at)
	lw	$v1, 2($v1)
	sll	$t0, $a2, 0
	add	$at, $v1, $t0
	lw	$v1, 0($at)
	bne	$v1, $a3, else@10476
	sll	$v1, $v0, 0
	add	$at, $a1, $v1
	lw	$v1, 0($at)
	lw	$v1, 2($v1)
	sll	$a1, $a2, 0
	add	$at, $v1, $a1
	lw	$v1, 0($at)
	bne	$v1, $a3, else@10477
	addi	$v1, $v0, -1
	sll	$v1, $v1, 0
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 2($v1)
	sll	$a1, $a2, 0
	add	$at, $v1, $a1
	lw	$v1, 0($at)
	bne	$v1, $a3, else@10478
	addi	$v0, $v0, 1
	sll	$v0, $v0, 0
	add	$at, $a0, $v0
	lw	$v0, 0($at)
	lw	$v0, 2($v0)
	sll	$v1, $a2, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	bne	$v0, $a3, else@10479
	ori	$v0, $zero, 1
	jr	$ra
else@10479:
	ori	$v0, $zero, 0
	jr	$ra
else@10478:
	ori	$v0, $zero, 0
	jr	$ra
else@10477:
	ori	$v0, $zero, 0
	jr	$ra
else@10476:
	ori	$v0, $zero, 0
	jr	$ra
try_exploit_neighbors@5706:
	sll	$t0, $v0, 0
	add	$at, $a1, $t0
	lw	$t0, 0($at)
	addi	$at, $zero, 4
	slt	$at, $at, $a3
	bne	$at, $zero, else@10480
	lw	$t1, 2($t0)
	sll	$t2, $a3, 0
	add	$at, $t1, $t2
	lw	$t1, 0($at)
	slti	$at, $t1, 0
	bne	$at, $zero, else@10481
	sw	$v1, 0($sp)
	sw	$a2, 1($sp)
	sw	$a0, 2($sp)
	sw	$t0, 3($sp)
	sw	$a3, 4($sp)
	sw	$a1, 5($sp)
	sw	$v0, 6($sp)
	add	$v1, $a0, $zero
	add	$a0, $a1, $zero
	add	$a1, $a2, $zero
	add	$a2, $a3, $zero
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	neighbors_are_available@5686
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10482
	lw	$v0, 6($sp)
	sll	$v0, $v0, 0
	lw	$v1, 5($sp)
	add	$at, $v1, $v0
	lw	$v0, 0($at)
	lw	$v1, 4($sp)
	j	do_without_neighbors@5655
else@10482:
	lw	$v0, 3($sp)
	lw	$v0, 3($v0)
	lw	$a2, 4($sp)
	sll	$v1, $a2, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10483
	j	cont@10484
else@10483:
	lw	$v0, 6($sp)
	lw	$v1, 2($sp)
	lw	$a0, 5($sp)
	lw	$a1, 1($sp)
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	calc_diffuse_using_5points@5622
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
cont@10484:
	lw	$v0, 4($sp)
	addi	$a3, $v0, 1
	lw	$v0, 6($sp)
	lw	$v1, 0($sp)
	lw	$a0, 2($sp)
	lw	$a1, 5($sp)
	lw	$a2, 1($sp)
	j	try_exploit_neighbors@5706
else@10481:
	jr	$ra
else@10480:
	jr	$ra
write_ppm_header@5726:
	ori	$v0, $zero, 80
	print_char	$v0
	ori	$v0, $zero, 54
	print_char	$v0
	ori	$v0, $zero, 10
	print_char	$v0
	lui	$v0, 1
	ori	$v0, $v0, 65380
	lw	$v0, 0($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	print_int@2638
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 32
	print_char	$v0
	lui	$v0, 1
	ori	$v0, $v0, 65380
	lw	$v0, 1($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	print_int@2638
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 32
	print_char	$v0
	ori	$v0, $zero, 255
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	print_int@2638
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 10
	print_char	$v0
	jr	$ra
write_rgb_element@5749:
	roundwfmt	$f30, $f0
	mfc1	$v0, $f30
	addi	$at, $zero, 255
	slt	$at, $at, $v0
	bne	$at, $zero, else@10488
	slti	$at, $v0, 0
	bne	$at, $zero, else@10490
	j	cont@10491
else@10490:
	ori	$v0, $zero, 0
cont@10491:
	j	cont@10489
else@10488:
	ori	$v0, $zero, 255
cont@10489:
	print_char	$v0
	jr	$ra
write_rgb@5755:
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f0, 0($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	write_rgb_element@5749
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f0, 1($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	write_rgb_element@5749
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65382
	lwc1	$f0, 2($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	write_rgb_element@5749
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	jr	$ra
pretrace_diffuse_rays@5766:
	addi	$at, $zero, 4
	slt	$at, $at, $v1
	bne	$at, $zero, else@10494
	lw	$a0, 2($v0)
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	slti	$at, $a0, 0
	bne	$at, $zero, else@10495
	lw	$a0, 3($v0)
	sll	$a1, $v1, 0
	add	$at, $a0, $a1
	lw	$a0, 0($at)
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	addi	$at, $zero, 0
	bne	$a0, $at, else@10496
	j	cont@10497
else@10496:
	lw	$a0, 6($v0)
	lw	$a0, 0($a0)
	ori	$at, $zero, 0
	mfc2	$f0, $at
	lui	$a1, 1
	ori	$a1, $a1, 65385
	sw	$a0, 2($sp)
	add	$v0, $a1, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	vecfill@2915
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 0($sp)
	lw	$v1, 7($v0)
	lw	$a0, 1($v0)
	lui	$a1, 1
	ori	$a1, $a1, 65352
	lw	$a2, 2($sp)
	sll	$a2, $a2, 0
	add	$at, $a1, $a2
	lw	$a1, 0($at)
	lw	$a2, 1($sp)
	sll	$a3, $a2, 0
	add	$at, $v1, $a3
	lw	$v1, 0($at)
	sll	$a3, $a2, 0
	add	$at, $a0, $a3
	lw	$a0, 0($at)
	sw	$a0, 3($sp)
	sw	$v1, 4($sp)
	sw	$a1, 5($sp)
	add	$v0, $a0, $zero
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	setup_startp@4735
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	ori	$a1, $zero, 118
	lw	$v0, 5($sp)
	lw	$v1, 4($sp)
	lw	$a0, 3($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	iter_trace_diffuse_rays@5557
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lw	$v0, 0($sp)
	lw	$v1, 5($v0)
	lw	$a0, 1($sp)
	sll	$a1, $a0, 0
	add	$at, $v1, $a1
	lw	$v1, 0($at)
	lui	$a1, 1
	ori	$a1, $a1, 65385
	add	$v0, $v1, $zero
	add	$v1, $a1, $zero
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	veccpy@2926
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
cont@10497:
	lw	$v0, 1($sp)
	addi	$v1, $v0, 1
	lw	$v0, 0($sp)
	j	pretrace_diffuse_rays@5766
else@10495:
	jr	$ra
else@10494:
	jr	$ra
pretrace_pixels@5788:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10500
	lui	$a1, 1
	ori	$a1, $a1, 65377
	lwc1	$f3, 0($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65378
	lw	$a1, 0($a1)
	sub	$a1, $v1, $a1
	mfc2	$f4, $a1
	cvtsw	$f4, $f4
	mulf	$f3, $f3, $f4
	lui	$a1, 1
	ori	$a1, $a1, 65368
	lwc1	$f4, 0($a1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f0
	lui	$a1, 1
	ori	$a1, $a1, 65359
	swc1	$f4, 0($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65368
	lwc1	$f4, 1($a1)
	mulf	$f4, $f3, $f4
	addf	$f4, $f4, $f1
	lui	$a1, 1
	ori	$a1, $a1, 65359
	swc1	$f4, 1($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65368
	lwc1	$f4, 2($a1)
	mulf	$f3, $f3, $f4
	addf	$f3, $f3, $f2
	lui	$a1, 1
	ori	$a1, $a1, 65359
	swc1	$f3, 2($a1)
	ori	$a1, $zero, 0
	lui	$a2, 1
	ori	$a2, $a2, 65359
	swc1	$f2, 0($sp)
	swc1	$f1, 2($sp)
	swc1	$f0, 4($sp)
	sw	$a0, 6($sp)
	sw	$v0, 7($sp)
	sw	$v1, 8($sp)
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	vecunit_sgn@2992
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	ori	$at, $zero, 0
	mfc2	$f0, $at
	lui	$v0, 1
	ori	$v0, $v0, 65382
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	vecfill@2915
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65458
	lui	$v0, 1
	ori	$v0, $v0, 65374
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	veccpy@2926
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	ori	$v0, $zero, 0
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lw	$v1, 8($sp)
	sll	$a0, $v1, 0
	lw	$a1, 7($sp)
	add	$at, $a1, $a0
	lw	$a0, 0($at)
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lui	$a2, 1
	ori	$a2, $a2, 65359
	add	$v1, $a2, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	trace_ray@5413
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 0
	lw	$a0, 7($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	lui	$a1, 1
	ori	$a1, $a1, 65382
	add	$v0, $v1, $zero
	add	$v1, $a1, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	veccpy@2926
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 0
	lw	$a0, 7($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 6($v1)
	lw	$a1, 6($sp)
	sw	$a1, 0($v1)
	sll	$v1, $v0, 0
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	ori	$a2, $zero, 0
	add	$v0, $v1, $zero
	add	$v1, $a2, $zero
	sw	$ra, 9($sp)
	addi	$sp, $sp, 10
	jal	pretrace_diffuse_rays@5766
	addi	$sp, $sp, -10
	lw	$ra, 9($sp)
	lw	$v0, 8($sp)
	addi	$v1, $v0, -1
	lw	$v0, 6($sp)
	addi	$v0, $v0, 1
	slti	$at, $v0, 5
	bne	$at, $zero, else@10501
	addi	$a0, $v0, -5
	j	cont@10502
else@10501:
	add	$a0, $zero, $v0
cont@10502:
	lwc1	$f0, 4($sp)
	lwc1	$f1, 2($sp)
	lwc1	$f2, 0($sp)
	lw	$v0, 7($sp)
	j	pretrace_pixels@5788
else@10500:
	jr	$ra
pretrace_line@5842:
	lui	$a1, 1
	ori	$a1, $a1, 65377
	lwc1	$f0, 0($a1)
	lui	$a1, 1
	ori	$a1, $a1, 65378
	lw	$a1, 1($a1)
	sub	$v1, $v1, $a1
	mfc2	$f1, $v1
	cvtsw	$f1, $f1
	mulf	$f0, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65365
	lwc1	$f1, 0($v1)
	mulf	$f1, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65362
	lwc1	$f2, 0($v1)
	addf	$f1, $f1, $f2
	lui	$v1, 1
	ori	$v1, $v1, 65365
	lwc1	$f2, 1($v1)
	mulf	$f2, $f0, $f2
	lui	$v1, 1
	ori	$v1, $v1, 65362
	lwc1	$f3, 1($v1)
	addf	$f2, $f2, $f3
	lui	$v1, 1
	ori	$v1, $v1, 65365
	lwc1	$f3, 2($v1)
	mulf	$f0, $f0, $f3
	lui	$v1, 1
	ori	$v1, $v1, 65362
	lwc1	$f3, 2($v1)
	addf	$f0, $f0, $f3
	lui	$v1, 1
	ori	$v1, $v1, 65380
	lw	$v1, 0($v1)
	addi	$v1, $v1, -1
	mvf	$f30, $f2
	mvf	$f2, $f0
	mvf	$f0, $f1
	mvf	$f1, $f30
	j	pretrace_pixels@5788
scan_pixel@5875:
	lui	$a3, 1
	ori	$a3, $a3, 65380
	lw	$a3, 0($a3)
	slt	$at, $v0, $a3
	bne	$at, $zero, else@10504
	jr	$ra
else@10504:
	sll	$a3, $v0, 0
	add	$at, $a1, $a3
	lw	$a3, 0($at)
	lw	$a3, 0($a3)
	lui	$t0, 1
	ori	$t0, $t0, 65382
	sw	$a0, 0($sp)
	sw	$a1, 1($sp)
	sw	$a2, 2($sp)
	sw	$v1, 3($sp)
	sw	$v0, 4($sp)
	add	$v1, $a3, $zero
	add	$v0, $t0, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	veccpy@2926
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	lw	$v1, 3($sp)
	lw	$a0, 2($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	neighbors_exist@5668
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	addi	$at, $zero, 0
	bne	$v0, $at, else@10506
	lw	$v0, 4($sp)
	sll	$v1, $v0, 0
	lw	$a0, 1($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	ori	$a1, $zero, 0
	add	$v0, $v1, $zero
	add	$v1, $a1, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	do_without_neighbors@5655
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	j	cont@10507
else@10506:
	ori	$a3, $zero, 0
	lw	$v0, 4($sp)
	lw	$v1, 3($sp)
	lw	$a0, 0($sp)
	lw	$a1, 1($sp)
	lw	$a2, 2($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	try_exploit_neighbors@5706
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
cont@10507:
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	write_rgb@5755
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, 1
	lw	$v1, 3($sp)
	lw	$a0, 0($sp)
	lw	$a1, 1($sp)
	lw	$a2, 2($sp)
	j	scan_pixel@5875
scan_line@5896:
	lui	$a3, 1
	ori	$a3, $a3, 65380
	lw	$a3, 1($a3)
	slt	$at, $v0, $a3
	bne	$at, $zero, else@10508
	jr	$ra
else@10508:
	lui	$a3, 1
	ori	$a3, $a3, 65380
	lw	$a3, 1($a3)
	addi	$a3, $a3, -1
	sw	$a2, 0($sp)
	sw	$a1, 1($sp)
	sw	$a0, 2($sp)
	sw	$v1, 3($sp)
	sw	$v0, 4($sp)
	slt	$at, $v0, $a3
	bne	$at, $zero, else@10510
	j	cont@10511
else@10510:
	addi	$a3, $v0, 1
	add	$a0, $a2, $zero
	add	$v1, $a3, $zero
	add	$v0, $a1, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	pretrace_line@5842
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
cont@10511:
	ori	$v0, $zero, 0
	lw	$v1, 4($sp)
	lw	$a0, 3($sp)
	lw	$a1, 2($sp)
	lw	$a2, 1($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	scan_pixel@5875
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, 1
	lw	$v1, 0($sp)
	addi	$v1, $v1, 2
	slti	$at, $v1, 5
	bne	$at, $zero, else@10512
	addi	$a2, $v1, -5
	j	cont@10513
else@10512:
	add	$a2, $zero, $v1
cont@10513:
	lw	$v1, 2($sp)
	lw	$a0, 1($sp)
	lw	$a1, 3($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	scan_line@5896
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	jr	$ra
create_float5x3array@5918:
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	add	$v1, $zero, $v0
	ori	$v0, $zero, 5
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v1, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_float_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v1, 0($sp)
	sw	$v0, 1($v1)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_float_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v1, 0($sp)
	sw	$v0, 2($v1)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_float_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v1, 0($sp)
	sw	$v0, 3($v1)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_float_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v1, 0($sp)
	sw	$v0, 4($v1)
	add	$v0, $zero, $v1
	jr	$ra
create_pixel@5945:
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	create_float5x3array@5918
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	ori	$v1, $zero, 5
	ori	$a0, $zero, 0
	sw	$v0, 1($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v1, $zero, 5
	ori	$a0, $zero, 0
	sw	$v0, 2($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_array
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	sw	$v0, 3($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	create_float5x3array@5918
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	sw	$v0, 4($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	create_float5x3array@5918
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	ori	$v1, $zero, 1
	ori	$a0, $zero, 0
	sw	$v0, 5($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	min_caml_create_array
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	sw	$v0, 6($sp)
	sw	$ra, 7($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array@5918
	addi	$sp, $sp, -8
	lw	$ra, 7($sp)
	addi	$gp, $gp, -8
	add	$v1, $zero, $gp
	sw	$v0, 7($v1)
	lw	$v0, 6($sp)
	sw	$v0, 6($v1)
	lw	$v0, 5($sp)
	sw	$v0, 5($v1)
	lw	$v0, 4($sp)
	sw	$v0, 4($v1)
	lw	$v0, 3($sp)
	sw	$v0, 3($v1)
	lw	$v0, 2($sp)
	sw	$v0, 2($v1)
	lw	$v0, 1($sp)
	sw	$v0, 1($v1)
	lw	$v0, 0($sp)
	sw	$v0, 0($v1)
	add	$v0, $zero, $v1
	jr	$ra
init_line_elements@5967:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10515
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	create_pixel@5945
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	sll	$a0, $v1, 0
	lw	$a1, 0($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	addi	$v1, $v1, -1
	add	$v0, $a1, $zero
	j	init_line_elements@5967
else@10515:
	jr	$ra
create_pixelline@5976:
	lui	$v0, 1
	ori	$v0, $v0, 65380
	lw	$v0, 0($v0)
	sw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	create_pixel@5945
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	add	$v1, $zero, $v0
	lw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65380
	lw	$v1, 0($v1)
	addi	$v1, $v1, -2
	j	init_line_elements@5967
adjust_position@5991:
	mulf	$f0, $f0, $f0
	lui	$at, 15820
	ori	$at, $at, 52429
	mfc2	$f2, $at
	addf	$f0, $f0, $f2
	sqrt	$f0, $f0
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f2, $at
	divf	$f2, $f2, $f0
	swc1	$f0, 0($sp)
	swc1	$f1, 2($sp)
	mvf	$f0, $f2
	sw	$ra, 4($sp)
	addi	$sp, $sp, 5
	jal	atan@2791
	addi	$sp, $sp, -5
	lw	$ra, 4($sp)
	lwc1	$f1, 2($sp)
	mulf	$f0, $f0, $f1
	swc1	$f0, 4($sp)
	sw	$ra, 6($sp)
	addi	$sp, $sp, 7
	jal	sin@2659
	addi	$sp, $sp, -7
	lw	$ra, 6($sp)
	lwc1	$f1, 4($sp)
	swc1	$f0, 6($sp)
	mvf	$f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	cos@2726
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lwc1	$f1, 6($sp)
	divf	$f0, $f1, $f0
	lwc1	$f1, 0($sp)
	mulf	$f0, $f0, $f1
	jr	$ra
calc_dirvec@6003:
	slti	$at, $v0, 5
	bne	$at, $zero, else@10516
	mulf	$f2, $f0, $f0
	mulf	$f3, $f1, $f1
	addf	$f2, $f2, $f3
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	addf	$f2, $f2, $f3
	sqrt	$f2, $f2
	divf	$f0, $f0, $f2
	divf	$f1, $f1, $f2
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f3, $at
	divf	$f2, $f3, $f2
	lui	$v0, 1
	ori	$v0, $v0, 65352
	sll	$v1, $v1, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	sll	$v1, $a0, 0
	add	$at, $v0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	swc1	$f2, 0($sp)
	swc1	$f0, 2($sp)
	swc1	$f1, 4($sp)
	sw	$v0, 6($sp)
	sw	$a0, 7($sp)
	add	$v0, $v1, $zero
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	vecset@2905
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 7($sp)
	addi	$v1, $v0, 40
	sll	$v1, $v1, 0
	lw	$a0, 6($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	lwc1	$f0, 4($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f2, $at
	lwc1	$f1, 2($sp)
	lwc1	$f3, 0($sp)
	add	$v0, $v1, $zero
	mvf	$f0, $f1
	mvf	$f1, $f3
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	vecset@2905
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 7($sp)
	addi	$v1, $v0, 80
	sll	$v1, $v1, 0
	lw	$a0, 6($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	lwc1	$f0, 2($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lwc1	$f2, 4($sp)
	mfc1	$at, $f2
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	lwc1	$f4, 0($sp)
	add	$v0, $v1, $zero
	mvf	$f2, $f3
	mvf	$f0, $f4
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	vecset@2905
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 7($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 0
	lw	$a0, 6($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	lwc1	$f0, 2($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lwc1	$f2, 4($sp)
	mfc1	$at, $f2
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	lwc1	$f4, 0($sp)
	mfc1	$at, $f4
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f5, $at
	add	$v0, $v1, $zero
	mvf	$f2, $f5
	mvf	$f0, $f1
	mvf	$f1, $f3
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	vecset@2905
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 7($sp)
	addi	$v1, $v0, 41
	sll	$v1, $v1, 0
	lw	$a0, 6($sp)
	add	$at, $a0, $v1
	lw	$v1, 0($at)
	lw	$v1, 0($v1)
	lwc1	$f0, 2($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lwc1	$f2, 0($sp)
	mfc1	$at, $f2
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	lwc1	$f4, 4($sp)
	add	$v0, $v1, $zero
	mvf	$f2, $f4
	mvf	$f0, $f1
	mvf	$f1, $f3
	sw	$ra, 8($sp)
	addi	$sp, $sp, 9
	jal	vecset@2905
	addi	$sp, $sp, -9
	lw	$ra, 8($sp)
	lw	$v0, 7($sp)
	addi	$v0, $v0, 81
	sll	$v0, $v0, 0
	lw	$v1, 6($sp)
	add	$at, $v1, $v0
	lw	$v0, 0($at)
	lw	$v0, 0($v0)
	lwc1	$f0, 0($sp)
	mfc1	$at, $f0
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f0, $at
	lwc1	$f1, 2($sp)
	lwc1	$f2, 4($sp)
	j	vecset@2905
else@10516:
	swc1	$f2, 8($sp)
	sw	$a0, 7($sp)
	sw	$v1, 10($sp)
	swc1	$f3, 12($sp)
	sw	$v0, 14($sp)
	mvf	$f0, $f1
	mvf	$f1, $f2
	sw	$ra, 15($sp)
	addi	$sp, $sp, 16
	jal	adjust_position@5991
	addi	$sp, $sp, -16
	lw	$ra, 15($sp)
	lw	$v0, 14($sp)
	addi	$v0, $v0, 1
	lwc1	$f1, 12($sp)
	swc1	$f0, 16($sp)
	sw	$v0, 18($sp)
	sw	$ra, 19($sp)
	addi	$sp, $sp, 20
	jal	adjust_position@5991
	addi	$sp, $sp, -20
	lw	$ra, 19($sp)
	mvf	$f1, $f0
	lwc1	$f0, 16($sp)
	lwc1	$f2, 8($sp)
	lwc1	$f3, 12($sp)
	lw	$v0, 18($sp)
	lw	$v1, 10($sp)
	lw	$a0, 7($sp)
	j	calc_dirvec@6003
calc_dirvecs@6063:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10519
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	lui	$at, 15948
	ori	$at, $at, 52429
	mfc2	$f2, $at
	mulf	$f1, $f1, $f2
	lui	$at, 16230
	ori	$at, $at, 26214
	mfc2	$f2, $at
	subf	$f2, $f1, $f2
	ori	$a1, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f1, $at
	ori	$at, $zero, 0
	mfc2	$f3, $at
	swc1	$f0, 0($sp)
	sw	$v1, 2($sp)
	sw	$a0, 3($sp)
	sw	$v0, 4($sp)
	add	$v0, $a1, $zero
	mvf	$f30, $f3
	mvf	$f3, $f0
	mvf	$f0, $f1
	mvf	$f1, $f30
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	calc_dirvec@6003
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	mfc2	$f0, $v0
	cvtsw	$f0, $f0
	lui	$at, 15948
	ori	$at, $at, 52429
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lui	$at, 15820
	ori	$at, $at, 52429
	mfc2	$f1, $at
	addf	$f2, $f0, $f1
	ori	$v1, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	ori	$at, $zero, 0
	mfc2	$f1, $at
	lw	$a0, 3($sp)
	addi	$a1, $a0, 2
	lwc1	$f3, 0($sp)
	lw	$a2, 2($sp)
	add	$a0, $a1, $zero
	add	$v0, $v1, $zero
	add	$v1, $a2, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	calc_dirvec@6003
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$v1, 2($sp)
	addi	$v1, $v1, 1
	slti	$at, $v1, 5
	bne	$at, $zero, else@10520
	addi	$v1, $v1, -5
	j	cont@10521
else@10520:
cont@10521:
	lwc1	$f0, 0($sp)
	lw	$a0, 3($sp)
	j	calc_dirvecs@6063
else@10519:
	jr	$ra
calc_dirvec_rows@6093:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10523
	mfc2	$f0, $v0
	cvtsw	$f0, $f0
	lui	$at, 15948
	ori	$at, $at, 52429
	mfc2	$f1, $at
	mulf	$f0, $f0, $f1
	lui	$at, 16230
	ori	$at, $at, 26214
	mfc2	$f1, $at
	subf	$f0, $f0, $f1
	ori	$a1, $zero, 4
	sw	$a0, 0($sp)
	sw	$v1, 1($sp)
	sw	$v0, 2($sp)
	add	$v0, $a1, $zero
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	calc_dirvecs@6063
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lw	$v0, 2($sp)
	addi	$v0, $v0, -1
	lw	$v1, 1($sp)
	addi	$v1, $v1, 2
	slti	$at, $v1, 5
	bne	$at, $zero, else@10524
	addi	$v1, $v1, -5
	j	cont@10525
else@10524:
cont@10525:
	lw	$a0, 0($sp)
	addi	$a0, $a0, 4
	j	calc_dirvec_rows@6093
else@10523:
	jr	$ra
create_dirvec@6111:
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	add	$v1, $zero, $v0
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v0, 0($v0)
	sw	$v1, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	addi	$gp, $gp, -2
	add	$v1, $zero, $gp
	sw	$v0, 1($v1)
	lw	$v0, 0($sp)
	sw	$v0, 0($v1)
	add	$v0, $zero, $v1
	jr	$ra
create_dirvec_elements@6119:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10527
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	create_dirvec@6111
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v1, 1($sp)
	sll	$a0, $v1, 0
	lw	$a1, 0($sp)
	add	$at, $a1, $a0
	sw	$v0, 0($at)
	addi	$v1, $v1, -1
	add	$v0, $a1, $zero
	j	create_dirvec_elements@6119
else@10527:
	jr	$ra
create_dirvecs@6128:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10529
	ori	$v1, $zero, 120
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	create_dirvec@6111
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	add	$v1, $zero, $v0
	lw	$v0, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65352
	lw	$a0, 0($sp)
	sll	$a1, $a0, 0
	add	$at, $v1, $a1
	sw	$v0, 0($at)
	lui	$v0, 1
	ori	$v0, $v0, 65352
	sll	$v1, $a0, 0
	add	$at, $v0, $v1
	lw	$v0, 0($at)
	ori	$v1, $zero, 118
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	create_dirvec_elements@6119
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v0, 0($sp)
	addi	$v0, $v0, -1
	j	create_dirvecs@6128
else@10529:
	jr	$ra
init_dirvec_constants@6141:
	slti	$at, $v1, 0
	bne	$at, $zero, else@10531
	sll	$a0, $v1, 0
	add	$at, $v0, $a0
	lw	$a0, 0($at)
	lui	$a1, 1
	ori	$a1, $a1, 65535
	lw	$a1, 0($a1)
	addi	$a1, $a1, -1
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	add	$v1, $a1, $zero
	add	$v0, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	iter_setup_dirvec_constants@4663
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lw	$v0, 1($sp)
	addi	$v1, $v0, -1
	lw	$v0, 0($sp)
	j	init_dirvec_constants@6141
else@10531:
	jr	$ra
init_vecset_constants@6149:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10533
	lui	$v1, 1
	ori	$v1, $v1, 65352
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$v1, 0($at)
	ori	$a0, $zero, 119
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	init_dirvec_constants@6141
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lw	$v0, 0($sp)
	addi	$v0, $v0, -1
	j	init_vecset_constants@6149
else@10533:
	jr	$ra
init_dirvecs@6157:
	ori	$v0, $zero, 4
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	create_dirvecs@6128
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 9
	ori	$v1, $zero, 0
	ori	$a0, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	calc_dirvec_rows@6093
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 4
	j	init_vecset_constants@6149
add_reflection@6166:
	sw	$v0, 0($sp)
	sw	$v1, 1($sp)
	swc1	$f0, 2($sp)
	swc1	$f3, 4($sp)
	swc1	$f2, 6($sp)
	swc1	$f1, 8($sp)
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	create_dirvec@6111
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v1, 0($v0)
	lwc1	$f0, 8($sp)
	lwc1	$f1, 6($sp)
	lwc1	$f2, 4($sp)
	sw	$v0, 10($sp)
	add	$v0, $v1, $zero
	sw	$ra, 11($sp)
	addi	$sp, $sp, 12
	jal	vecset@2905
	addi	$sp, $sp, -12
	lw	$ra, 11($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lw	$v0, 10($sp)
	sw	$ra, 11($sp)
	addi	$sp, $sp, 12
	jal	iter_setup_dirvec_constants@4663
	addi	$sp, $sp, -12
	lw	$ra, 11($sp)
	addi	$gp, $gp, -3
	add	$v0, $zero, $gp
	lwc1	$f0, 2($sp)
	swc1	$f0, 2($v0)
	lw	$v1, 10($sp)
	sw	$v1, 1($v0)
	lw	$v1, 1($sp)
	sw	$v1, 0($v0)
	lui	$v1, 1
	ori	$v1, $v1, 65102
	lw	$a0, 0($sp)
	sll	$a0, $a0, 0
	add	$at, $v1, $a0
	sw	$v0, 0($at)
	jr	$ra
setup_rect_reflection@6179:
	addi	$v0, $v0, -4
	lui	$a0, 1
	ori	$a0, $a0, 65101
	lw	$a0, 0($a0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lw	$v1, 7($v1)
	lwc1	$f1, 0($v1)
	subf	$f0, $f0, $f1
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lwc1	$f1, 0($v1)
	mfc1	$at, $f1
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f1, $at
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lwc1	$f2, 1($v1)
	mfc1	$at, $f2
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f2, $at
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lwc1	$f3, 2($v1)
	mfc1	$at, $f3
	lui	$fp, 32768
	xor	$at, $at, $fp
	mfc2	$f3, $at
	addi	$v1, $v0, 1
	lui	$a1, 1
	ori	$a1, $a1, 65455
	lwc1	$f4, 0($a1)
	swc1	$f2, 0($sp)
	swc1	$f3, 2($sp)
	swc1	$f1, 4($sp)
	swc1	$f0, 6($sp)
	sw	$v0, 8($sp)
	sw	$a0, 9($sp)
	add	$v0, $a0, $zero
	mvf	$f1, $f4
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	add_reflection@6166
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v0, 9($sp)
	addi	$v1, $v0, 1
	lw	$a0, 8($sp)
	addi	$a1, $a0, 2
	lui	$a2, 1
	ori	$a2, $a2, 65455
	lwc1	$f2, 1($a2)
	lwc1	$f0, 6($sp)
	lwc1	$f1, 4($sp)
	lwc1	$f3, 2($sp)
	add	$v0, $v1, $zero
	add	$v1, $a1, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	add_reflection@6166
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v0, 9($sp)
	addi	$v1, $v0, 2
	lw	$a0, 8($sp)
	addi	$a0, $a0, 3
	lui	$a1, 1
	ori	$a1, $a1, 65455
	lwc1	$f3, 2($a1)
	lwc1	$f0, 6($sp)
	lwc1	$f1, 4($sp)
	lwc1	$f2, 0($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 10($sp)
	addi	$sp, $sp, 11
	jal	add_reflection@6166
	addi	$sp, $sp, -11
	lw	$ra, 10($sp)
	lw	$v0, 9($sp)
	addi	$v0, $v0, 3
	lui	$v1, 1
	ori	$v1, $v1, 65101
	sw	$v0, 0($v1)
	jr	$ra
setup_surface_reflection@6220:
	addi	$v0, $v0, -4
	addi	$v0, $v0, 1
	lui	$a0, 1
	ori	$a0, $a0, 65101
	lw	$a0, 0($a0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f0, $at
	lw	$a1, 7($v1)
	lwc1	$f1, 0($a1)
	subf	$f0, $f0, $f1
	lw	$a1, 4($v1)
	lui	$a2, 1
	ori	$a2, $a2, 65455
	swc1	$f0, 0($sp)
	sw	$v0, 2($sp)
	sw	$a0, 3($sp)
	sw	$v1, 4($sp)
	add	$v1, $a1, $zero
	add	$v0, $a2, $zero
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	veciprod@3027
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f1, $at
	lw	$v0, 4($sp)
	lw	$v1, 4($v0)
	lwc1	$f2, 0($v1)
	mulf	$f1, $f1, $f2
	mulf	$f1, $f1, $f0
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lwc1	$f2, 0($v1)
	subf	$f1, $f1, $f2
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f2, $at
	lw	$v1, 4($v0)
	lwc1	$f3, 1($v1)
	mulf	$f2, $f2, $f3
	mulf	$f2, $f2, $f0
	lui	$v1, 1
	ori	$v1, $v1, 65455
	lwc1	$f3, 1($v1)
	subf	$f2, $f2, $f3
	lui	$at, 16384
	ori	$at, $at, 0
	mfc2	$f3, $at
	lw	$v0, 4($v0)
	lwc1	$f4, 2($v0)
	mulf	$f3, $f3, $f4
	mulf	$f0, $f3, $f0
	lui	$v0, 1
	ori	$v0, $v0, 65455
	lwc1	$f3, 2($v0)
	subf	$f3, $f0, $f3
	lwc1	$f0, 0($sp)
	lw	$v0, 3($sp)
	lw	$v1, 2($sp)
	sw	$ra, 5($sp)
	addi	$sp, $sp, 6
	jal	add_reflection@6166
	addi	$sp, $sp, -6
	lw	$ra, 5($sp)
	lw	$v0, 3($sp)
	addi	$v0, $v0, 1
	lui	$v1, 1
	ori	$v1, $v1, 65101
	sw	$v0, 0($v1)
	jr	$ra
setup_reflections@6259:
	slti	$at, $v0, 0
	bne	$at, $zero, else@10538
	lui	$v1, 1
	ori	$v1, $v1, 65464
	sll	$a0, $v0, 0
	add	$at, $v1, $a0
	lw	$v1, 0($at)
	lw	$a0, 2($v1)
	addi	$at, $zero, 2
	bne	$a0, $at, else@10539
	lw	$a0, 7($v1)
	lwc1	$f0, 0($a0)
	lui	$at, 16256
	ori	$at, $at, 0
	mfc2	$f1, $at
	lef	$f1, $f0
	bc1f	else@10540
	ori	$a0, $zero, 0
	j	cont@10541
else@10540:
	ori	$a0, $zero, 1
cont@10541:
	addi	$at, $zero, 0
	bne	$a0, $at, else@10542
	jr	$ra
else@10542:
	lw	$a0, 1($v1)
	addi	$at, $zero, 1
	bne	$a0, $at, else@10544
	j	setup_rect_reflection@6179
else@10544:
	addi	$at, $zero, 2
	bne	$a0, $at, else@10545
	j	setup_surface_reflection@6220
else@10545:
	jr	$ra
else@10539:
	jr	$ra
else@10538:
	jr	$ra
rt@6272:
	lui	$a0, 1
	ori	$a0, $a0, 65380
	sw	$v0, 0($a0)
	lui	$a0, 1
	ori	$a0, $a0, 65380
	sw	$v1, 1($a0)
	srl	$a0, $v0, 1
	lui	$a1, 1
	ori	$a1, $a1, 65378
	sw	$a0, 0($a1)
	srl	$v1, $v1, 1
	lui	$a0, 1
	ori	$a0, $a0, 65378
	sw	$v1, 1($a0)
	lui	$at, 17152
	ori	$at, $at, 0
	mfc2	$f0, $at
	mfc2	$f1, $v0
	cvtsw	$f1, $f1
	divf	$f0, $f0, $f1
	lui	$v0, 1
	ori	$v0, $v0, 65377
	swc1	$f0, 0($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	create_pixelline@5976
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	create_pixelline@5976
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	sw	$v0, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	create_pixelline@5976
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v1, $zero, 170
	print_char	$v1
	sw	$v0, 2($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	read_parameter@3986
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	write_ppm_header@5726
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	init_dirvecs@6157
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65289
	lui	$v0, 1
	ori	$v0, $v0, 65349
	lui	$v1, 1
	ori	$v1, $v1, 65455
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	veccpy@2926
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lui	$v0, 1
	ori	$v0, $v0, 65287
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	iter_setup_dirvec_constants@4663
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65535
	lw	$v0, 0($v0)
	addi	$v0, $v0, -1
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	setup_reflections@6259
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	ori	$v1, $zero, 0
	ori	$a0, $zero, 0
	lw	$v0, 1($sp)
	sw	$ra, 3($sp)
	addi	$sp, $sp, 4
	jal	pretrace_line@5842
	addi	$sp, $sp, -4
	lw	$ra, 3($sp)
	ori	$v0, $zero, 0
	ori	$a2, $zero, 2
	lw	$v1, 0($sp)
	lw	$a0, 1($sp)
	lw	$a1, 2($sp)
	j	scan_line@5896
_min_caml_start:
	addi	$sp, $zero, 0
	lui	$gp, 2
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
#	main program starts
	ori	$v0, $zero, 1
	ori	$v1, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 60
	ori	$v1, $zero, 0
	ori	$a0, $zero, 0
	ori	$a1, $zero, 0
	ori	$a2, $zero, 0
	ori	$a3, $zero, 0
	lui	$t0, 1
	ori	$t0, $t0, 65535
	lui	$t1, 1
	ori	$t1, $t1, 65535
	lui	$t2, 1
	ori	$t2, $t2, 65535
	lui	$t3, 1
	ori	$t3, $t3, 65535
	lui	$t4, 1
	ori	$t4, $t4, 65535
	lui	$t5, 1
	ori	$t5, $t5, 65535
	addi	$gp, $gp, -11
	add	$t6, $zero, $gp
	sw	$t0, 10($t6)
	sw	$t1, 9($t6)
	sw	$t2, 8($t6)
	sw	$t3, 7($t6)
	sw	$a3, 6($t6)
	sw	$t4, 5($t6)
	sw	$t5, 4($t6)
	sw	$a2, 3($t6)
	sw	$a1, 2($t6)
	sw	$a0, 1($t6)
	sw	$v1, 0($t6)
	add	$v1, $zero, $t6
	lui	$v1, 1
	ori	$v1, $v1, 65524
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 1
	lui	$at, 17279
	ori	$at, $at, 0
	mfc2	$f0, $at
	sw	$ra, 0($sp)
	addi	$sp, $sp, 1
	jal	min_caml_create_float_array
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	ori	$v0, $zero, 50
	ori	$v1, $zero, 1
	lui	$a0, 65535
	ori	$a0, $a0, 65535
	sw	$v0, 0($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65453
	lw	$v0, 0($sp)
	sw	$ra, 1($sp)
	addi	$sp, $sp, 2
	jal	min_caml_create_array
	addi	$sp, $sp, -2
	lw	$ra, 1($sp)
	ori	$v0, $zero, 1
	ori	$v1, $zero, 1
	lui	$a0, 1
	ori	$a0, $a0, 65403
	lw	$a0, 0($a0)
	sw	$v0, 1($sp)
	add	$v0, $v1, $zero
	add	$v1, $a0, $zero
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lui	$v1, 1
	ori	$v1, $v1, 65402
	lw	$v0, 1($sp)
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	ori	$v1, $zero, 0
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	lui	$at, 20078
	ori	$at, $at, 27432
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	ori	$v1, $zero, 0
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 2
	ori	$v1, $zero, 0
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 2
	ori	$v1, $zero, 0
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 0
	lui	$v1, 1
	ori	$v1, $v1, 65359
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 0
	lui	$v1, 1
	ori	$v1, $v1, 65359
	lui	$a0, 1
	ori	$a0, $a0, 65359
	addi	$gp, $gp, -2
	add	$a1, $zero, $gp
	sw	$v1, 1($a1)
	sw	$a0, 0($a1)
	add	$v1, $zero, $a1
	lui	$v1, 1
	ori	$v1, $v1, 65357
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 5
	lui	$v1, 1
	ori	$v1, $v1, 65357
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 3
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 60
	lui	$v1, 1
	ori	$v1, $v1, 65352
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65289
	lui	$v1, 1
	ori	$v1, $v1, 65349
	addi	$gp, $gp, -2
	add	$a0, $zero, $gp
	sw	$v0, 1($a0)
	sw	$v1, 0($a0)
	add	$v0, $zero, $a0
	ori	$v0, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_float_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 0
	lui	$v1, 1
	ori	$v1, $v1, 65287
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	lui	$v0, 1
	ori	$v0, $v0, 65287
	lui	$v1, 1
	ori	$v1, $v1, 65287
	addi	$gp, $gp, -2
	add	$a0, $zero, $gp
	sw	$v0, 1($a0)
	sw	$v1, 0($a0)
	add	$v0, $zero, $a0
	ori	$v0, $zero, 180
	ori	$v1, $zero, 0
	ori	$at, $zero, 0
	mfc2	$f0, $at
	lui	$a0, 1
	ori	$a0, $a0, 65285
	addi	$gp, $gp, -3
	add	$a1, $zero, $gp
	swc1	$f0, 2($a1)
	sw	$a0, 1($a1)
	sw	$v1, 0($a1)
	add	$v1, $zero, $a1
	lui	$v1, 1
	ori	$v1, $v1, 65282
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 1
	ori	$v1, $zero, 0
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	min_caml_create_array
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$v0, $zero, 128
	ori	$v1, $zero, 128
	sw	$ra, 2($sp)
	addi	$sp, $sp, 3
	jal	rt@6272
	addi	$sp, $sp, -3
	lw	$ra, 2($sp)
	ori	$at, $zero, 0
#	main program ends
	addi	$sp, $sp, -1
	lw	$ra, 0($sp)
	halt
	jr	$ra
min_caml_create_array:
	add	$at, $zero, $v0
create_array_loop:
	beq	$zero, $at, create_array_return
	addi	$at, $at, -1
	addi	$gp, $gp, -1
	sw	$v1, 0($gp)
	j create_array_loop
min_caml_create_float_array:
	add	$at, $zero, $v0
create_float_array_loop:
	beq	$zero, $at, create_array_return
	addi	$at, $at, -1
	addi	$gp, $gp, -1
	swc1	$f0, 0($gp)
	j create_float_array_loop
create_array_return:
	add	$v0, $zero, $gp
	jr	$ra
	