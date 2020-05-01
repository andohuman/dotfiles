#set the time zone
ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime

#sync with system clock
hwclock --systohc

#generate locales
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#generate hostname
echo "testmachine" >> /etc/hostname

#enable networking 
systemctl enable NetworkManager

#install and configure grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#pretty much installed everything important now you can exit
exit