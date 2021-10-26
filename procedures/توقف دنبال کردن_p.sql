-- unfollow a user(توقف دنبال کردن) --procedure

delimiter // 
create procedure unfollow_user(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
   if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you can not unfollow yourself!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user you want to unfollow does not exist!';
		else 
			if ((select follower_user from follow where follower_user=uname and followed_user=target) is null) then
				SIGNAL SQLSTATE '42927'
				SET MESSAGE_TEXT = 'you are not following this user!';
			else 
				delete from follow
				where follower_user=uname and followed_user=target;
			end if;
		 end if;
	 end if;
     
end//
delimiter ;

call unfollow_user('mard21');
select * from follow;