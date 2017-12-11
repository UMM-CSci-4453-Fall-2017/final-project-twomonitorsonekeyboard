startup

shutdown

lsnrctl

connect sys as sysdba

open pdb
check status ---> explain syntax
con_name

created user like sysdba



user: MMK_ADMIN has the following privileges:
* created user like sysdba
* Can grant any privileges
* Can Create users,
* Can create a session to connect to CDB/PDB

privleges given


create pdb
```bash
> CREATE PLUGGABLE DATABASE test FROM ORCLPDB ;
```
open pdb in tnsnames.ora

role: common_users should be able to:
* create tables
*
