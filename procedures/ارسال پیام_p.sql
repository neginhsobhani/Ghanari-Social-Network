-- send message(ارسال پیام)
delimiter // 
create procedure send_message_text(in receiver varchar(20), in m_content varchar(256))
begin 
	declare sender varchar(20);
	call get_signed_in_user(sender);
    
		if (exists (select blocker_user from blocking where blocker_user=receiver and blocked_user=sender)) then
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'blocked! can not send message';
		else
			insert into message(message_id, message_content, message_tweet,
			message_sender, message_receiver, message_date,is_valid) values
            (message_id, m_content, null, sender, receiver,current_timestamp(), true);
		end if;
end//
delimiter ;
drop procedure send_message_text;
-- procedure to send tweets
delimiter // 
create procedure send_message_tweet(in receiver varchar(20), in m_tweet int)
begin 
	declare target varchar(20);
	declare sender varchar(20);
	call get_signed_in_user(sender);
    call get_tweet_sender(m_tweet, target);
    
    if (exists (select blocker_user from blocking where blocker_user=receiver and blocked_user=sender)) then
			SIGNAL SQLSTATE '42927'
			SET MESSAGE_TEXT = 'blocked! can not send message';
		else
			if (exists(select blocker_user from blocking where blocker_user=target and blocked_user=sender)) then
				insert into message(message_id, message_content, message_tweet,
				message_sender, message_receiver, message_date,is_valid) values
				(message_id, null, m_tweet, sender, receiver,current_timestamp(), false);
			else 
				insert into message(message_id, message_content, message_tweet,
				message_sender, message_receiver, message_date,is_valid) values
				(message_id, null, m_tweet, sender, receiver,current_timestamp(), true);
			end if;
		end if;		
end//
delimiter ;

drop procedure send_message_tweet;
delimiter // 
-- create procedure send_message(in receiver varchar(20), in m_content varchar(256),in m_tweet int)
-- begin 
-- 	declare uname varchar(20);
-- 	call get_signed_in_user(uname);
--     
--     if (receiver=uname) then 
-- 		SIGNAL SQLSTATE '42927'
-- 		SET MESSAGE_TEXT = 'you can not send message to yourself!';
-- 	else 
-- 		if (m_content is null) then 
-- 			 call send_message_tweet(receiver, m_tweet);
-- 		elseif (m_tweet is null) then 
-- 			call send_message_text(receiver, m_content);
-- 		else
-- 			SIGNAL SQLSTATE '42927'
-- 			SET MESSAGE_TEXT = 'error in sending message!';
-- 		end if;
-- 	end if;
-- end//
-- delimiter ;

drop procedure send_message;
select * from message;
select * from blocking;
select * from tweet;
call send_message('mard21',null, 6);
