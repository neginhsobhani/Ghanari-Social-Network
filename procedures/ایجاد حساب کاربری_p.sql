-- create new account(ایجاد حساب کاربری جدید) procedure

delimiter //
create procedure create_new_account 
(in fname VARCHAR(20),in lname varchar(20),in uname varchar(20),in passwd varchar(128),
in bdate DATE, in biog varchar(64))

begin 
	if ((select username from ghanari_user where username=uname) is NULL) then 
		insert into ghanari_user values (
		fname, 
		lname, 
		uname,
		md5(passwd),
		bdate,
		current_timestamp(),
		biog
		);
    else 
		SIGNAL SQLSTATE '42927'
		SET MESSAGE_TEXT = 'This username is occupied';
	END IF;
    
end//

delimiter ;    

call create_new_account('mehrdad', 'ardehali', 'mard21', 'mehrshahr', '1999-10-18', 'busy');

select * from ghanari_user;
