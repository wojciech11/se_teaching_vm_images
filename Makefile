ubuntu_desktop_vagrant_up:
	cd vagrant/ubuntu && vagrant up

ubuntu_desktop_vagrant_halt:
	cd vagrant/ubuntu && vagrant halt

ubuntu_desktop_as_ovf:
	vboxmanage export tester-xubuntu16 \
	   -o build/tester-xubuntu16.ova

ubuntu_desktop_get_box:
	cd vagrant/ubuntu && vagrant package

ubuntu_convert_to_vhd:
	if [ ! -f build/tester-ubuntu-disk001.vmdk ]; then cd build && tar xvf tester-ubuntu.ova && cd .. ; fi;
	vboxmanage clonehd --format vhd build/tester-ubuntu-disk001.vmdk build/tester-ubuntu.vhd
