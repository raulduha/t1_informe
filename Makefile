K=kernel
U=user

OBJS = \
	$K/bio.o\
	$K/console.o\
	$K/exec.o\
	$K/file.o\
	$K/fs.o\
	$K/ide.o\
	$K/ioapic.o\
	$K/kalloc.o\
	$K/kbd.o\
	$K/lapic.o\
	$K/log.o\
	$K/main.o\
	$K/mp.o\
	$K/picirq.o\
	$K/pipe.o\
	$K/proc.o\
	$K/sleeplock.o\
	$K/spinlock.o\
	$K/string.o\
	$K/swtch.o\
	$K/syscall.o\
	$K/sysfile.o\
	$K/sysproc.o\
	$K/trapasm.o\
	$K/trap.o\
	$K/uart.o\
	$K/vectors.o\
	$K/vm.o\
	$K/rand.o\

# Cross-compiling (e.g., on Mac OS X)
# TOOLPREFIX = i386-jos-elf
# TOOLPREFIX = i386-elf-

# Using native tools (e.g., on X86 Linux)
TOOLPREFIX = 

# Try to infer the correct TOOLPREFIX if not set
ifndef TOOLPREFIX
TOOLPREFIX := $(shell if i386-jos-elf-objdump -i 2>&1 | grep '^elf32-i386$$' >/dev/null 2>&1; \
	then echo 'i386-jos-elf-'; \
	elif objdump -i 2>&1 | grep 'elf32-i386' >/dev/null 2>&1; \
	then echo ''; \
	else echo "***" 1>&2; \
	echo "*** Error: Couldn't find an i386-*-elf version of GCC/binutils." 1>&2; \
	echo "*** Is the directory with i386-jos-elf-gcc in your PATH?" 1>&2; \
	echo "*** If your i386-*-elf toolchain is installed with a command" 1>&2; \
	echo "*** prefix other than 'i386-jos-elf-', set your TOOLPREFIX" 1>&2; \
	echo "*** environment variable to that prefix and run 'make' again." 1>&2; \
	echo "*** To turn off this error, run 'gmake TOOLPREFIX= ...'." 1>&2; \
	echo "***" 1>&2; exit 1; fi)
endif

# If the makefile can't find QEMU, specify its path here
# QEMU = qemu-system-i386

# Try to infer the correct QEMU
ifndef QEMU
QEMU = $(shell if which qemu > /dev/null; \
	then echo qemu; exit; \
	elif which qemu-system-i386 > /dev/null; \
	then echo qemu-system-i386; exit; \
	elif which qemu-system-x86_64 > /dev/null; \
	then echo qemu-system-x86_64; exit; \
	else \
	qemu=/Applications/Q.app/Contents/MacOS/i386-softmmu.app/Contents/MacOS/i386-softmmu; \
	if test -x $$qemu; then echo $$qemu; exit; fi; fi; \
	echo "***" 1>&2; \
	echo "*** Error: Couldn't find a working QEMU executable." 1>&2; \
	echo "*** Is the directory containing the qemu binary in your PATH" 1>&2; \
	echo "*** or have you tried setting the QEMU variable in Makefile?" 1>&2; \
	echo "***" 1>&2; exit 1)
endif

CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump
CFLAGS = -I./kernel -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -fno-omit-frame-pointer #-Werror
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
ASFLAGS = -I./kernel -m32 -gdwarf-2 -Wa,-divide 
# FreeBSD ld wants ``elf_i386_fbsd''
LDFLAGS += -m $(shell $(LD) -V | grep elf_i386 2>/dev/null | head -n 1)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

$K/xv6.img: $K/bootblock $K/kernel
	dd if=/dev/zero of=$K/xv6.img count=10000
	dd if=$K/bootblock of=$K/xv6.img conv=notrunc
	dd if=$K/kernel of=$K/xv6.img seek=1 conv=notrunc

