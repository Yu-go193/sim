	addi	$t0, $zero, 0
	lui	$v1, 1
	ori	$v1, $v1, 65535
	addi	$t1, $zero, 1
writeloop:
	beq	$t0, $v1, writefinish
	sw	$t1, 0($t0)
	addi	$t0, $t0, 1
	j	writeloop
writefinish:
	addi	$v0, $zero, 0
	addi	$t0, $zero, 0
readloop:
	beq	$v1, $t0, readfinish
	addi	$t1, $zero, 0
	lw	$t1, 0($t0)
	add	$v0, $v0, $t1
	addi	$t0, $t0, 1
	j	readloop
readfinish:
	sub	$v0, $v1, $v0 
	addi	$v0, $v0, 48
hoge:
	print_char $v0
	j	hoge
	halt
	
