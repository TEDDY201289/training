### Install a virtual machine provider
The virtual machine provider is the software that actually creates and runs the virtual machines that we define with Vagrant.

### VMware Fusion for Apple Silicon (M1/M2/M3/M4 Macs)
* How to install VMware Fusion Pro for Personal Use:
    * Register for a [Broadcom Support Account](https://support.broadcom.com/web/ecx) and Log in.
    * Go to Software > VMware Cloud Foundation > My Downloads
    * Click `Free Software Downloads available HERE`.
    * Type `fusion` in Search Product Name.
    * Download the latest version of VMware Fusion (e.g: `13.6.4` as of July, 2025)

### Install Vagrant
* Download and install [Vagrant](https://developer.hashicorp.com/vagrant/install)
    * `https://releases.hashicorp.com/vagrant/2.3.7/vagrant_2.3.7_darwin_arm64.dmg`
* Verify after installation
```
$ vagrant version
Installed Version: 2.3.7
Latest Version: 2.4.7
```

### Apple Silicon (M1/M2/M3/M4 Macs) only: Install Vagrant plugins for VMWare provider
If you are on Apple Silicon (M1/M2/M3/M4 Macs), you will need to install the `VMWare Desktop` provider to allow you to use `VMWare Fusion` as your virtual machine backend (provider). You just need to download and install two things:

1. [Install Vagrant VMware Utility](https://developer.hashicorp.com/vagrant/install/vmware) must be installed.
    * `https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_darwin_arm64.dmg`
    * Note: After installing the Vagrant VMware Utility, the service will not be started until VMware Fusion has been installed. Once the service is started, Vagrant will be able to interact with the service via the Vagrant VMware Desktop plugin. To install the Vagrant VMware Desktop plugin into Vagrant run: `vagrant plugin install vagrant-vmware-desktop`
2. [Install Vagrant VMware Desktop Provider Plugin](https://developer.hashicorp.com/vagrant/docs/providers/vmware/installation)
```
$ vagrant plugin list
vagrant-vmware-desktop (3.0.5, global)
```
### Troubleshooting
* If you encounter the error below,
```
Vagrant encountered an unexpected communications error with the
Vagrant VMware Utility driver. Please try to run the command
again. If this error persists, please open a new issue at:

  https://github.com/hashicorp/vagrant-vmware-desktop/issues

Encountered error: Failed to open TCP connection to 127.0.0.1:9922 (Connection refused - connect(2) for "127.0.0.1" port 9922)
```

* [Solution Reference](https://github.com/hashicorp/vagrant-vmware-desktop/issues/104)
```
sudo launchctl unload -w /Library/LaunchDaemons/com.vagrant.vagrant-vmware-utility.plist
sudo launchctl load -w /Library/LaunchDaemons/com.vagrant.vagrant-vmware-utility.plist
```

### Create `Vagrantfile` and Run `ssh-keygen`
```
mkdir .ssh
cd .ssh
ssh-keygen
/Users/sai.linnthu/pov-vagrant/00-ubuntu-2404/.ssh/id_ed25519
```
## Make sure that you `disable mounting` of local directory into VM
```
config.vm.synced_folder '.', '/home/vagrant', disabled: true
```

### Before you run the next step, make sure you setup `~/.ssh/config` as below under your `$HOME`
```
$ cat ~/.ssh/config 

Host 192.168.56.88
  # IdentityFile should point to the *private key* of the public key specified
  # by PUBLIC_KEY_PATH in the Vagrantfile
  IdentityFile /Users/sai.linnthu/pov-vagrant/00-ubuntu-2404/.ssh/id_ed25519
  User vagrant
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
```

### Run `vagrant up`

### Test 1 - When you run `vagrant ssh`, you DO NOT need to type password

### Test 2 - When you access as `ssh vagrant@192.168.56.88`, you DO NOT need to type password

### When you access as `ssh 192.168.56.88`, you DO NOT need to type password