$K/xv6memfs.img: $K/bootblock $K/kernelmemfs
	dd if=/dev/zero of=$K/xv6memfs.img count=10000
	dd if=$K/bootblock of=$K/xv6memfs.img conv=notrunc
	dd if=$K/kernelmemfs of=$K/xv6memfs.img seek=1 conv=notrunc

$K/bootblock: $K/bootasm.S $K/bootmain.c
	$(CC) $(CFLAGS) -fno-pic -O -nostdinc -I. -I$K -c $K/bootmain.c -o $K/bootmain.o
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -I$K -c $K/bootasm.S -o $K/bootasm.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o $K/bootblock.o $K/bootasm.o $K/bootmain.o
	$(OBJDUMP) -S $K/bootblock.o > $K/bootblock.asm
	$(OBJCOPY) -S -O binary -j .text $K/bootblock.o $K/bootblock
	$K/sign.pl $K/bootblock

entryother: $K/entryother.S
	$(CC) $(CFLAGS) -fno-pic -nostdinc -I. -I$K -c $K/entryother.S -o $K/entryother.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7000 -o $K/bootblockother.o $K/entryother.o
	$(OBJCOPY) -S -O binary -j .text $K/bootblockother.o entryother
	$(OBJDUMP) -S $K/bootblockother.o > $K/entryother.asm

initcode: $U/initcode.S
	$(CC) $(CFLAGS) -nostdinc -I. -I$K -c $U/initcode.S -o $U/initcode.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0 -o $U/initcode.out $U/initcode.o
	$(OBJCOPY) -S -O binary $U/initcode.out initcode
	$(OBJDUMP) -S $U/initcode.o > $U/initcode.asm

$K/kernel: $(OBJS) $K/entry.o entryother initcode $K/kernel.ld
	$(LD) $(LDFLAGS) -T $K/kernel.ld -o $K/kernel $K/entry.o $(OBJS) -b binary initcode entryother 
	$(OBJDUMP) -S $K/kernel > $K/kernel.asm
	$(OBJDUMP) -t $K/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $K/kernel.sym

# kernelmemfs is a copy of kernel that maintains the
# disk image in memory instead of writing to a disk.
# This is not so useful for testing persistent storage or
# exploring disk buffering implementations, but it is
# great for testing the kernel on real hardware without
# needing a scratch disk.
MEMFSOBJS = $(filter-out $K/ide.o,$(OBJS)) $K/memide.o
$K/kernelmemfs: $(MEMFSOBJS) $K/entry.o entryother initcode $K/kernel.ld $U/fs.img
	$(LD) $(LDFLAGS) -T $K/kernel.ld -b binary initcode entryother $U/fs.img -o $K/kernelmemfs $K/entry.o  $(MEMFSOBJS)
	$(OBJDUMP) -S $K/kernelmemfs > $K/kernelmemfs.asm
	$(OBJDUMP) -t $K/kernelmemfs | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $K/kernelmemfs.sym

tags: $(OBJS) entryother.S _init
	etags *.S *.c

$K/vectors.S: $K/vectors.pl
	$K/vectors.pl > $K/vectors.S

ULIB = $U/ulib.o $K/usys.o $U/printf.o $U/umalloc.o

_%: %.o $(ULIB)
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > $*.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $*.sym

$U/_forktest: $U/forktest.o $(ULIB)
	# forktest has less library code linked in - needs to be small
	# in order to be able to max out the proc table.
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $U/_forktest $U/forktest.o $U/ulib.o $K/usys.o
	$(OBJDUMP) -S $U/_forktest > $U/forktest.asm

mkfs/mkfs: mkfs/mkfs.c $K/fs.h
	gcc -Werror -Wall -o mkfs/mkfs mkfs/mkfs.c

# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: %.o

UPROGS=\
	$U/_cat\
	$U/_echo\
	$U/_forktest\
	$U/_grep\
	$U/_init\
	$U/_kill\
	$U/_ln\
	$U/_ls\
	$U/_mkdir\
	$U/_rm\
	$U/_sh\
	$U/_stressfs\
	$U/_usertests\
	$U/_wc\
	$U/_zombie\
	$U/_testsh\
	$U/_nsh\


