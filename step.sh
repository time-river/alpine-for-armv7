https://wiki.debian.org/QemuUserEmulation

https://docs.kernel.org/admin-guide/binfmt-misc.html#:~:text=You%20can%20enable%2Fdisable%20binfmt_misc,current%20status%20of%20binfmt_misc%2Fthe_entry%20.

apt install binfmt-support qemu-user-static
update-binfmts --display
update-binfmts --enable qemu-arm

tar --xattrs-include='*.*' --numeric-owner
