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
- python2
- python2-pip
- openjdk1.8

Browsers:

- firefox
- chrome

Notice: Please use *docker* to deploy, e.g., Jenkins.

Next
====

Whishlist:

- sourcetree alternative - gitg or gitkraken or git-cola
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

     make get_boxcutter_centos
     make get_boxcutter_ubuntu

2. Build base images:

   ::

     make centos_desktop_build
     make ubuntu_desktop_build

3. Run the images with vagrant to customize them:

   ::

     make centos_desktop_vagrant_up
     make ubuntu_desktop_vagrant_up

4. You can also customize the images manually

5. Stop the vagrant box

   ::

     make centos_desktop_vagrant_halt
     make ubuntu_desktop_vagrant_halt

6. Export the box as a OVF to the *build* directory:

   ::

     make centos_desktop_as_ovf
     make ubuntu_desktop_as_ovf
