.text
main:
	li $a0, 5	# Inicializa A0 com 5
	jal fact		# Chama a função fatorial;
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
    	syscall

fact: 
	addi $sp, $sp, -8 # Aloca 2 palavras na Stack
	sw $ra, 4($sp) # salva o return address
	sw $a0, 0($sp) # salva o argumento atual
	
	# TESTA SE MENOR QUE 1
	
	slti $t0, $a0, 2 # If $a0 < 2 -> $t0 = 1, else $t0 = 0
	beq $t0, $zero, L1
	
	addi $v0, $zero, 1	#retorna 1
	addi $sp, $sp, 8 # Restaura o stack pointer
	jr $ra	# retorna para o caller original
	
L1: 
	addi $a0, $a0, -1
	jal fact
	
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra