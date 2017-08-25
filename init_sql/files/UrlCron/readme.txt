
【请先将父目录UrlCon复制到相关的工作目录主目录中后再配置任务】

1、在 cron.ini 文件中配置任务地址，格式如下(请将localhost换成域名)：
86400 http://localhost/admin/manage/sms_sender.html?key=order
86400 http://localhost/admin/manage/sms_sender.html?key=service
86400 http://localhost/admin/manage/sms_sender.html?key=manual
60 http://localhost/admin/manage/sms_sender.html?key=delay

[order]: 订单服务关怀提醒
[service]: 服务项目定期关怀提醒
[manual]: 手工服务项目关怀提醒
[delay]: 过期订单做失效处理

说明：
(86400 = 24 * 3600)每天运行，至于每天什么时间点运行，可以在该时间点手动启动服务即可。建议上午11点启动服务。

2、在 Windows 7 系统中，请先运行 cmd.exe 程序，并以管理员身份运行该程序。
然后 cd /d UrlCron目录 后，再命令行中执行 install.bat 程序。
即可正常安装。

3、每次启动服务，都会运行一次程序，然后以间隔时间访问相应的url。

4、车主关怀，每天中午运行一次；订单失效，每1分钟运行一次。

-----------------------------------
-----------------------------------
-----------------------------------
UrlCron Ver 1.0 Url定时请求器

运行环境：Windows .Net Framework SP1

Powered By www.XenSystem.Com

论坛交流区：http://forum.xensystem.com/

-----------------------------------
-----------------------------------
-----------------------------------

文件清单：
install.bat　 安装，将UrlCron服务安装到系统Servcie服务中，运行on.bat可马上执行
on.bat　　　  手动启动服务
off.bat　　　 手动停止服务
uninstall.bat 卸载，从服务中删除UrlCron服务
cron.log　　　记录运行日志及请求错误记录
-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
cron.ini　　　需要请求的URL清单配置，配置格式：时间(秒) 空格 Url地址，一行为一个任务线程

例如，每60秒访问baidu，每小时访问QQ：

60 http://www.baidu.com/
3600 http://www.qq.com/


-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
如因目标网址错误而导致本程序错误停止，请在windows中设置本程序服务失败后仍然重新运行