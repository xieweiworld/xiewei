delimiter //

DROP PROCEDURE IF EXISTS __init_customer_service_empty__; //

# select * from sys_default_service;

CREATE PROCEDURE __init_customer_service_empty__()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE wid2, pid2 INT;
	declare flag, pid3 int;
	declare c_seconds cursor for select distinct wid, id from customer_services where pid = 0 order by wid asc, id asc;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	# 小类: each wid, each pid
	set done = false;
	open c_seconds;
	read_loop2: LOOP
		FETCH c_seconds INTO wid2, pid2;

		IF done THEN
		  LEAVE read_loop2;
		END IF;

        set flag = (select count(*) from customer_services where wid=wid2 and pid=pid2);
		if flag = 0 and pid2 != 457  then
			set pid3 = (select id from sys_default_service where code=pid2);
			# select flag, wid2, pid2, pid3;
			insert into customer_services(wid,pid,name,name_pinyin,name_chars,sort_no,add_date,update_date)
			select wid2,pid2,name,name_pinyin,name_chars,sort_no,now(),now()
			from sys_default_service
			where pid = pid3 and pid > 0;
		end if;
	END LOOP;
	close c_seconds;

END;
//

call  __init_customer_service_empty__(); //

DROP PROCEDURE IF EXISTS __init_customer_service_empty__; //

