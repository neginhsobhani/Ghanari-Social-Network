-- get the comments of a tweet (دریافت نظرات یه آوا)
delimiter // 
create procedure get_comments_of_tweet(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		select * 
        from tweet
        where not exists(select blocker_user
						 from blocking
                         where blocker_user=target and blocked_user=uname);
	else
		select *
        from tweet as t
        where t.comment_to=tid and not exists(select tweet_sender 
											  from tweet, blocking
											  where blocked_user=uname
											  and blocker_user = t.tweet_sender);
	  end if;
end//
delimiter ;

drop procedure get_comments_of_tweet;
call get_comments_of_tweet(3);
select * from tweet;