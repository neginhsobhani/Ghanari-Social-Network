-- get following activities(دریافت فعالیت دنبال شودگان)
delimiter // 
create procedure get_following_activity()
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    
	select *
    from tweet
    where tweet_sender in (select followed_user
						   from follow
							 where follower_user=uname) and not exists (select blocker_user
																		from blocking
																		where blocker_user=tweet_sender
																		and blocked_user=uname)
	order by tweet_date desc;
end//
delimiter ;

drop procedure get_following_activity;
call get_following_activity();
select * from tweet;
select * from blocking;
select * from follow;