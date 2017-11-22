IMAGE_UBUNTU=ubuntu1604-desktop
IMAGE_CENTOS=centos7-desktop

DEFAULT_USERNAME=tester
DEFAULT_PASSWORD=tester

VAGRANT_NAME_PREFIX=com.github/wojciech11

get_boxcutter_ubuntu:
	cd boxcutter && git clone https://github.com/boxcutter/ubuntu
	
get_boxcutter_centos:
	cd boxcutter && git clone https://github.com/boxcutter/centos

centos_desktop_build:
	UPDATE=true && \
	cd boxcutter/centos && \
	bin/box build $(IMAGE_CENTOS) virtualbox ; \
	ls box/virtualbox/

ubuntu_desktop_build:
	UPDATE=true && \
	cd boxcutter/ubuntu && \
	bin/box build $(IMAGE_UBUNTU) virtualbox ; \
	ls box/virtualbox

centos_desktop_import:
	vagrant box add boxcutter/centos/box/virtualbox/$(IMAGE_CENTOS)*.box --name $(VAGRANT_NAME_PREFIX)/tester-centos

ubuntu_desktop_import:
	vagrant box add boxcutter/ubuntu/box/virtualbox/$(IMAGE_UBUNTU)*.box --name $(VAGRANT_NAME_PREFIX)/tester-ubuntu

ubuntu_desktop_vagrant_up:
	cd vagrant/ubuntu && vagrant up

centos_desktop_vagrant_up:
	cd vagrant/centos && vagrant up

ubuntu_desktop_vagrant_halt:
	cd vagrant/ubuntu && vagrant halt

centos_desktop_vagrant_halt:
	cd vagrant/centos && vagrant halt

ubuntu_desktop_as_ovf:
	vboxmanage export tester-ubuntu \
	   -o build/tester-ubuntu.ova

centos_desktop_as_ovf:
	vboxmanage export tester-centos \
	   -o build/tester-centos.ova

ubuntu_convert_to_vhd:
	if [ ! -f build/tester-ubuntu-disk001.vmdk ]; then cd build && tar xvf tester-ubuntu.ova && cd .. ; fi;
	#vboxmanage clonehd --format vhd build/tester-ubuntu-disk001.vmdk build/tester-ubuntu.vhd

centos_convert_to_vhd:
	if [ ! -f build/tester-centos-disk001.vmdk ]; then cd build && tar xvf tester-centos.ova && cd .. ; fi;
	vboxmanage clonehd --format vhd build/tester-centos-disk001.vmdk build/tester-centos.vhd
