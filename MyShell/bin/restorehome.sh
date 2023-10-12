#! /bin/sh
#
# Make it convenient to restore last home
#


mountDirector='/mnt/theRoot'
lastID=$(sudo snapper --config home list | tail -1 | cut -d' ' -f1)

sudo btrfs subvolume snapshot $mountDirector/@home_snapshots/$lastID/snapshot $mountDirector/home_bak
echo 'Created a snapshot successfully!'
