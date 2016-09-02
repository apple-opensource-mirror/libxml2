##
# Makefile for libxml2
##

# Project info
Project               = libxml2
UserType              = Administrator
ToolType              = Libraries
Extra_Configure_Flags = --with-iconv=no --enable-static=no --with-python=no
Extra_LD_Flags        = -arch i386 -arch ppc
GnuAfterInstall       = strip

# It's a GNU Source project
include $(MAKEFILEPATH)/CoreOS/ReleaseControl/GNUSource.make

Install_Target = install-strip

strip:
	rm -f "$(DSTROOT)/usr/lib/libxml2.2.dylib" "$(DSTROOT)/usr/lib/libxml2.dylib"
	mv "$(DSTROOT)/usr/lib/libxml2.2.5.4.dylib" "$(DSTROOT)/usr/lib/libxml2.2.dylib"
	strip -x "$(DSTROOT)/usr/lib/libxml2.2.dylib"
	ln -sf libxml2.2.dylib "$(DSTROOT)/usr/lib/libxml2.dylib"
