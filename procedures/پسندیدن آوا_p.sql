-- like a tweet
delimiter // 
create procedure like_tweet(in tid int)
begin 
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you have been blocked!!';
	else
		if (not exists (select liker from likes where liker=uname and liked_tweet=tid)) then
			insert into likes values
			(uname, tid);
		else
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'you have already liked this tweet!!';
		end if;
	end if;
    
end//
delimiter ;

call like_tweet(1);
select * from likes;
select * from tweet;