ARMGNU ?= arm-none-eabi

BUILD = build/
SOURCE = src/
INCLUDE = include/
TARGET = kernel.img
LIST = kernel.list
MAP = kernel.map
LINKER = kernel.ld
PUBDIR = /media/sf_winshare

OBJS	:= $(patsubst $(SOURCE)%.s,$(BUILD)%.o,$(wildcard $(SOURCE)*.s))
OBJS	+= $(patsubst $(SOURCE)%.c,$(BUILD)%.o,$(wildcard $(SOURCE)*.c))

CFLAGS	:= -O2 -fpic -pedantic -pedantic-errors -Wall -Wextra
CFLAGS	+= -ffreestanding -fomit-frame-pointer -mcpu=arm1176jzf-s

all : $(TARGET) $(LIST)

pub	: all
	cp $(TARGET) $(PUBDIR)

$(LIST) : $(BUILD)output.elf
	$(ARMGNU)-objdump -d $(BUILD)output.elf > $(LIST)

$(TARGET) : $(BUILD)output.elf
	$(ARMGNU)-objcopy $(BUILD)output.elf -O binary $(TARGET)

$(BUILD)output.elf : $(OBJS) $(LINKER)
	$(ARMGNU)-ld --no-undefined $(OBJS) -Map $(MAP) -o $(BUILD)output.elf -T $(LINKER)

$(BUILD)%.o : $(SOURCE)%.s $(BUILD)
	$(ARMGNU)-as -I $(SOURCE) $< -o $@

$(BUILD)%.o : $(SOURCE)%.c $(BUILD)
	$(ARMGNU)-gcc -I $(INCLUDE) $(CFLAGS) -std=c99 -c $< -o $@

$(BUILD) :
	mkdir $@

clean :
	rm -rf $(BUILD)
	rm -f $(TARGET)
	rm -f $(LIST)
	rm -f $(MAP)
