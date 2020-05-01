#Create and format paritions 

parted --script /dev/sda \
	mklabel gpt \
	mkpart primary fat32 1MiB 513MiB \
	set 1 boot on \
	mkpart primary linux-swap 513MiB 2.5GiB \
	mkpart primary ext4 2.5GiB 100%

mkfs.vfat -F32 /dev/sda1

mkswap /dev/sda2
swapon /dev/sda2

mkfs.ext4 /dev/sda3

#mount the root and efi partitions

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#download reflector and run it to get the fastest mirrors
pacman -Sy reflector --noconfirm
reflector --verbose -l 20 --sort rate --save /etc/pacman.d/mirrorlist

#bootstrap the required packages
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager

#generate file system table
genfstab -U /mnt >> /mnt/etc/fstab

#change root into the fresh installation to configure stuff
wget https://raw.githubusercontent.com/andohuman/dotfiles/master/arch_install/2_configure_chroot.sh
mv 2_configure_chroot.sh /mnt
arch-chroot /mnt chmod +x 2_configure_chroot.sh
arch-chroot /mnt ./2_configure_chroot.sh
rm /mnt/2_configure_chroot.sh

reboot
