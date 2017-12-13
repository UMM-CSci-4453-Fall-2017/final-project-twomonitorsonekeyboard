# Oracle RDBMS Architecture

In this document we are going to explore the unique Architecture that makes up OracleDB. A quick note is that this document will explore OracleDbB version 12c release 2.

![Figure1](/images/Oracle12cArchitecture.png)
We will explore the some elements of the figure above.
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Oracle RDBMS Architecture](#oracle-rdbms-architecture)
	- [Taking apart the Diagram:](#taking-apart-the-diagram)
	- [The important bits.](#the-important-bits)
	- [Oracle processes overview:](#oracle-processes-overview)

<!-- /TOC -->


## Taking apart the Diagram:
  *The big red L*:
  This is the SGA it serves as a sort of brain for your Oracle
  databases. We go in to further detail below because this is the most important
  part of the Architecture of Oracle databases

  *Squares*: These represent Oracle processes. If the square is surrounded
  by a dotted line, it can run either as an OS process, or OS thread. If it is
  surrounded by a solid line it can only run as an OS process.

  *Cylinders*: These represent files.

## The important bits.
  Overview of the SGA:

  The **SGA(System Global Area)** along with Oracle background processes, form an Oracle
    database instance. Oracle processes running on the same computer share the same SGA.
    The SGA consists of several memory components known as "SGA components".
    These components contain data (such as cached data blocks and shared SQL areas)
    and they also control the information for its database instance.

The important SGA components:

**Database Buffer Cache**:
The database buffer cache, is the memory area that stores copies of data blocks from data files.
A buffer is a main memory address in which the buffer manager temporarily stores a recent or currently used data block.

A buffer could be one of 3 states:
  * _Unused_:
    The buffer us currently available to use, usually because it has never been used or is currently not being used. The easiest buffer to use.

  * _Cleaning_:
  This buffer was used earlier and now contains a read-consistent version of a block. The block contains data but it is "clean" so it does not need to be
 check pointed. The database can pin the block and reuse it.

  * _Dirty_:The buffer contains modified data that has not been written to the disk.The database must checkpoint it before it can reuse it.

> :exclamation: The Database Buffer Cache is further managed by separating it into three pools. These pools being: default pool, keep pool and recycle pool.



**In-memory Column Store (IM column store)**:

An optional, static SGA pool which stores copies of
tables and partitions in a special columnar format which is optimized for rapid scans. This format only exists in memory. The IM column store isn't supposed to replace
the Database Buffer Cache, it instead supplements it. This makes it so that both memory areas can store the same data in different formats.

There are many benefits for using the IM column store, these benefits include:
  * Performing fast full scans of large tables
  * Evaluating predicate filters that use operators like =, <. >, and IN
  * Querying a subset of columns in a table.
  * Accelerating joins by converting predicates on small dimension tables into filters on a large fact table

**Redo Log Buffer**:

A circular buffer in the SGA which stores "redo entries". These entries describe changes that have been applied to the database.

Database recovery applies "redo entries" to data files to reconstruct lost changes.

**Shared Pool**:

Caches various types of program data. For example it stores SQl, PL/SQl code,system parameters, and data dictionary information. This component is utilized in almost all operations that occurs in the database(i.e if a user executes an SQL statement, then the database accesses the shared pool).

**Large Pool** :

An optional memory area for use when memory allocations are more than the shared pool can take. By allocating memory from the large pool the database can avoid memory fragmentation problem when the database allocates memory from the shared pool.

**Java Pool**:

Stores all the sessions specific Java code and data within the JVM.

**Streams Pool**:
Used exclusively by Oracle Streams, this pool stores buffered queue messages and provides memory for Oracle Streams capture processes and apply processes.

**Fixed SGA**:

An internal housekeeping area. It contains things like general information about the state of the database and the instance, which the background processes need access to.

## Oracle processes overview:

A unit of execution that runs Oracle database code. In the multithreaded architecture, an Oracle process can either be an operating system process or a thread within an operating system process. Oracle processes can be divided into two
sub types: Background and Server processes.

Types of Oracle processes:

**Background Processes**:
Get created along with the database instance and performs maintenance tasks such as:
  * Performing instance recovery
  * Cleaning up processes
  * Writing redo buffers to disk
  * Maximize performance for multiple users

Mandatory Background Processes: Present in all typical types of database configurations. These processes run by default in any database instance. Here are some of the more important Mandatory Processes:
  * _PMON (Process Monitor Processes)_: Monitors other processes and performs process recovery when a server or dispatcher process terminates abnormally
  * _LREG (Listener Registration Process)_: Registers information about the database instance and dispatcher processes with the Oracle Net Listener
  * _SMON (System Monitor Process)_: In charge of a variety of system-level cleanup duties
  * _DBW (Database Writer Process)_:Writes the contents of database buffers to data files.
  * _LGWR (Log Writer Process)_: Manages the online redo log buffer.
  * _CKPT (Checkpoint Process)_: Updates the control file and data file headers with Checkpoint information and signals DBW to write blocks to disk
  * _RECO (Recoverer Process)_:Automatically resolves failures in distributes transactions.

**Optional Background Processes**:
Processes that aren't mandatory. Most Optional Background Processes are for specific tasks or features. Here are some common background processes:
  * _ARCn (Archiver Processes)_
  * _CJQ0 and JNNN (Job Queue Processes)_
  * _FBDA (Flashback Data Archive PRocess)_
  * _SMCO (Space Management Coordinator Process)_

**Server Processes**:
Oracle databases create these to run commands issued by the clients.These processes include:
  * Parsing and running SQL statements issued through the application,
  * Execute PL/SQL code
  * Read data blocks from data files into the database buffer cache
  * Return results in such a way that the application can process the information
