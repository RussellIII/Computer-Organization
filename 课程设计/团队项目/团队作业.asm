.text
START:
#��ʼ��

#��ʼλ��16
add $s0, $zero, $zero 
addi $s1, $zero, 1
addi $v0, $zero, 0xc0#bug����ַû��������λ
addi $k0, $0,1

sll $t0, $s1, 16
add $t1, $zero, $zero

loop:
add $s2, $zero, $zero #��ѭ������
addi $s3, $zero, 0
noploop:
addi $s2, $s2, 1
bne $s1, $s2, noploop #��ѭ��
# ��λ
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

bne $k0,$0, random#�״Σ�����random��bug���ʼû�ж��״β����ϰ������������޷����������ϰ�
lw $s4, 0x54($s0)#ȡ�Ҳ��0��ʼ��5��
bne $0, $s4, random#��Ϊ0����random
sw $0, 0x40($s0)#�����0��Ϊ0
j nextstep

random:  #���������
add $k0,$0,$0
lw $s5, 0($v0)
addi $v0, $v0, 4#bug���˴��ϰ������ɴ������
addi $s7, $zero, 0xffffffff#һ���ж����ϰ�
addi $s6, $zero, 0xff#���Ĵ�СΪ8
sllv $s6, $s6, $s5#�ƶ�����λ��
xor $s6, $s6, $s7#�۶�
sw $s6, 0x40($s0)#bug��֮ǰ������һ��ָ�δ���Ӧλ�ô����µ��ϰ�

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
or $s5, $s4, $t0#bug�����ʹ��XORָ���������
beq $s4, $s5, error
sw $s5, 0x2c($s0)
sw $0, 0x240($s0)#����ͳһˢ�¡�bug���ʼû�н���ͳһˢ��
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
sw $0, 0x240($s0)#����ͳһˢ��
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
sw $s5, 0x2c($s0)#bug��֮ǰ�ж�û�ж���Ķ���ˢ�£��������ƶ���λ��ֻ�ܵ���һ��ͬһˢ�²��ܿ�����������������
sw $0, 0x244($s0)#����ˢ��

addi $sp, $sp, -4#bug��֮ǰ��171��172���з���164λ���ϣ����±����ֳ��ͻ�ԭ�ֳ������ҡ�
lw $s4, 0($sp)
eret

