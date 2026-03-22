.data  # àreas do assembly = especificação de variaveis / lidar com os dados na mèmoria principal

	msg:.asciiz "Olá, mundo!"  #asciiz = variavel referente a cadeia de caractéres


.text
	# Área para instruções do programa
	li $v0,4 #Instrução para impressao de String
	la $a0, msg #Indicar o endereço em que está a mensagwem
	
	sycall # imprime o que estiver dentro do registrador == faça!