# A Brief Introduction To OracleDB

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [A Brief Introduction To OracleDB](#a-brief-introduction-to-oracledb)
	- [OracleDB: What is it?](#oracledb-what-is-it)
	- [Files Located in this Repo](#files-located-in-this-repo)
		- [How to Connect](#how-to-connect)
		- [Client Side Tools](#client-side-tools)
	- [Background](#background)
		- [OracleDB RDBMS Architecture](#oracledb-rdbms-architecture)
	- [Exploring OracleDB](#exploring-oracledb)
		- [Database Structure](#database-structure)
		- [Queries](#queries)
		- [Creating a user Profile](#creating-a-user-profile)
	- [SQL/PLSQL](#sqlplsql)
		- [What is it?](#what-is-it)
		- [Example](#example)
	- [Resources](#resources)

<!-- /TOC -->
## OracleDB: What is it?

Oracle DB is widely used RDBMS(relational database managment system) used around the world. In this file we will aim to explain important aspects of Oracle DB as well a give people a chance to use and explore it.

## Files Located in this Repo
In this Repository there will be reference guides as well as development tools to be used for Oracle DB.

* _InstallationGuides/_: contains two guides on how to install Oracle DB on both a Windows and Linux Environment. These files contain more details about pre-requisites, specifications and how to's.

* _SQLDevTools/_: contains client side tools to connect to the instance our our Oracle database.

* _OracleRDBMSArchitecture.md_: contains an in-depth explanation behind the OracleDB Architecture as whole RDBMS.

* _DistinctFeaturesOfOracle.md_: explores two big aspects of OracleDB.

* _MariaDB_VS_OracleDB_


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
An advantage is that Oracle has so many tools that can interact with it, in this repostitory we are going to be only using the command tools of sqlplus and sql Cl but others include:

 * Oracle Enterprise Manager:

 * SqlPlus*

 * SQLcl:

 * SQL Developer:

## Background
OracleDB is an RDMBS that is very useful for retrieving data so that applications can manipulate it. Oracle Extends Object relational model  which means that it allows for such features such as user-defined types, inheritance and polymorphism. Oracle uses SQL (the structured query language) to interact with the database as well as PL/SQL that we will discuss later.

Read this link to get a quick overview of OracleDB [here]().

Below you will read more about the distinct features that OracleDB implements as well as the structure behind it.

### OracleDB RDBMS Architecture
The Oracle DB 12c release 2 Architecture is very unique in how it processes information as well the multiple processes it that need interaction to run the database.

A more in depth explanation can be found by reading this [file](OracleRDBMSArchitecture.md) found [()]

:fire: For a little more fun playing around with this fun interactive Oracle web app by clicking on _Database Architecture_ tab.

### Database Structure

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
> TODO
```

### Queries


##### Create Table 'Class'
```
CREATE TABLE Class(Grade TEXT,Name TEXT,Id INT);
```

##### Look at the contents of the table 'Class'
```
select * from Class;
```

##### Alter table 'Class'
```
ALTER TABLE Class ADD column_name;
```

##### Drop table 'Class'
```
DROP TABLE Class;
```

# SQL-PL/SQL

#### What is it?
 * PL/SQL is Oracle's extension of SQL. PL/SQL is a procedural language that includes elements such as conditions, loops, variables, functions, and etc.   

#### Why use it?
* Better performance - PL/SQL allows you to group SQL statements logically and send them as a block

![alt text]( https://github.com/UMM-CSci-4453-Fall-2017/final-project-twomonitorsonekeyboard/blob/master/images/plsql.png?raw=true"Title")

* If you enjoy using SQL and want to learn a super-set language of it.
* If you wanted to write a full program. (loops,variables, and etc.)
* Can initiate activity before or after a command. (Keeps track of history, repetitive data, and prevents certain operations from happening)
* Block Structure - Header, Declarative, Executable, Exception-handling

![alt text](https://docstore.mik.ua/orelly/oracle/prog2/figs/sql2.1502.gif "Logo Title Text 1")


## Java in Oracle
 ###### Overview of Java
 * The database provides Java programs with a dynamic data-processing engine. Client requests are assembled as data queries for fast processing. Query results are generated dynamically.

 ![alt text](https://docs.oracle.com/cd/E11882_01/server.112/e40540/img/cncpt236.gif "Title")


## Resources
[PL/SQL - Basic Syntax](https://www.tutorialspoint.com/plsql/plsql_basic_syntax.htm)

[PL/SQL - Data Types](https://www.tutorialspoint.com/plsql/plsql_data_types.htm)

[PL/SQL - Overview](https://www.tutorialspoint.com/plsql/plsql_overview.htm)
