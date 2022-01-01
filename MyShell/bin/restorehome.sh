#! /bin/sh
#
# Make it convenient to restore last home
#


mountDirector='/mnt/theRoot'
lastID=$(sudo snapper --config home list | tail -1 | cut -d' ' -f1)

sudo mount -o subvol=/ /dev/nvme0n1p2 $mountDirector
sudo btrfs subvolume snapshot $mountDirector/@home/.snapshots/$lastID/snapshot $mountDirector/home_bak
echo 'Created a snapshot successfully!'
