-- unblock a user(آزاد کردن)
delimiter // 
create procedure unblock_user(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
   if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not unblock yourself!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to unblock does not exist!';
		else 
			if ((select blocker_user from blocking where blocker_user=uname and blocked_user=target) is null) then
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you have not blocked this user!';
			else 
				delete from blocking
				where blocker_user=uname and blocked_user=target;
			end if;
		 end if;
	 end if;
end//
delimiter ;

call unblock_user('mard21');
call unblock_user('alii');
select * from blocking;