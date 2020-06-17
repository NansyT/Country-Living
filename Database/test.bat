@echo off
REM Copyright (c) 2012-2020, EnterpriseDB Corporation.  All rights reserved

REM PostgreSQL server psql runner script for Windows

SET server=localhost
SET /P server="Server [%server%]: "

SET database=landlyst
SET /P database="Database [%database%]: "

SET port=6666
SET /P port="Port [%port%]: "

SET username=postgres
SET /P username="Username [%username%]: "

for /f "delims=" %%a in ('chcp ^|find /c "932"') do @ SET CLIENTENCODING_JP=%%a
if "%CLIENTENCODING_JP%"=="1" SET PGCLIENTENCODING=SJIS
if "%CLIENTENCODING_JP%"=="1" SET /P PGCLIENTENCODING="Client Encoding [%PGCLIENTENCODING%]: "

REM Run psql
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -h %server% -U %username% -d %database% -p %port% -a -f new_backup.sql

pause