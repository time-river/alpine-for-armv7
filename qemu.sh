qemu-system-arm \
        -machine virt   \
        -cpu cortex-a7  \
        -smp 4  \
        -kernel vmlinuz-lts -initrd initramfs-lts       \
        -append "root=/dev/vda1 rootfstype=ext4 console=ttyAMA0 debug loglevel=8"       \
        -device virtio-blk-device,drive=vda \
        -drive if=none,file=vda.qcow2,format=qcow2,id=vda \
        -device virtio-net-device,netdev=net0 \
        -netdev bridge,id=net0,br=lxcbr0 \
        -device virtio-rng-device,rng=rng0 \
        -object rng-random,filename=/dev/urandom,id=rng0 \
        -device virtio-gpu-device       \
        -serial stdio   \
        -device virtio-serial-device,id=serial0 \
        -device virtserialport,bus=serial0.0,chardev=portchar0,name=qemu-portchar0      \
        -chardev file,path=/tmp/serial0.log,id=portchar0        \
        -display none

#        -append "root=/dev/vda1 rootfstype=ext4 console=ttyAMA0 debug loglevel=8"       \
