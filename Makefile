CCPREFIX=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi
CPP=$(CCPREFIX)-cpp
CC=$(CCPREFIX)-gcc
AS=$(CCPREFIX)-as

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world" > hello.txt

clean:
	rm -f main.i hello.txt

.PHONY: clean