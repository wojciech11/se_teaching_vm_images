=============================================================
Virtual Machine for teaching Software Engineering and Testing
=============================================================

Motivation
==========

The VirtualBox provides a predictable development environment even
if a university has Windows-based workstations.

Supported Platforms
===================

- ubuntu16
- centos7

Standard Software
=================

Editors:

- atom

Development:

- docker-ce
- postman - run postman & in terminal
- Andorid Studio
- python3
- python3-pip
- gitg and gitk

Browsers:

- firefox
- chrome

Notice: Please use *docker* to deploy, e.g., Jenkins.

Next
====

Whishlist:

- sourcetree alternative - gitkraken
- better bash look&feel [centos] - consider to use bash-it
- soapui - 
- docker-compose -

HowTo
=====

0. Deps:

   - install Vagrant - https://www.vagrantup.com
   - install Packer - https://www.packer.io

1. Get boxcutters:

   ::

     make boxcutter_clone_ubuntu
     make boxcutter_apply_changes
     
     # stay ubuntu
     make boxcutter_apply_changes

   Change accordingly in Makefile:

   ::

     BOXCUTTER_TEMPLATE=ubuntu2004-desktop
     VAGRANT_IMAGE_NAME=tester-ubuntu20

2. Build base images:

   ::

     make ubuntu_desktop_build

3. Import the base imaage:

   ::

     make ubuntu_desktop_import

4. Run the images with vagrant to customize them:

   ::

     vagrant plugin install vagrant-disksize
     make ubuntu_desktop_vagrant_up

5. You can also customize the images manually

6. Stop the vagrant box

   ::

     make ubuntu_desktop_vagrant_halt

7. Get vagrant boxes:

   ::

     make ubuntu_desktop_get_box

8. Remove:

   - mounting /vagrant in /etc/fstab
   - disable remote display
