-- get login log of a user - procedure

delimiter // 
create procedure get_user_login_log(uname VARCHAR(20))
 
begin 
	select * 
    from login_log
    where username = uname
    order by login_date desc;
end//

delimiter ;   



call get_user_login_log('mard21');
