CCPREFIX=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi
CPP=$(CCPREFIX)-cpp
CC=$(CCPREFIX)-gcc
AS=$(CCPREFIX)-as
LD=$(CCPREFIX)-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world" > hello.txt

clean:
	rm -f *.i *.s *.o firmware.elf hello.txt

all: firmware.elf

.PHONY: clean all
