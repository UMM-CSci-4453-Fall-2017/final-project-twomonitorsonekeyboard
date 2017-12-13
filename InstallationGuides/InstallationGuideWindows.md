# Oracle DB Installation (Windows)
**This is a reference guide to installing as well as how we installed OracleDB on both a linux and Windows Environment. This document explores the Windows Environment**

## Installing on Windows Environment
### Prequisites:
* This instance of Oracle DB was installed on a laptop running Windows 10.
* Prequisite checks in terms of memory and storage were done easily through Oracle.
* You will need an account to download OracleDB but accounts are free you just need an email!

## Installation Process
You will want to navigate to the download page of OracleDB for Windows or you can follow this [link][download]. You will be prompted to login through Oracle.

After downloading the file you will need to extract the folder into your directory of your choice. Once extrated navigate to
_/database/setup.exe_ and click on it you will be prompted

>***Do you want to allow the following program to make changes to this computer?***

Respond yes and let the installation process begin.

### Step 1: Configure Security Updates

![](/InstallationGuides/images/Windows/WindowsStep1.JPG)

* Enter your _email_ and your _Oracle Support Password_.

Note troubles that occurred for us was that it didn't accept our email but registers you if you enter it incorrect 3 times.

### Step 2: Select Installation Option

![](/InstallationGuides/images/Windows/WindowsStep2.JPG)

* Select to make a new a database and have it configured.

### Step 3: Select System Class

![](/InstallationGuides/images/Windows/WindowsStep3.JPG)

* Since we were installing on a laptop we chose this option one but this changed on the linux environent.  


### Step 4: Oracle Home user

![](/InstallationGuides/images/Windows/WindowsStep4.JPG)

* Choose virtual account as recommended

### Step 5: Typical Install Configuration  

![](/InstallationGuides/images/Windows/WindowsStep5.JPG)

* This is where you will create where your instance of your database will be stored as well as choosing a Container database,a  Pluggable database, and its password.

### Step 6: Perform Prerequisite Checks

![](/InstallationGuides/images/Windows/WindowsStep6.JPG)

* This is where Oracle will run its checks to make sure you have enough space and memory for the database.

### Step 7: Summary

![](/InstallationGuides/images/Windows/WindowsStep7.JPG)

* Returns a sort of 'Receipt' of what just occurred, pre installation.
### Step 8: Install Product

![](/InstallationGuides/images/Windows/WindowsStep8pre.JPG)

### Step 9: Finish

![](/InstallationGuides/images/Windows/WindowsStep9.JPG)

**Huzzah! OracleDB has been installed. You can now click close and start exploring it using any client-side tool of your choice. Going to https://localhost:5500/em will route you to _Oracle Enterprise Manager Express (EM Express)_ but you will need to start the Database from an outside tool**









[download]: (http://www.oracle.com/technetwork/database/windows/downloads/index.html)