$U/fs.img: mkfs/mkfs README $(UPROGS)
	mkfs/mkfs $U/fs.img README $(UPROGS)

-include *.d

clean: 
	rm -f *.tex *.dvi *.idx *.aux *.log *.ind *.ilg \
	$K/*.o $U/*.o $K/*.d $U/*.d $K/*.d $U/*.d $K/*.asm $U/*.asm \
	$K/*.sym $U/*.sym $K/vectors.S $K/bootblock entryother \
	initcode $U/initcode.out $K/kernel $K/xv6.img $U/fs.img $K/kernelmemfs \
	$K/xv6memfs.img mkfs/mkfs .gdbinit \
	$(UPROGS)

# make a printout
FILES = $(shell grep -v '^\#' $K/runoff.list)
PRINT = $K/runoff.list $K/runoff.spec README $K/toc.hdr $K/toc.ftr $(FILES)

xv6.pdf: $(PRINT)
	$K/runoff
	ls -l xv6.pdf

print: xv6.pdf

# run in emulators

bochs : $U/fs.img $K/xv6.img
	if [ ! -e .bochsrc ]; then ln -s dot-bochsrc .bochsrc; fi
	bochs -q

# try to generate a unique GDB port
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
# QEMU's gdb stub command line changed in 0.11
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)
ifndef CPUS
CPUS := 2
:i
endif
QEMUOPTS = -drive file=$U/fs.img,index=1,media=disk,format=raw -drive file=$K/xv6.img,index=0,media=disk,format=raw -smp $(CPUS) -m 512 $(QEMUEXTRA)

qemu: $U/fs.img $K/xv6.img
	$(QEMU) -serial mon:stdio $(QEMUOPTS)

qemu-memfs: $K/xv6memfs.img
	$(QEMU) -drive file=$K/xv6memfs.img,index=0,media=disk,format=raw -smp $(CPUS) -m 256

qemu-nox: $U/fs.img $K/xv6.img
	$(QEMU) -nographic $(QEMUOPTS)

.gdbinit: .gdbinit.tmpl
	sed "s/localhost:1234/localhost:$(GDBPORT)/" < $^ > $@

qemu-gdb: $U/fs.img $K/xv6.img .gdbinit
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -serial mon:stdio $(QEMUOPTS) -S $(QEMUGDB)

qemu-nox-gdb: $U/fs.img $K/xv6.img .gdbinit
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -nographic $(QEMUOPTS) -S $(QEMUGDB)

# CUT HERE
# prepare dist for students
# after running make dist, probably want to
# rename it to rev0 or rev1 or so on and then
# check in that version.

EXTRA=\
	mkfs.c ulib.c user.h cat.c echo.c forktest.c grep.c kill.c\
	ln.c ls.c mkdir.c rm.c stressfs.c usertests.c wc.c zombie.c\
	printf.c umalloc.c\
	README dot-bochsrc *.pl toc.* runoff runoff1 runoff.list\
	.gdbinit.tmpl gdbutil\

dist:
	rm -rf dist
	mkdir dist
	for i in $(FILES); \
	do \
		grep -v PAGEBREAK $$i >dist/$$i; \
	done
	sed '/CUT HERE/,$$d' Makefile >dist/Makefile
	echo >dist/runoff.spec
	cp $(EXTRA) dist

dist-test:
	rm -rf dist
	make dist
	rm -rf dist-test
	mkdir dist-test
	cp dist/* dist-test
	cd dist-test; $(MAKE) print
	cd dist-test; $(MAKE) bochs || true
	cd dist-test; $(MAKE) qemu

# update this rule (change rev#) when it is time to
# make a new revision.
tar:
	rm -rf /tmp/xv6
	mkdir -p /tmp/xv6
	cp dist/* dist/.gdbinit.tmpl /tmp/xv6
	(cd /tmp; tar cf - xv6) | gzip >xv6-rev10.tar.gz  # the next one will be 10 (9/17)

.PHONY: dist-test dist
