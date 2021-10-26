-- get the list of messages received from a user (دریافت ایست پیامهای دریافتی از کاربر)
delimiter // 
create procedure get_messages_from_user(in target varchar(20))
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    select * 
	from message 
	where message_receiver=uname and message_sender=target and is_valid=true
	order by message_date desc;

end//
delimiter ;

select * from message;
call get_messages_from_user('neginnhs');