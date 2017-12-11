# MariaDB vs. OracleDB
## Advantages of MariaDB
* Open Source

## Advantages of OracleDB
* Supports grid computing
* Robust security compared to MariaDB
* Pooling allows companies with a large number of components to really take advantage of them
## Technical differences
### Datatypes unique to each system
#### Maraidb
* TEXT
* INT,TINYINT,SMALLINT,BIGINT
* FLOAT (BINARY_FLOAT in oracle)
* DATE
* TIME
#### Oracledb
* FLOAT(p) where p is number of binary digits
* NUMBER(p,s), similar to decimal(p,s) in mariadb
* BINARY_FLOAT (FLOAT in mariadb)
* INTERVAL YEAR (y) TO MONTH or INTERVAL DAY (d) TO SECOND (fs)
* CLOB (Character large object)
### Datatypes comparison
| OracleDB | MariaDB |
|----------|---------|
|numerics|
|----------|---------|
| TINYINT  |NUMBER(3)|
| SMALLINT |NUMBER(5)|
| INTEGER  |NUMBER(10)|
|BIGINT | NUMBER(19)|
|DECIMAL(p,s)| NUMBER(p,s)|

# Why would one choose OracleDB over MariaDB
* Better for large companies with lots of resources to utilize (grid computing)
