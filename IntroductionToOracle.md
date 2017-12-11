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

## Files Located in this Repo
### How to Connect

### Client Side Tools

## Background

### OracleDB RDBMS Architecture

## Exploring OracleDB

### Database Structure


# Queries

##### Creating a user Profile
```
CREATE USER name IDENTIFIED by password;
```

##### Grant Privilege
```
GRANT ANY PRIVILEGE TO name;
```

##### Look at all databases in the system:
```
show databases;
```

##### Create a Database 'test'
```
CREATE DATABASE test;
```

##### Change to the database 'test':
```
use test;
```

##### See what tables are in a database:
```
show tables;
```

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
