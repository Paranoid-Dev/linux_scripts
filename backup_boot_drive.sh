#!/bin/bash

# save fstab
sudo rsync -qaHAXSx /mnt/backup_boot_drive/etc/fstab /tmp/fstab.backup

# backup
sudo rsync -qaHAXSx / /mnt/backup_boot_drive/
sudo rsync -qaHAXSx /boot/ /mnt/backup_boot_drive/boot/

# copy over fstab
sudo rsync -qaHAXSx /tmp/fstab.backup /mnt/backup_boot_drive/etc/fstab
sudo rm /tmp/fstab.backup

# install bootloader
sudo arch-chroot /mnt/backup_boot_drive/ /bin/bash -c "grub-install --target=x86_64-efi --bootloader-id=BACKUP --efi-directory=/boot"
sudo arch-chroot /mnt/backup_boot_drive/ /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
sudo rm -rf /mnt/backup_boot_drive/boot/EFI/GRUB
