.text
START:
#初始化

#初始位置16
add $s0, $zero, $zero 
addi $s1, $zero, 1
addi $v0, $zero, 0xc0#bug：地址没有左移两位
addi $k0, $0,1

sll $t0, $s1, 16
add $t1, $zero, $zero

loop:
add $s2, $zero, $zero #空循环次数
addi $s3, $zero, 0
noploop:
addi $s2, $s2, 1
bne $s1, $s2, noploop #空循环
# 移位
lw $s4, 0x78($s0)
sw $s4, 0x7c($s0)
lw $s4, 0x74($s0)
sw $s4, 0x78($s0)
lw $s4, 0x70($s0)
sw $s4, 0x74($s0)
lw $s4, 0x6c($s0)
sw $s4, 0x70($s0)
lw $s4, 0x68($s0)
sw $s4, 0x6c($s0)
lw $s4, 0x64($s0)
sw $s4, 0x68($s0)
lw $s4, 0x60($s0)
sw $s4, 0x64($s0)
lw $s4, 0x5c($s0)
sw $s4, 0x60($s0)
lw $s4, 0x58($s0)
sw $s4, 0x5c($s0)
lw $s4, 0x54($s0)
sw $s4, 0x58($s0)
lw $s4, 0x50($s0)
sw $s4, 0x54($s0)
lw $s4, 0x4c($s0)
sw $s4, 0x50($s0)
lw $s4, 0x48($s0)
sw $s4, 0x4c($s0)
lw $s4, 0x44($s0)
sw $s4, 0x48($s0)
lw $s4, 0x40($s0)
sw $s4, 0x44($s0)

bne $k0,$0, random#首次，进入random。bug：最开始没有对首次产生障碍做处理，导致无法持续传入障碍
lw $s4, 0x54($s0)#取右侧从0开始第5列
bne $0, $s4, random#不为0，进random
sw $0, 0x40($s0)#否则第0列为0
j nextstep

random:  #生成随机数
add $k0,$0,$0
lw $s5, 0($v0)
addi $v0, $v0, 4#bug：此处障碍的生成代码错误
addi $s7, $zero, 0xffffffff#一整列都是障碍
addi $s6, $zero, 0xff#洞的大小为8
sllv $s6, $s6, $s5#移动洞的位置
xor $s6, $s6, $s7#扣洞
sw $s6, 0x40($s0)#bug：之前少了这一行指令，未向对应位置传入新的障碍

nextstep:
addi $s4, $zero, 2
sllv $s4, $s4, $t1              #2**a 
srav $t0, $t0, $s4              #t0>>(2**a)
addi $t1, $t1, 1

bne $t0, $zero, nnextstep
addi $t0, $zero, 1

nnextstep:
lw $s4, 0x40($s0)
sw $s4, 0x00($s0)
lw $s4, 0x44($s0)
sw $s4, 0x04($s0)
lw $s4, 0x48($s0)
sw $s4, 0x08($s0)
lw $s4, 0x4c($s0)
sw $s4, 0x0c($s0)
lw $s4, 0x50($s0)
sw $s4, 0x10($s0)
lw $s4, 0x54($s0)
sw $s4, 0x14($s0)
lw $s4, 0x58($s0)
sw $s4, 0x18($s0)
lw $s4, 0x5c($s0)
sw $s4, 0x1c($s0)
lw $s4, 0x60($s0)
sw $s4, 0x20($s0)
lw $s4, 0x64($s0)
sw $s4, 0x24($s0)
lw $s4, 0x68($s0)
sw $s4, 0x28($s0)
lw $s4, 0x70($s0)
sw $s4, 0x30($s0)
lw $s4, 0x74($s0)
sw $s4, 0x34($s0)
lw $s4, 0x78($s0)
sw $s4, 0x38($s0)
lw $s4, 0x7c($s0)
sw $s4, 0x3c($s0)

lw $s4, 0x6c($s0)
or $s5, $s4, $t0#bug：最初使用XOR指令产生错误
beq $s4, $s5, error
sw $s5, 0x2c($s0)
sw $0, 0x240($s0)#用于统一刷新。bug：最开始没有进行统一刷新
j loop

error:
lw $s4, 0x80($s0)
sw $s4, 0x00($s0)
lw $s4, 0x84($s0)
sw $s4, 0x04($s0)
lw $s4, 0x88($s0)
sw $s4, 0x08($s0)
lw $s4, 0x8c($s0)
sw $s4, 0x0c($s0)
lw $s4, 0x90($s0)
sw $s4, 0x10($s0)
lw $s4, 0x94($s0)
sw $s4, 0x14($s0)
lw $s4, 0x98($s0)
sw $s4, 0x18($s0)
lw $s4, 0x9c($s0)
sw $s4, 0x1c($s0)
lw $s4, 0xa0($s0)
sw $s4, 0x20($s0)
lw $s4, 0xa4($s0)
sw $s4, 0x24($s0)
lw $s4, 0xa8($s0)
sw $s4, 0x28($s0)
lw $s4, 0xac($s0)
sw $s4, 0x2c($s0)
lw $s4, 0xb0($s0)
sw $s4, 0x30($s0)
lw $s4, 0xb4($s0)
sw $s4, 0x34($s0)
lw $s4, 0xb8($s0)
sw $s4, 0x38($s0)
lw $s4, 0xbc($s0)
sw $s4, 0x3c($s0)
sw $0, 0x240($s0)#用于统一刷新
addi $v0,$0,10
syscall

interupt:
sw $s4, 0($sp)
addi $sp, $sp, 4

sll $t0, $t0, 2
addi $s4, $zero, 1
bne $t0, $0, intloop
sll $t0, $s4, 31

intloop:
add $t1, $zero, $zero

lw $s4, 0x6c($s0)
or $s5, $s4, $t0
beq $s4, $s5, error
sw $s5, 0x2c($s0)#bug：之前中断没有对鸟的独立刷新，导致鸟移动的位置只能等下一次同一刷新才能看到，对玩家造成困难
sw $0, 0x244($s0)#用于刷新

addi $sp, $sp, -4#bug：之前把171、172两行放在164位置上，导致保存现场和还原现场被打乱。
lw $s4, 0($sp)
eret

