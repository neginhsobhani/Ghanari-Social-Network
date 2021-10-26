-- get acitivity of a specific user (دریافت فعالیت کاربران)
delimiter // 
create procedure get_user_activity(in target varchar(20))
begin 
	declare uname varchar(20);
    call get_signed_in_user(uname);
    
    if (uname=target) then 
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'use get personal tweet feature to get your own tweets!';
	else 
		 if ((select username from ghanari_user where username=target) is null) then 
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'the user does not exist!';
		else
			if ((select blocker_user from blocking where blocker_user=target and blocked_user=uname) is null) then 
				select * 
                from tweet 
                where tweet_sender=target
                order by tweet_date desc;
			else 
				select *
                from tweet
                where not exists (select blocker_user
								  from blocking
                                  where blocker_user=target and blocked_user=uname);
			end if;
		end if;
	end if;
end//
delimiter ;

drop procedure get_user_activity;

call get_user_activity('mard21');
