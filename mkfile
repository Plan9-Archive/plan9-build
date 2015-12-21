HDAFILE = plan9.img 
CDROMFILE = plan9.iso

PARAMS = '-m 2G -drive file='$HDAFILE',media=disk,index=0,cache=writeback -vga std -net nic -net user,hostfwd=tcp:127.0.0.1:17567-:567,hostfwd=tcp:127.0.0.1:17010-:17010'
	
run:
	qemu-system-i386 $PARAMS

$CDROMFILE: 
	wget http://plan9.bell-labs.com/plan9/download/plan9.iso.bz2
	bunzip2 plan9.iso.bz2

create-disk: $HDAFILE
	qemu-img create -f raw $HDAFILE 8G

install-vanilla: download-iso create-disk
	qemu-system-i386 $PARAMS -cdrom $CDROMFILE

download-iso: $CDROMFILE
	echo "plan9 ISO downloaded"
