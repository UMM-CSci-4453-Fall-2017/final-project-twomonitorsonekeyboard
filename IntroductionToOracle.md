# A Brief Introduction To OracleDB

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [A Brief Introduction To OracleDB](#a-brief-introduction-to-oracledb)
	- [OracleDB: What is it?](#oracledb-what-is-it)
	- [Files Located in this Repo](#files-located-in-this-repo)
		- [How to Connect](#how-to-connect)
		- [Client Side Tools](#client-side-tools)
	- [Background](#background)
		- [OracleDB RDBMS Architecture](#oracledb-rdbms-architecture)
		- [Database Structure](#database-structure)
		- [Local Users vs Common Users](#local-users-vs-common-users)
	- [Exploring OracleDB](#exploring-oracledb)
		- [Creating a User Profile](#creating-a-user-profile)
		- [Queries](#queries)
	- [SQL-PL/SQL](#sql-plsql)
		- [What is it?](#what-is-it)
		- [Why use it?](#why-use-it)
		- [Java in Oracle](#java-in-oracle)
	- [Resources](#resources)

<!-- /TOC -->
## OracleDB: What is it?

Oracle DB is widely used RDBMS(relational database managment system) used around the world. In this file we will aim to explain important aspects of Oracle DB as well a give people a chance to use and explore it.

## Files Located in this Repo
In this Repository there will be reference guides as well as development tools to be used for Oracle DB.

* _InstallationGuides/_ : contains two guides on how to install Oracle DB on both a Windows and Linux Environment. These files contain more details about pre-requisites, specifications and how to's.

* _SQLDevTools/_ : contains client side tools to connect to the instance our our Oracle database.

* _OracleRDBMSArchitecture.md_: contains an in-depth explanation behind the OracleDB Architecture as whole RDBMS.

* _DistinctFeaturesOfOracle.md_: explores two big aspects of OracleDB.

* _mariadbVSoracledb_: gives a brief over of the differences between what it sounds like.

* _DBASetUpGuide_: contains an explanation of what it took to set up the 'behind the scenes' of using our Oracle database.


### How to Connect

We installed Oracle DB on a lab computer, spacewhale, at the University of Minnesota Morris. To login you will need to have an account. You may also ssh into the machine using the following

``` bash
> ssh username@spacewhale.morris.umn.edu
username@spacewhale.morris.umn.edu password:
```
Once you are logged you need to set up some Environment variables before you use the tools to talk to the Oracle database.
First in the terminal run:
``` bash
> source SQLDevTools/setup.sh
```
This will set up all Oracle Settings that you need. Feel free to poke around in any of the files located in _SQLDevTools/_. Huzzah! Now you are free to use any of the script files to start talking to the Oracle Database. To do this run:

```bash
> ./SQLDevTools/sqlcl.sh

SQLcl: Release 12.2.0.1.0 RC on Sun Dec 10 18:02:34 2017

Copyright (c) 1982, 2017, Oracle.  All rights reserved.

SQL>
```

Note: Throughout this file we are going to be using the ***sqlcl.sh*** file but you are free to choose any other client side to interact with the database.

### Client Side Tools
An advantage is that Oracle has so many tools that can interact with it, in this repository we are going to be only using the command tools of SQLplus* and SQLcl but here is a brief overview of some of them:

 * _Oracle Enterprise Manager Express (EM Express)_: Web based application that runs and allows you to manage and manipulating the Oracle database and its subcontents(PDB content). One thing to note is the Oracle database must be up and open as you cannot start it from EM Express.
 It can be viewed on https://spacewhale.morris.umn.edu/em/5500
>:fire: This option can only be viewed locally or if the firewall is down.

 * _Sqlplus*_: is a command line interface that lets you interact with OracleDB. It is an older tool that has been very reliable... that being said there are so many new IDEs emerging that allow for easier UI manipulation of the database.

 * _SQLcl_: is a newish developed command line interface that allows for more flexibility than its parent SQLplus*.

 * _SQL Developer_: is a another GUI application that comes by default with installation of OracleDB. It supports both SQL and PL/SQL languages and provides a very clean UI for developing. A very cool development tool.

## Background
OracleDB is an RDMBS that is very useful for retrieving data so that applications can manipulate it. Oracle extends the Object relational model  which means that it allows for such features such as user-defined types, inheritance and polymorphism. Oracle uses SQL (the structured query language) to interact with the database as well as PL/SQL that we will discuss later.

Read this link to get a quick overview of OracleDB [here](https://docs.oracle.com/database/122/CNCPT/introduction-to-oracle-database.htm#CNCPT958).

Below you will read more about the distinct features that OracleDB implements as well as the structure behind it.

### OracleDB RDBMS Architecture
The Oracle DB 12c release 2 Architecture is very unique in how it processes information as well the multiple processes it that need interaction to run the database.

A more in depth explanation can be found by reading this [file](OracleRDBMSArchitecture.md).

:fire: For a little more fun play around with this fun interactive Oracle web app by clicking on _Database Architecture_ tab.

### Database Structure
Along with Oracle's Archtecture we will explore distinct feature and concepts that are unique to Oracle.

First you'll want to read [this](https://www.red-gate.com/simple-talk/sql/oracle/getting-started-with-oracle-database-12c-multitenant-architecture/) which will provide a nice overview or Multitenant Archecture.

Then you can continue by exploring the [Distinct Features of Oracle file](DistinctFeaturesOfOracle.md) to get more information on it.

### Local Users vs Common Users
Another important feature of OracleDB's Multitenant Architecture is that there can be two types of users.

* **Common Users**: These are users that exist in both the CDB(root) and all PDBs.
	* When creating this type of User it must be prefixed with "C##" or "c##"
	* The username chosen must be unique across all containers.


* **Local Users**: These are users that exist in only specific PDBs
	* Usernames can be the same across different PDBs but unique within their specific PDB;

You can read about users [here](https://docs.oracle.com/database/121/SQLRF/statements_8003.htm#SQLRF01503) if you want more background.

## Exploring OracleDB
Now that we have a little background regarding Oracle DB we are ready to dive in! We will begin by first exploring how an Oracle database would be run.

Before begginning we will want to check that all Environment variables are set we can do this by using the following. It will prompt you for the database name which in our case is **orcldb**

```bash
> . oraenv
ORACLE_SID = [orcldb] ? orcldb
The Oracle base remains unchanged with value /u01/app/carav008
```
You can open up your SQL dev software of your choice and follow along.

* We will want to connect to the user **MMK_ADMIN** on the **test** PDB. To connect enter the following.

``` bash
>./SQLDevTools/sqlcl.sh

SQLcl: Release 12.2.0.1.0 RC on Mon Dec 11 06:07:35 2017

Copyright (c) 1982, 2017, Oracle.  All rights reserved.


SQL> connect MMK_ADMIN@test
Password? (**********?) ***************
Connected.
SQL>
```
Note: You will be prompted for the password. Please see the current DB administrator for the password :grin:

> :exclamation: Pro-Tip: SQLcl and SQLplus* don't support formatting of tables very well. but if you run the command below it will help to view clearer tables.
```SQL
SQL> set sqlformat ansiconsole
```

Feel free to take a look around with the admin user try querying the default tables of Oracle like _all_users_, _all_tables_

``` SQL
SQL> select table_name, owner from all_tables order by owner, table_name;
*** output ***

SQL> select * from all_users;
*** output ***

```

### Creating a User Profile
Now were ready to create a user profile for yourself!
First make sure you're still in **MMK_ADMIN** and the **test** PDB by typing in
``` SQL
SQL> show user;
USER is "MMK_ADMIN"

SQL> show con_name;
CON_NAME
------------------------------
TEST
```
Now proceed by executing the following commands:

```SQL
> CREATE USER chooseUsername IDENTIFIED BY choosePassword ACCOUNT UNLOCK;
User chooseUsername created.
```
> :exclamation: Pro-Tip: Oracle's default is to make all usernames capitalized so if you want to make it specific you'll need to wrap it in " " BUT when you connect you need the " " as well.

Huzzah! Your user profile is now created but ... you won't be able to do much of anything since you don't have the sufficient privileges. You can't even log in. Go ahead try I'll wait ...

The thing with privileges especially in Oracle is you have to be careful with who gets to do what. You don't want someone who shouldn't be messing around in your database, well in your database. That's why in OracleDB  user roles exist. Oracle comes with default user roles or you can create your own roles. To learn more read about default roles here and why there so important [here]()

For now we will just adjust your privileges with:

```SQL
SQL> GRANT ALL PRIVILEGES TO username;
```

### Queries


**Create Table 'Class'**
The CREATE TABLE statement allows you to create and define a table
``` SQL
SQL> CREATE TABLE Class(Grade VARCHAR(2), Name VARCHAR(20), Id Number(10));
```

** Look at the contents of the table 'Class' **
You can get all the data from a table by using this simple statement

``` SQL
SQL> select * from Class;
```

**Insert into 'Class'**
The INSERT statement allows you to insert values into your table which you specify. Insert 4 rows with the specified information into table Class
``` SQL
INSERT INTO Class Values('Grade', 'Name', Id#);
```

**Alter table 'Class'**
The ALTER TABLE statement allows you to alter a table
``` SQL
SQL> ALTER TABLE Class ADD (column_name datatype);
```

**Create a Trigger called Keys**######
Creates a BEFORE statement trigger on table 'Class'. When a user tries to insert a database object, the database fires the trigger **after**  shows the message 'Inserting' after inserted. You can use the BEFORE statement which does a similar functionality. Play around after you create the trigger and try inserting a random row into table Class and see what you get
```SQL
SQL> CREATE TRIGGER Keys
AFTER INSERT ON Class
BEGIN
	CASE
		WHEN INSERTING THEN
		DBMS_OUTPUT.PUT_LINE('Inserted');
	END CASE;
END;
```

**Drop table 'Class'**
The DROP TABLE statement allows you to remove or delete a table from the Oracle database
``` SQL
SQL> DROP TABLE schema_name.table_name;
```
or
``` SQL
SQL> Drop TABLE Class;
```

## SQL-PL/SQL

### What is it?
 * PL/SQL is Oracle's extension of SQL. PL/SQL is a procedural language that includes elements such as conditions, loops, variables, functions, and etc.   

### Why use it?
* Better performance - PL/SQL allows you to group SQL statements logically and send them as a block

![alt text]( https://github.com/UMM-CSci-4453-Fall-2017/final-project-twomonitorsonekeyboard/blob/master/images/plsql.png?raw=true"Title")

* If you enjoy using SQL and want to learn a super-set language of it.
* If you wanted to write a full program. (loops,variables, and etc.)
* Can initiate activity before or after a command. (Keeps track of history, repetitive data, and prevents certain operations from happening)
* Block Structure - Header, Declarative, Executable, Exception-handling

![alt text](https://docstore.mik.ua/orelly/oracle/prog2/figs/sql2.1502.gif "Logo Title Text 1")


### Java in Oracle
 **Overview of Java**
 * The database provides Java programs with a dynamic data-processing engine. Client requests are assembled as data queries for fast processing. Query results are generated dynamically.

 ![alt text](https://docs.oracle.com/cd/E11882_01/server.112/e40540/img/cncpt236.gif "Title")


## Resources
[OracleDB 12c Concepts](https://docs.oracle.com/database/122/CNCPT/toc.htm): Concepts of OracleDB 12c

[OracleDB Developer Guide](https://docs.oracle.com/database/121/ADFNS/title.htm): Useful commands for when connected to OracleDB

[OracleDB Data Types](https://docs.oracle.com/database/121/SQLRF/sql_elements001.htm#SQLRF0021): Data types explained and which ones you can use

[PL/SQL - Basic Syntax](https://www.tutorialspoint.com/plsql/plsql_basic_syntax.htm): Syntax explained

[PL/SQL - Data Types](https://www.tutorialspoint.com/plsql/plsql_data_types.htm):  Data types used in PL/SQL

[PL/SQL - Overview](https://www.tutorialspoint.com/plsql/plsql_overview.htm): Brief Overview of PL/SQL
