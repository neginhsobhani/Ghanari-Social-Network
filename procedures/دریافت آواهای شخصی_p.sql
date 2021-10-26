-- get all personl tweets posted by far(دریافت آواهای شخصی)
-- uname means the signed in user 

delimiter // 
create procedure get_personal_tweet() 
begin 
	declare t_sender varchar(20);
    call get_signed_in_user(t_sender);
    
	select *
	from tweet 
	where tweet_sender=t_sender
	order by tweet_date asc;

    
end//
delimiter ;


call get_personal_tweet();