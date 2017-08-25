-- 建立临时 以便处理 chinaarea 区域表
CREATE TABLE IF NOT EXISTS `temp_chepai` (
  `areaid` varchar(10) CHARACTER SET utf8 DEFAULT '',
`fullname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `shortname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cpai` varchar(50) CHARACTER SET utf8 DEFAULT ''
) ;

-- 自动执行sql导入数据后，再执行以下数据处理脚本

-- 删除不需要的数据
DELETE from temp_chepai where areaid='areaid';
delete from temp_chepai where areaid = '';

-- 拆分简称、车牌首字母
update temp_chepai set shortname = SUBSTR(fullname,1,1),cpai= SUBSTR(fullname,2,1);

-- 直接相等的
UPDATE chinaarea a,temp_chepai t set a.shortname = t.shortname,a.firstword = t.cpai  WHERE a.ord=t.areaid;

-- 更新剩下的地区
UPDATE chinaarea a,temp_chepai t set a.shortname = t.shortname,a.firstword = t.cpai  WHERE CONCAT(SUBSTR(ord,1,4),"00")=t.areaid and a.shortname = '';

-- 还剩下300多个需要处理
 update chinaarea set shortname = '京',firstword = 'A' WHERE ord in ('110100','110101','110102','110103','110104','110105','110106','110107','110108');
 update chinaarea set shortname = '京',firstword = 'G' WHERE ord in ('110109','110111','110112','110113','110114','110115','110116','110117','110200','110228','110229');

UPDATE chinaarea set shortname = '津',firstword = 'A'  WHERE SUBSTR(ord,1,2)= '12';

UPDATE chinaarea set shortname = '沪',firstword = 'A'  WHERE ord in ('310000','310100','310101','310102','310103','310104','310105','310106','310107','310108','310109','310110','310111','310112','310113','310114','310115');
 UPDATE chinaarea set shortname = '沪',firstword = 'C'  WHERE ord in ('310120','310119','310118','310116','310117');
 UPDATE chinaarea set shortname = '沪',firstword = 'R'  WHERE ord in ('310230','310200');

UPDATE chinaarea set shortname = '渝',firstword = 'F'  WHERE ord in ('500101');
 UPDATE chinaarea set shortname = '渝',firstword = 'B'  WHERE ord in ('500108');
 UPDATE chinaarea set shortname = '渝',firstword = 'C'  WHERE ord in ('500118');
 UPDATE chinaarea set shortname = '渝',firstword = 'G'  WHERE ord in ('500102');
 UPDATE chinaarea set shortname = '渝',firstword = 'H'  WHERE ord in ('500114');
 UPDATE chinaarea set shortname = '渝',firstword = 'A'  WHERE SUBSTR(ord,1,2)= '50' and shortname = '';
 
 
 UPDATE chinaarea set shortname = '冀',firstword = 'A'  WHERE ord= '130000' and shortname = '';
 UPDATE chinaarea set shortname = '晋',firstword = 'A'  WHERE ord= '140000' and shortname = '';
 UPDATE chinaarea set shortname = '蒙',firstword = 'A'  WHERE ord= '150000' and shortname = '';
 UPDATE chinaarea set shortname = '辽',firstword = 'A'  WHERE ord= '210000' and shortname = '';
 UPDATE chinaarea set shortname = '吉',firstword = 'A'  WHERE ord= '220000' and shortname = '';
 UPDATE chinaarea set shortname = '黑',firstword = 'A'  WHERE ord= '230000' and shortname = '';
 UPDATE chinaarea set shortname = '苏',firstword = 'A'  WHERE ord= '320000' and shortname = '';
 UPDATE chinaarea set shortname = '浙',firstword = 'A'  WHERE ord= '330000' and shortname = '';
 UPDATE chinaarea set shortname = '皖',firstword = 'A'  WHERE ord= '340000' and shortname = '';
 UPDATE chinaarea set shortname = '闽',firstword = 'A'  WHERE ord= '350000' and shortname = '';
 UPDATE chinaarea set shortname = '赣',firstword = 'A'  WHERE ord= '360000' and shortname = '';

UPDATE chinaarea set shortname = '鲁',firstword = 'A'  WHERE ord= '370000' and shortname = '';
UPDATE chinaarea set shortname = '豫',firstword = 'A'  WHERE ord= '410000' and shortname = '';
UPDATE chinaarea set shortname = '鄂',firstword = 'A'  WHERE ord= '420000' and shortname = '';
UPDATE chinaarea set shortname = '湘',firstword = 'A'  WHERE ord= '430000' and shortname = '';
UPDATE chinaarea set shortname = '粤',firstword = 'A'  WHERE ord= '440000' and shortname = '';
UPDATE chinaarea set shortname = '桂',firstword = 'A'  WHERE ord= '450000' and shortname = '';
UPDATE chinaarea set shortname = '川',firstword = 'A'  WHERE ord= '510000' and shortname = '';
UPDATE chinaarea set shortname = '贵',firstword = 'A'  WHERE ord= '520000' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'A'  WHERE ord= '530000' and shortname = '';
UPDATE chinaarea set shortname = '藏',firstword = 'A'  WHERE ord= '540000' and shortname = '';
UPDATE chinaarea set shortname = '陕',firstword = 'A'  WHERE ord= '610000' and shortname = '';
UPDATE chinaarea set shortname = '甘',firstword = 'A'  WHERE ord= '620000' and shortname = '';
UPDATE chinaarea set shortname = '青',firstword = 'A'  WHERE ord= '630000' and shortname = '';
UPDATE chinaarea set shortname = '宁',firstword = 'A'  WHERE ord= '640000' and shortname = '';
UPDATE chinaarea set shortname = '新',firstword = 'A'  WHERE ord= '650000' and shortname = '';

UPDATE chinaarea set shortname = '吉',firstword = 'A'  WHERE SUBSTR(ord,1,4)= '2201' and shortname = '';
UPDATE chinaarea set shortname = '黑',firstword = 'M'  WHERE SUBSTR(ord,1,4)= '2312' and shortname = '';
UPDATE chinaarea set shortname = '皖',firstword = 'Q'  WHERE SUBSTR(ord,1,4)= '3414' and shortname = '';
UPDATE chinaarea set shortname = '闽',firstword = 'A'  WHERE SUBSTR(ord,1,4)= '3501' and shortname = '';
 UPDATE chinaarea set shortname = '贵',firstword = 'F'  WHERE SUBSTR(ord,1,4)= '5224' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'A'  WHERE SUBSTR(ord,1,4)= '5301' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'D'  WHERE SUBSTR(ord,1,4)= '5303' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'F'  WHERE SUBSTR(ord,1,4)= '5304' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'C'  WHERE SUBSTR(ord,1,4)= '5306' and shortname = '';
UPDATE chinaarea set shortname = '云',firstword = 'E'  WHERE SUBSTR(ord,1,4)= '5323' and shortname = '';
  UPDATE chinaarea set shortname = '贵',firstword = 'A'  WHERE SUBSTR(ord,1,4)= '5201' and shortname = '';
UPDATE chinaarea set shortname = '贵',firstword = 'D'  WHERE SUBSTR(ord,1,4)= '5222' and shortname = '';
UPDATE chinaarea set shortname = '琼',firstword = 'C'  WHERE SUBSTR(ord,1,4)= '4690' and shortname = '';
UPDATE chinaarea set shortname = '川',firstword = 'L'  WHERE SUBSTR(ord,1,4)= '5111' and shortname = '';
UPDATE chinaarea set shortname = '甘',firstword = 'P'  WHERE SUBSTR(ord,1,4)= '6230' and shortname = '';

UPDATE chinaarea set shortname = '鄂',firstword = 'A'  WHERE ord in ('429000');
UPDATE chinaarea set shortname = '琼',firstword = 'A'  WHERE ord in ('469000');

UPDATE chinaarea set shortname = '川',firstword = 'T'  WHERE SUBSTR(ord,1,4)= '5118' and shortname = '';
UPDATE chinaarea set shortname = '新',firstword = 'A'  WHERE ord in ('659000');





-- 

# 输出提示信息
select '05_1(update) - finished' as 'status';
