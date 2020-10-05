arm-linux-gnueabi-as hello.s -o hello.o
arm-linux-gnueabi-ld hello.o -o hello
qemu-arm hello
