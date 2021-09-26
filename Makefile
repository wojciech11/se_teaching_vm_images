ubuntu_desktop_vagrant_up:
	cd vagrant/ubuntu && vagrant up

ubuntu_desktop_vagrant_halt:
	cd vagrant/ubuntu && vagrant halt

ubuntu_desktop_as_ovf:
	vboxmanage export tester-ubuntu20 \
	   -o build/tester-ubuntu2004.ova

ubuntu_desktop_get_box:
	cd vagrant/ubuntu && vagrant package
