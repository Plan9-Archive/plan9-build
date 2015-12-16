HDAFILE = Plan9.img 
CDROMFILE = plan9.iso

PARAMS = '-drive file='$HDAFILE',media=disk,index=0,cache=writeback -vga std -net nic -net user'

run:
	qemu-system-i386 $PARAMS

create-disk:
	qemu-img create -f raw Plan9.img 8	G

download-iso:
	wget http://plan9.bell-labs.com/plan9/download/plan9.iso.bz2
	bunzip2 plan9.iso.bz2
