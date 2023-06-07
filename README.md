# Webserver Ansible
This project aims to automate the creation and configuration of two virtual machines using Vagrant.
The machines are based on the CentOS 7 image. Then, Ansible is used to provision the virtual machines by installing Node.js, npm, PM2, Git, and cloning a GitHub repository.
Additionally, a network port is opened, and the application is exposed using PM2.

## Steps

> Creating the virtual machines:

We use Vagrant to create two virtual machines, web1 and web2. These machines are based on the CentOS 7 image and have private IP addresses. The "web1" machine is accessible on port 8082, and the "web2" machine is accessible on port 8081.

> Software provisioning with Ansible:

After the virtual machines are created, we use Ansible to provision them. Ansible performs a series of tasks on all virtual machines defined in the inventory. The tasks include:

- Removal of a NodeSource installation script if it exists.
- Downloading a NodeSource installation script.
- Running the NodeSource installation script to install Node.js and npm.
- Installing PM2 globally using npm.
- Installing Git.
- Cloning a GitHub repository.
- Opening port 8080 in the firewall.
- Exposing the cloned application using PM2 on port 8080.

> Configuration of authentication keys:

The "provision.sh" file contains an SSH public key that is added to the "authorized_keys" file of the "vagrant" user on the virtual machines.
This enables passwordless SSH authentication between the host machine and the virtual machines.

## How to use

First, clone the repository using the following command:
```sh
git clone https://github.com/Devilicht/Webserver-Ansible
```
You need to have an SSH public key in your operating system. If you don't have one, you can generate it with the following command:
```sh
ssh-keygen
```
Once you have an SSH key, you need to add it to a .env file in the root of the project. Usually, the key will be created at path=~/.ssh/id_rsa.pub.
To have the files in your directory, you then need to "bring up" the virtual machines with the command:
```sh
vagrant up
```
After the machines are "up," you can run the playbook with the command:
```sh
ansible-playbook config-static-server.yaml
```
You can now send a GET request to the IP addresses of the machines with port 8080.
