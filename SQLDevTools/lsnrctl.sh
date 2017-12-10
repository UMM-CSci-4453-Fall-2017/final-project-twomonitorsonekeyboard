#!/bin/bash

#Sets up ORACLE variables needed to run the database
source setup.sh
cd $ORACLE_HOME/bin

./lsnrctl $1
