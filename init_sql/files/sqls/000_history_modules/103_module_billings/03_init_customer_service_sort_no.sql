
delimiter //
DROP PROCEDURE IF EXISTS __init_customer_service_sort_no__; //

CREATE PROCEDURE __init_customer_service_sort_no__()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE wid1, wid2, pid2 INT;
	declare c_firsts cursor for select distinct wid from customer_services where pid = 0 order by wid asc;
	declare c_seconds cursor for select distinct wid, pid from customer_services where pid != 0 order by wid asc, id asc;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	# 大类：each wid
	set done = false;
	open c_firsts;
	read_loop1: LOOP
		FETCH c_firsts INTO wid1;

		IF done THEN
		  LEAVE read_loop1;
		END IF;

		set @sort = 0;
		update customer_services
		set sort_no = (@sort := @sort + 1)
		where wid = wid1 and pid = 0;
	END LOOP;
	close c_firsts;

	# 小类: each wid, each pid
	set done = false;
	open c_seconds;
	read_loop2: LOOP
		FETCH c_seconds INTO wid2, pid2;

		IF done THEN
		  LEAVE read_loop2;
		END IF;

		set @sort = 0;
		update customer_services
		set sort_no = (@sort := @sort + 1)
		where wid = wid2 and pid = pid2;
	END LOOP;
	close c_seconds;

END;
//

call __init_customer_service_sort_no__(); //

DROP PROCEDURE IF EXISTS __init_customer_service_sort_no__; //
