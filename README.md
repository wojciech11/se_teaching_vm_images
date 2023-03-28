# Ubuntu VM for teaching Software Engineering and Testing

## Motivation

The VirtualBox provides a predictable development environment to run use [Ubuntu LTS](https://wiki.ubuntu.com/Releases) even if a university has Windows-based workstations.  

## Software

### Basics

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

### Whishlist:

- bash-it?
- sourcetree alternative - gitkraken
- soapui

## HowTo

Notice. For the tips on making ubuntu more performant, please check [oracle docs](https://blogs.oracle.com/scoter/post/oracle-vm-virtualbox-61-3d-acceleration-for-ubuntu-1804-and-2004-virtual-machines).

0. You need to have [Vagrant](https://www.vagrantup.com) installed

1. Create a ready to use Virtualmachine. You can customize its setup in [vagrant/ubuntu/Vagrantfile](vagrant/ubuntu/Vagrantfile). 

   ```bash
   vagrant plugin install vagrant-disksize
   make ubuntu_desktop_vagrant_up  
   ```

2. Stop the vagrant box

   ```bash
   make ubuntu_desktop_vagrant_halt
   ```

3. Copy the machine to google drive to share with students. When starting the box, please rememner to remove:

   - Virtulbox setting for the VM: mounting /vagrant in /etc/fstab 
   - disable the remote display

4. Get the saved VM as a vagrant box:

   ```bash
   make ubuntu_desktop_get_box
   ```

## Refereneces

- [Ubuntu Releases](https://wiki.ubuntu.com/Releases)
