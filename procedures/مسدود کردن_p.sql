-- block a user(مسدود کردن) 
delimiter // 
create procedure block_user(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
     if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not block yourself';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to block does not exist!';
		else 
			if ((select blocker_user from blocking where blocker_user=uname and blocked_user=target) is null) then
				insert into  blocking(blocker_user, blocked_user) values (uname, target);
			else 
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you have already blocked this user!!';
			end if;
		 end if;
	 end if;
end//
delimiter ;

select * from blocking;
call block_user('neginnhs');
call block_user('mard21');