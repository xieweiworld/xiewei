@REM 备份数据库的脚本，请使用 windows 中的任务计划功能，执行此文件。
@REM ！！！！！请调整好前面7个ＳＥＴ命令中的各项参数值！！！！！
@REM 备份数据文件存储在此文件中：%mysql_backup_path%\%mysql_database%.%today%.backup.sql。
@REM 文件名格式：数据库名.备份日期.backup.sql

@CLS
@ECHO OFF

:: mysql.exe 程序所在目录
SET mysql_bin=C:\wamp\bin\mysql\mysql5.6.17\bin
:: 数据文件存放目录
SET mysql_backup_path=C:\work\mysql\backup

:: 连接数据库的配置信息
SET mysql_server=127.0.0.1
SET mysql_port=3306
SET mysql_database=weixin
SET mysql_user=root
SET mysql_pass=

SET cmd_log_file=%mysql_backup_path%\mysql_backup.log

IF NOT EXIST %mysql_backup_path% (
	SETLOCAL ENABLEEXTENSIONS
	MKDIR %mysql_backup_path%
	ENDLOCAL
)

CD /d "%mysql_bin%"

:: check exe exists or not
IF NOT EXIST %mysql_bin%\mysql.exe (
	ECHO The mysql command does NOT exist >> %cmd_log_file% & @GOTO :Errors
)

ECHO START >> %cmd_log_file%
:: get today date
ECHO Get Current Day...... >> %cmd_log_file%
%mysql_bin%\mysql.exe -h %mysql_server% -P %mysql_port% -u %mysql_user% --password=%mysql_pass% -e "SELECT REPLACE(CURDATE(), '-', '') AS today;" | findstr /R [0-9] > "%mysql_backup_path%\today.txt"
for /f "delims=" %%a in (%mysql_backup_path%\today.txt) do @set today=%%a
ECHO Today: %today% >> %cmd_log_file%

:: check exe exists or not
IF NOT EXIST %mysql_bin%\mysqldump.exe (@ECHO The mysqldump command does NOT exist & @GOTO :Errors)

ECHO DUMPING DATA FOR %mysql_database% TO %mysql_backup_path%\%mysql_database%.%today%.backup.sql >> %cmd_log_file%
:: backup command
%mysql_bin%\mysqldump.exe --default-character-set=utf8 -h %mysql_server% -P %mysql_port% -u %mysql_user% --password=%mysql_pass% %mysql_database% > %mysql_backup_path%\%mysql_database%.%today%.backup.sql

::call %mysql_cmd%
IF NOT %ERRORLEVEL%==0 (@GOTO :Errors) ELSE (@GOTO :Success)

::  return Zero: success; return non-Zero: failure.
:Success
ECHO FINISHED. >> %cmd_log_file%
@ECHO on
@EXIT /B 0

:Errors
@ECHO Error occurred, skip dumping database job! (dump_mysql_weixin.cmd)
@ECHO on
@EXIT /B 1
