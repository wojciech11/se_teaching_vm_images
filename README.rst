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

2. Build base images:

   ::

     make ubuntu_desktop_build

   For ubuntu 18.04 desktop: You need manually click-through the installer (vagrant:vagrant), login, apt-get update/upgrade and install openssh-server.

3. Import the base imaage:

   ::

     make ubuntu_desktop_import

4. Run the images with vagrant to customize them:

   ::

     make ubuntu_desktop_vagrant_up

5. You can also customize the images manually

6. Stop the vagrant box

   ::

     make ubuntu_desktop_vagrant_halt

7. Get vagrant boxes:

   ::

     make ubuntu_desktop_get_box

8. Export the box as a OVF to the *build* directory:

   ::

     make ubuntu_desktop_as_ovf

9. Transform ova to vhd (for Hyper-V):

    ::

      make ubuntu_convert_to_vhd
