-- login procedure 
delimiter //
create procedure login(in uname VARCHAR(20), in passwd varchar(128))

begin 
if ((select username from ghanari_user as g
	where g.username=uname and md5(passwd) = g.pswd) is not null) then
    insert into login_log values (uname, current_timestamp());
else 
	SIGNAL SQLSTATE '42927'
	SET MESSAGE_TEXT = 'login unsuccessful, invalid data';
end if;

end//

delimiter ;

call login('mard21','mehrshahr');
call login('nila77', 'nili');
call login('neginnhs', 'neginnhs');

select * from login_log;
