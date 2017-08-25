REM 定位到当前项目根目录
cd /d %~dp0
cd ..
cd ..
cd ..

REM 设置当前日期
set "curDate=%date:~,4%%date:~5,2%%date:~8,2%"

REM 创建日志文件夹
IF EXIST assets\log\cron ( echo is exist ) ELSE ( mkdir assets\log\cron)

REM 执行php脚本
php wx/cron/cron.php careRemindCheck >> assets/log/cron/%curDate%_careRemindCheck.log