#!/bin/bash
source .cod4env

mysqldump -u root -p battleroyale > ~/backup.sql
