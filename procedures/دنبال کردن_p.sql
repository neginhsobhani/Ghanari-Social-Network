-- start following a person

delimiter // 
create procedure follow_user(in target varchar(20))
begin 
	-- get signed in user 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
    if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not follow yourself';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to follow does not exist!';
		else 
			if ((select follower_user from follow where follower_user=uname and followed_user=target) is null) then
				insert into follow(follower_user,followed_user) values (uname, target);
			else 
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you are already following this user!';
			end if;
		 end if;
	 end if;
    
end//
delimiter ;

select * from follow;
call follow_user('alii');