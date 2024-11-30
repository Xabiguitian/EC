.data
n: .word 12
r: .word  0
datos: .float 0.6, 1.5, 1.4, 2.2, 3.5, 6.2, 2.5, 4.1, 2.4, 3.6, 0.9, 1.1, 3.3

.text
.globl main

main:
  la $a0, datos
  la $a1, n
  lw $t0, 0($a1)

loop:
  lwc1 $f1, 4($a0)
  lwc1 $f0, 0($a0)
  addi $a0, $a0, 4
  sub.s $f2, $f1, $f0
  addi $t0, $t0, -1
  c.lt.s $f2, $f5

  bc1t post
  add.s $f8, $f8, $f2
  addi $t5, $t5, 1

 post:
  bne $t0, $0, loop
  swc1 $f8, 0($a0)


  la $a2, r
  sw $t5, 0($a2)
  addi $v0, $0, 10
  syscall
