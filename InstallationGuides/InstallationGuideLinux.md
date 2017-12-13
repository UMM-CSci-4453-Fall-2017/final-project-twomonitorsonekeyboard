# Oracle DB Installation (Linux)
**This is a reference guide to installing as well as how we installed OracleDB on both a linux and Windows Environment. This document explores the Linux Environment**

### Prequisites:
* We needed root permission to lab computers when installing because of some files that need to be modified are in the _/etc/_ folder.
* We were granted sudo permission to modify these files
* Additonally the lab computers run Fedora 25


## Installation Process
You will want to navigate to the download page of OracleDB for Linux or you can follow this [link](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html). You will be prompted to login through Oracle.

We then used the File Explorer to extract it our home directory
### Setting up other necessary files

* You will need to modify the _/etc/hosts_ file and add the following ```<IP-address>  <fully-qualified-machine-name>  <machine-name>
```.
Our example uses sudo because we couldn't rewrite files otherwise.

```vim
ipaddress spacewhale.morris.umn.edu spacewhale

```

* We then added the following to our kernal parameters in our _/etc/sysctl.d/_ in a file we created called **98-oracle.conf**.

```vim
fs.file-max = 6815744
kernel.sem = 250 32000 100 128
kernel.shmmni = 4096
kernel.shmall = 1073741824
kernel.shmmax = 4398046511104
kernel.panic_on_oops = 1
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048576
net.ipv4.conf.all.rp_filter = 2
net.ipv4.conf.default.rp_filter = 2
fs.aio-max-nr = 1048576
net.ipv4.ip_local_port_range = 9000 65500
```
To reconfigure you current kernal parameters run:

```bash
/sbin/sysctl -p
```
* Now we will create a file called **oracle-database-server-12cR2-preinstall.conf** in our _/etc/security/limits.d/_ directory and input the following which is necessary for installation of Oracle on fedora.

* Stop and Disable the firewall. Check it status afterword

```bash
> systemctl stop firewalld
    ***output***

> systemctl disable firewalld
    ***output***

> systemctl status firewalld
    ***output***
```
> :exclamation: DONT FORGET TO ENABLE AND START IT AGAIN!!!

* Now we need to edit the **config** file in the _/etc/_ folder and set ```SELINUX=permissive```


***Needed Packages***

The following packages are needed for the Oracle Installation so we installed them, if they were already installed it would pass over it.

```vim
dnf groupinstall "MATE Desktop" -y
dnf groupinstall "Development Tools" -y
dnf groupinstall "Administration Tools" -y
dnf groupinstall "System Tools" -y
dnf install firefox -y
```

*  Add groups

```vim
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54323 oper
```
>:fire: Note when oracle is installed it will prompt you for directorys and files as to where it should be installed and will not let you continue if you have the wrong directory path.


* Edit your **.bash_profile** with the following so Oracle will know where to access your content. We had to ```unset CLASSPATH```
after words because it messes with the current file structure.

```bash
#These were my profile settings
TMP=/tmp
export TMP
TMPDIR=$TMP
export TMPDIR

ORACLE_HOSTNAME=spacewhale.morris.umn.edu
export ORACLE_HOSTNAME

ORACLE_UNQNAME=orcldb
export ORACLE_UNQNAME

ORACLE_BASE=/u01/app/carav008
export ORACLE_BASE


export ORACLE_HOME=$ORACLE_BASE/product/12.2.0/dbhome_1
export ORACLE_SID=orcldb

export PATH1=/usr/sbin:$PATH
export PATH2=$ORACLE_HOME/bin:$PATH1

export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/iib
export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib
```

* Lastly switch to where your Oracle contents was extracted to and run:

``` bash
> ./runInstaller
```

Huzzah! You will now be prompted to download OracleDB. You can igonre the warning about not having the correct Prequisite checks because we have now fixed this.

***The steps are very similar to that in the [Installation Guide for Windows](/InstallationGuides/InstallationGuideWindows.md) except for on steps where it will prompt you to run scripts.***

![](/InstallationGuides/images/Linux/Configuration.jpg)

*Screen you see after everything is installed*

![](/InstallationGuides/images/Linux/Finish.jpg)
