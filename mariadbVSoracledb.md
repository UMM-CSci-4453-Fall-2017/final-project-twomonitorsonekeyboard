# MariaDB vs. OracleDB
## Advantages of MariaDB
* Open Source
* Support for JSON datatype

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
#### Numerics

| MariaDB | OracleDB |
|----------|---------|
| TINYINT  |NUMBER(3)|
| SMALLINT |NUMBER(5)|
| INTEGER  |NUMBER(10)|
|BIGINT | NUMBER(19)|
|DECIMAL(p,s)| NUMBER(p,s)|
| FLOAT | BINARY_DOUBLE|
#### Date & Time

|MariaDB | OracleDB|
|--------|---------|
|TIME|No Equivalent|
|DATE|No Equivalent|
|DATETIME| TIMESTAMP(3)|
|No Equivalent|INTERVAL YEAR (y) TO MONTH|
|No Equivalent|INTERVAL DAY (d) TO SECOND (fs)|

#### Character Strings

|MariaDB | OracleDB|
|--------|---------|
|CHAR(x) | CHAR(x) |
|VARCHAR(x)| ARCHAR2(x)|
|VARCHAR(MAX)|CLOB|
|TEXT|LONG|
#### Binary Strings

|MariaDB | OracleDB|
|--------|---------|
|BINARY(n)|RAW(n)|
|VARBINARY(n)|LONG RAW|
|VARBINARY(MAX)|LONG RAW or BLOB|
|JSON|No Equivalent|
|No Equivalent|XML|

# Why would one choose OracleDB over MariaDB
* Better for large companies with lots of resources to utilize (grid computing)
