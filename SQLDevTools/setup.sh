#!/bin/bash

# Oracle Settings
# Set up all variables necessary to run Oracle DB on spacewhale
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
