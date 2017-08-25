# 初始化虚拟员工，允许反复执行，不重复加入

## 需要先执行存储过程： __proc__add_virtual_user_staff


# 执行proc，为 车之翼(3035)、深荣昌(1789)、小一(319) 添加默认虚拟员工


## 2016-12-30
### 3035, 1789, 319
### 维修部、美容部
call __proc__add_virtual_user_staff(3035, '维修部');
call __proc__add_virtual_user_staff(3035, '美容部');

call __proc__add_virtual_user_staff(1789, '维修部');
call __proc__add_virtual_user_staff(1789, '美容部');

call __proc__add_virtual_user_staff(319, '维修部');
call __proc__add_virtual_user_staff(319, '美容部');
## 2016-12-30


## 2017-02-07
### 3035, 1789, 319
### 钣喷部、轮胎部
call __proc__add_virtual_user_staff(3035, '钣喷部');
call __proc__add_virtual_user_staff(3035, '轮胎部');

call __proc__add_virtual_user_staff(1789, '钣喷部');
call __proc__add_virtual_user_staff(1789, '轮胎部');

call __proc__add_virtual_user_staff(319, '钣喷部');
call __proc__add_virtual_user_staff(319, '轮胎部');
## 2017-02-07

select * from user_staff where wid in (3035, 1789, 319, 236, 244) and deleted = 3;

/*

####### 以下为测试平台下的测试商户 #######
### 236(小一)、244(小二)

### 维修部、美容部
call __proc__add_virtual_user_staff(236, '维修部');
call __proc__add_virtual_user_staff(236, '美容部');

call __proc__add_virtual_user_staff(244, '维修部');
call __proc__add_virtual_user_staff(244, '美容部');

### 钣喷部、轮胎部
call __proc__add_virtual_user_staff(236, '钣喷部');
call __proc__add_virtual_user_staff(236, '轮胎部');

call __proc__add_virtual_user_staff(244, '钣喷部');
call __proc__add_virtual_user_staff(244, '轮胎部');

*/

select '31_billings_add_virtual_staffs Finished' as 'DONE';
