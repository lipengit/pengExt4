#
# Makefile for the linux ext4-filesystem routines.
#

#obj-$(CONFIG_EXT4_FS) += ext4.o

#ext4-y	:= balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o \
#		extents_status.o file.o fsmap.o fsync.o hash.o ialloc.o \
#		indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o \
#		mmp.o move_extent.o namei.o page-io.o readpage.o resize.o \
#		super.o symlink.o sysfs.o xattr.o xattr_trusted.o xattr_user.o

#ext4-$(CONFIG_EXT4_FS_POSIX_ACL)	+= acl.o
#ext4-$(CONFIG_EXT4_FS_SECURITY)		+= xattr_security.o

#above are the original Makefile

ifneq ($(KERNELRELEASE),)
obj-m := pengExt4.o
pengExt4-objs := balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o \
		extents_status.o file.o fsmap.o fsync.o hash.o ialloc.o \
		indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o \
		mmp.o move_extent.o namei.o page-io.o readpage.o resize.o \
		super.o symlink.o sysfs.o xattr.o xattr_trusted.o xattr_user.o

CFLAGS_balloc.o := -DDEBUG
CFLAGS_dir.o := -DDEBUG
CFLAGS_file.o := -DDEBUG
CFLAGS_ialloc.o := -DDEBUG	
CFLAGS_inode.o := -DDEBUG
CFLAGS_ioctl.o := -DDEBUG	
CFLAGS_namei.o := -DDEBUG
CFLAGS_super.o := -DDEBUG
CFLAGS_symlink.o := -DDEBUG

pengExt4-$(CONFIG_EXT4_FS_POSIX_ACL)	+= acl.o
pengExt4-$(CONFIG_EXT4_FS_SECURITY)	+= xattr_security.o

else
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
endif
