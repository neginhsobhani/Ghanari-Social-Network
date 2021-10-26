-- comment on a tweet(نظر دادن)
-- this procedure finds the sender of a twet
delimiter // 
create procedure get_tweet_sender(in tid int, out uname varchar(20))
begin 
	select tweet_sender
    into uname
    from tweet
    where tweet_id=tid;
end//
delimiter ;

drop procedure get_tweet_sender;
delimiter // 
create procedure comment_on_tweet(in tid int, in cm_content varchar(256))
begin 
	
	declare target varchar(20);
    declare uname varchar(20);
    call get_signed_in_user(uname);
    call get_tweet_sender(tid, target);
    
    if (exists (select blocker_user from blocking where blocker_user=target and blocked_user=uname)) then
		SIGNAL SQLSTATE '42927'
 		SET MESSAGE_TEXT = 'you have been blocked!!';
	else
		insert into tweet(tweet_id,tweet_content, tweet_sender,tweet_date,is_comment,comment_to) values
		(tweet_id, cm_content, uname, current_timestamp(), true, tid);
	end if;
		
end//
delimiter ;

drop procedure comment_on_tweet;
select * from tweet;
select * from blocking;
call comment_on_tweet(33, 'cm on cm!!');
