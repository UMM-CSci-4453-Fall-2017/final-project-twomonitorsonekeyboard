# Database Administrator Setup Guide
This guide will include the process we took to create Pluggable databases, users, etc including any commands that are useful to a DBA.


<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Database Administrator Setup Guide](#database-administrator-setup-guide)
	- [Container Database(CDBs) manipulation](#container-databasecdbs-manipulation)
	- [Pluggable Databases(PDBs) manipulation](#pluggable-databasespdbs-manipulation)
	- [Creating a Local user](#creating-a-local-user)
	- [Resources](#resources)

<!-- /TOC -->

## Container Database(CDBs) manipulation

*Command to check what Oracle database is running on the current environent*
``` bash
> cat /etc/oratab
*** output ***

orcldb:/u01/app/carav008/product/12.2.0/dbhome_1:Y
```

* **orcldb** is our CDB so now we can login using the tools in  _SQLDevTools_ to log on to the Oracle database.

```bash
> ./SQLDevTools/sqlcl.sh

SQLcl: Release 12.2.0.1.0 RC on Mon Dec 11 23:41:57 2017

Copyright (c) 1982, 2017, Oracle.  All rights reserved.


SQL> connect sys as sysdba
Password? (**********?) **********
Connected.
SQL>

```
> :exclamation: We connect as user sys posing as sysdba or the System database administrator who can perform for the most part anyting.


*Now we are going show under what database sys is logged into. It will be the CDB. Check the status of the database by running the second query. Since we see that its open we will shut it down.*
``` SQL
SQL> show con_name;
CON_NAME
------------------------------
CDB$ROOT

SQL> select instance_name,status from gv$instance;

INSTANCE_NAME    STATUS      
---------------- ------------
orcldb           OPEN     
```

**Shutdown the CDB**

The database instance can be shutdown using the terms NORMAL, IMMEDIATE and ABORT. When Oracle crashes or didn't shutdown correctly you'll want to use ABORT to force close it.

``` SQL
SQL> SHUTDOWN NORMAL;
Database closed.
Database dismounted.
ORACLE instance shut down.
```


**Startup the CDB**

Starting up is as easy typing the following command:

```SQL
SQL> startup
ORACLE instance started.

Total System Global Area   5016387584 bytes      
Fixed Size                    8803072 bytes      
Variable Size              1191185664 bytes      
Database Buffers           3808428032 bytes      
Redo Buffers                  7970816 bytes      
Database mounted.
Database opened.

```
You can check the status of the CDB again using the query two steps above.


## Pluggable Databases(PDBs) manipulation

We will now switch into Pluggable databases and learn what is neccesary to make, start and other queries manipulating the PDB.

**Chekcing the Status of PDB**
To perform commands on PDBs the database must be open we can check this by
``` SQL
SQL> select name, open_mode from v$pdbs;
NAME      OPEN_MODE  
PDB$SEED  READ ONLY  
ORCLPDB   MOUNTED    
TEST      MOUNTED    
```
As we can see our PDBs consist of _PDB$SEED_,_ORCLPDB_ and _TEST_. They are MOUNTED which means that all files to recognize the data have been identified.

**Opening the PDB**
Only a user with the correct privileges can open PDBs, this is why you'll want to be logged in as _sysdba_ while manipulating databases.

*In the query below we will switch into the TEST PDB and we verify this by showing con_name*
```SQL
SQL> alter session set container = TEST;
Session altered.

SQL> show con_name;
CON_NAME
------------------------------
TEST
```


*Now this query will open the database and make it useable locally*
``` SQL
SQL> alter PLUGGABLE DATABASE OPEN;

Pluggable database OPEN altered.

```

**Creating a new PDB**
This section will walk through not only on how to create a new PDB but making that PDB visible to others listeners. Which means that we will have to use the _lsnrctl.sh_ file in _/SQLDevTools/_.


*First let us create a PDB from the SEEDPDB but we will need to be in CDB$ROOT to create any PDB*
```SQL
SQL> alter session set container = CDB$ROOT;
Session altered.

SQL> create pluggable database db admin user admin identified by password FILE_NAME_CONVERT = ('pdbseed', 'db');
Pluggable database DB created.
```
We have now created a database that the user 'admin' can connect to by using the password 'password' but... if we try connecting it wont work because the listener that we have open can't identify the new database we just made.

>This is because calling the command ```lsnrctl``` establishes a Oracle Net conncetion with listeners by resolving the listeners name from the _tnsnames.ora_ file. This file is located in _ORACLE_HOME/network/admin/_ where tnsnames.ora will contain the name of the PDB or CDB that should be open.

```bash
> cd $ORACLE_HOME/network/admin/
```

Now we need to add the following to our _tnsnames.ora_:
``` vim
db =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = spacewhale.morris.umn.edu)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = db123)
    )
  )
```

After adding this, you can now change databases and go into your newly made database.

```SQL
SQL> alter session set container = db;
Session altered.

SQL> alter PLUGGABLE DATABASE OPEN;
Pluggable database OPEN altered.

```

## Creating a Local user

The user MMK_ADMIN is a local user created by sys on sysdba.

user: MMK_ADMIN has the following privileges:
* Can grant any privileges
* Can create users on PDB
* Can create a session to connect to PDB

But sys is a common user who can create local users on any pdb so well want to create users via sys.

Alter the session so you are in the _db_ database and execute:

```SQL
SQL> CREATE USER username IDENTIFIED BY password account unlock;
User username created.
```

You will not be able to login so now we need to look at granting privileges.

**Privileges**
Granting privileges is easy, but in Oracle as the DBA you will need to know who gets privileges to what PDB or to the entire CDB;

*Here we will grant the privilege to create a session to the database db and then connect to it*

```SQL
SQL> GRANT CREATE SESSION TO username;
Grant succeeded.

SQL> connect username@db;
Password? (**********?) ****
Connected.

```
You will want to learn what privileges and actions each user should have. These are most of the commands we used as a DBA for our OracleDB.
## Resources
[Database Administration Guide](https://docs.oracle.com/database/122/ADMIN/basic-database-administration.htm#ADMIN12531)

[Granting Privileges](https://docs.oracle.com/database/121/SQLRF/statements_9014.htm#SQLRF01603)
