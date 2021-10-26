-- get the list of message senders(دریافت لیست ارسال کنندگان پیام)
delimiter // 
create procedure get_all_message_senders()
begin 
	declare uname varchar(20);
	call get_signed_in_user(uname);
    
    select distinct message_sender
	from message
	where message_receiver=uname and is_valid=true
	order by message_date desc;
end//
delimiter ;

call get_all_message_senders();
select * from message;
select * from blocking;