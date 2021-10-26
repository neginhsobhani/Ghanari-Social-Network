-- get the popular tweets(دریافت آواهای پرطرفدار)
delimiter // 
create procedure get_popular_tweets()
begin 
    declare uname varchar(20);
    call get_signed_in_user(uname);
    
    (with likes_num(like_num, liked_tweet) as 
	(select count(liker) as like_num, liked_tweet
	from likes
	group by liked_tweet
	order by like_num desc)

	select t.tweet_id, t.tweet_content, t.tweet_sender, t.tweet_date, t.is_comment,
	t.comment_to, ifnull(like_num, 0) as number_of_likes 
	from tweet  as t left join likes_num as l on t.tweet_id = l.liked_tweet
	where not exists (select *
					  from blocking
					  where blocked_user=uname and blocker_user= t.tweet_sender))
	order by l.like_num desc;
end//
delimiter ;

call get_popular_tweets();

select * from tweet;
select * from blocking;