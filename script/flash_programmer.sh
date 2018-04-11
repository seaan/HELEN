#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: C:\Users\smw0025\Documents\HELEN\QuartusPrime\HELEN.sof to: "..\flash/HELEN_flash.flash"
#
sof2flash --input="C:/Users/smw0025/Documents/HELEN/QuartusPrime/HELEN.sof" --output="../flash/HELEN_flash.flash" --epcs --verbose 

#
# Programming File: "..\flash/HELEN_flash.flash" To Device: flash
#
nios2-flash-programmer "../flash/HELEN_flash.flash" --base=0x4001000 --epcs --sidp=0x4002060 --id=0x0 --timestamp=1519590425 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

#
# Converting ELF File: C:\Users\smw0025\Documents\HELEN\QuartusPrime\software\nios\nios.elf to: "..\flash/nios_flash.flash"
#
elf2flash --input="C:/Users/smw0025/Documents/HELEN/QuartusPrime/software/nios/nios.elf" --output="../flash/nios_flash.flash" --epcs --after="../flash/HELEN_flash.flash" --verbose 

#
# Programming File: "..\flash/nios_flash.flash" To Device: flash
#
nios2-flash-programmer "../flash/nios_flash.flash" --base=0x4001000 --epcs --sidp=0x4002060 --id=0x0 --timestamp=1519590425 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

