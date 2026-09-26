# LAMP Stack Deployment with Vagrant

## Overview
This project automates the creation of a virtualized LAMP stack (Linux, Apache, MariaDB, and PHP) using Vagrant and VirtualBox. It provides a reproducible development environment based on a 64-bit Debian Bookworm image, utilizing modular shell scripts for system provisioning.

## Project Structure
* `Vagrantfile`: The main configuration file that defines the virtual machine, sets up port forwarding (host 8080 to guest 80), and links the provisioning scripts.
* `scripts/01_install_packages.sh`: Updates the repository index and installs the core LAMP components (Apache2, MariaDB, PHP) non-interactively.
* `scripts/02_configure_lamp.sh`: Configures directory permissions, copies the test PHP file to the web root, and enables the Apache and MariaDB services.
* `files/info.php`: A standard PHP test page to verify the environment setup.

## Commands Used & Workflow

### 1. Launching the Virtual Machine
To initialize the environment, download the Debian box, configure networking, and execute the installation scripts automatically, run:
`vagrant up`

### 2. Selective Provisioning
If changes are made to the configuration scripts, you can apply them without destroying or rebuilding the entire VM:
`vagrant provision`

Or to run a specific provisioning block:
`vagrant provision --provision-with configure_lamp`

### 3. Testing the Setup
Once the VM is running and provisioned, open a web browser and navigate to:
`http://localhost:8080/test.php`

This will display the standard PHP information page, confirming that Apache is serving PHP files through the forwarded port.

### 4. VM Management and Access
To access the virtual machine's terminal via SSH for administrative tasks:
`vagrant ssh`

To safely shut down and suspend the virtual machine state:
`vagrant halt`

To completely delete the virtual machine and free up system resources:
`vagrant destroy`
