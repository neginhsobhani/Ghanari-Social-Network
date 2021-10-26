-- get the list of likers (دریافت لیست پسند کننده‌ها)
delimiter // 
create procedure get_likers_list(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select null as result FROM DUAL;
        
	else
		select liker
        from likes as l
        where l.liked_tweet=tid and not exists(select *
											   from blocking 
                                               where blocker_user=l.liker and blocked_user=uname);
	end if;
end//
delimiter ;

select * from likes;
select * from blocking;
select * from tweet;

call get_likers_list(2);