## PIETOS

A small os based upon [this wonderful text book](http://littleosbook.github.io/#first-steps "It's really great").

Mainly for fun, eventually for profit.

I will attempt to document my process and any complications I come across.



##HackLog
----

For one, I am running on ARCH so the initial install instruction will need to be modified

build-essential should be on your arch system but it is in base-devel if its not.

nasm and bochs installed without pain, genisoimage is in cdrkit package.

Thusly, the update install instruction should be as follows:

```
pacman -S base-devel nasm bochs cdrkit
```

I tried to modify the magic number constance to 0xDEADB33F but got an error, so 0x1BADB33F was used.

running ```nasm -f elf32 loader.s``` compiled loader.s without a problem.

Establishing the linker consistently threw an error, the link.ld file needed some modifications
An updated version can be seen in the source

the intial kernel was linked with the following command

```
ld -T link.ld -melf_i386 loader.o -o kernel.elf
```

After getting the kernel file the following steps went rather smoothly.

bochs was configured with a configuration file (bochsrc.txt) then run with the following command.

```
bochs -f bochsrc.txt -q
```

This opens a window and terminal dialogue. typing c into the shell starts GRUB up. I had some issues with the listed loader.s file and modifications were necessary. Namely GRUB didn't recognize the executable as a valid file. Thus some flags and altering of the checksum was needed. After this the kernel was loaded and deadb33f was dropped in the eax register.


Now I can move on to getting C set up.
