#!/bin/bash

Help_Sticky_Bit() {
	zenity  --text-info \
		--filename=help_sticky_bit.txt \
		--width=450 \
		--height=350 

}

Help_Chattr() {
	zenity 	--text-info \
		--filname=help_chattr.txt
		--width=450
		--height=350
}
