-- create a new tweet (ارسال آوا) - procedure

delimiter // 
create procedure create_new_tweet(in content VARCHAR(256))
begin 
		declare sender varchar(20);
		call get_signed_in_user(sender);
        
		insert into tweet(tweet_content, tweet_sender,tweet_date,is_comment,comment_to) values 
        (content, sender, current_timestamp(), false, null);
end//
delimiter ;


drop procedure create_new_tweet;

call create_new_tweet('orchid');

select * from tweet;