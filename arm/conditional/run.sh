#!/bin/bash
arm-linux-gnueabi-as conditional.s -o conditional.o && arm-linux-gnueabi-ld -o conditional conditional.o && qemu-arm conditional
