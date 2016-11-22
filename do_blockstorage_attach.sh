    sudo parted /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 mklabel gpt
    sudo parted -a opt /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 mkpart primary ext4 0% 100%
    sudo mkfs.ext4 /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01-part1
    sudo mkdir -p /mnt/volume-nyc1-01-part1
    echo '/dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01-part1 /mnt/volume-nyc1-01-part1 ext4 defaults,nofail,discard 0 2' | sudo tee -a /etc/fstab
    sudo mount -a
