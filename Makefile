DEFAULT_USERNAME=tester
DEFAULT_PASSWORD=tester

BOXCUTTER_PATH=boxcutter/ubuntu
# ubuntu1604-desktop
BOXCUTTER_TEMPLATE=ubuntu2004-desktop

VAGRANT_IMAGE_PREFIX=com.github/wojciech11

VAGRANT_IMAGE_NAME=tester-ubuntu20

boxcutter_clone_ubuntu:
	cd boxcutter && \
	rm -rf ubuntu && \
	git clone https://github.com/boxcutter/ubuntu

boxcutter_apply_changes:
	cp -R boxcutter-ubuntu/ubuntu/* $(BOXCUTTER_PATH)

ubuntu_desktop_build:
	UPDATE=true && \
	cd $(BOXCUTTER_PATH) && \
	bin/box build $(BOXCUTTER_TEMPLATE) virtualbox ; \
	ls box/virtualbox

ubuntu_desktop_import:
	vagrant box add \
		boxcutter/ubuntu/box/virtualbox/$(BOXCUTTER_TEMPLATE)*.box \
		--name $(VAGRANT_IMAGE_PREFIX)/$(VAGRANT_IMAGE_NAME) \
	    --force

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
