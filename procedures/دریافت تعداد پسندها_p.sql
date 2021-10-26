-- get number of likes of a tweet
delimiter // 
create procedure get_like_num(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select 0 as result FROM DUAL;
	else
		select count(liked_tweet) as like_num
        from likes
        where liked_tweet = tid;
	end if;
	
end//
delimiter ;

select * from likes;
call get_like_num(2);