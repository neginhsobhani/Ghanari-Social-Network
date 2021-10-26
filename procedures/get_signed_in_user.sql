-- get signed in user 

delimiter //
create procedure get_signed_in_user(out uname varchar(20))
begin
	select username
    into uname
    from login_log 
    order by login_date desc
    limit 1;
end//
delimiter ;

call get_signed_in_user(@send) ;
select @send as sender;

