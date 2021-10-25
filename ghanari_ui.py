import mysql
import mysql.connector
import prettytable
from prettytable import PrettyTable
from mysql.connector import Error

myDB = mysql.connector.connect(host='localhost',
                               database='ghanari_messenger',
                               user='root',
                               password='nhs780726')


def show_commands():
    print('################################################################################')
    print('sign up                          creating a new account')
    print('sign in                          signing into your ghanari account')
    print('get user login log               get login log of a specific')
    print('post ava                         posting a new ava on ghanari')
    print('get personal ava                 get all the AVAs you have posted so far')
    print('follow                           follow a user on ghanari')
    print('unfollow                         unfollow a user on ghanari')
    print('block                            block a user on ghanari')
    print('unblock                          unblock the user you have blocked')
    print('get following activity           get the AVAs of your followings')
    print('get user activity                get the AVAs of a specific user')
    print('comment                          leave a comment on AVA')
    print('get ava comments                 see the comments on a specific AVA')
    print('get hashtag ava                  get all the AVAs of a specific hashtag')
    print('like                             like a AVA')
    print('get like num                     get the number of likes of a AVA')
    print('get liker list                   get the list of user who liked a specific AVA')
    print('get popular ava                  get the list of popular AVAs')
    print('send message                     send message to a user')
    print('get message user                 get the list of messages you received from a user')
    print('get message senders list         get the list of user who sent you message')
    print('help                             to see the available commands')
    print('exit                             exits ghanri')
    print('################################################################################\n')


print("Welcome to Ghanari")
print("Here is the list of possible commands\nEnter your desired command")
show_commands()

myCursor = myDB.cursor()
exit_ghanari = False

while not exit_ghanari:
    input_string = input()
    if input_string == "sign up":
        print("Enter your first name")
        firstname = input()
        print("Enter your last name")
        lastname = input()
        print("Enter your username")
        username = input()
        print("Enter your password")
        password = input()
        print("Enter your birth date")
        birth_date = input()
        print("Enter your bio")
        bio = input()
        args = (firstname, lastname, username, password, birth_date, bio)
        # resProc = myCursor.callproc("create_new_account", args)
        try:
            resProc = myCursor.callproc("create_new_account", args)
            myDB.commit()
            print("success")
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "sign in":
        print("Enter your username")
        username = input()
        print("Enter your password")
        password = input()
        args = (username, password)
        try:
            resProc = myCursor.callproc("login", args)
            myDB.commit()
            print("success")
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get user login log":
        print("Enter the username of the user")
        uname = input()
        args = (uname,)
        try:
            resProc = myCursor.callproc("get_user_login_log", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["username", "login_date"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "post ava":
        print("Enter the content of your tweet")
        content = input()
        args = (content,)
        try:
            resProc = myCursor.callproc("create_new_tweet", args)
            myDB.commit()
            print("new ava posted!")
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get personal ava":
        try:
            resProc = myCursor.callproc("get_personal_tweet")
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "sender", "date", "is_comment", "comment_to"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "follow":
        print("Enter the username of the user you want to follow")
        target = input()
        args = (target,)
        try:
            resProc = myCursor.callproc("follow_user", args)
            myDB.commit()
            print("now you are following " + target)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "unfollow":
        print("Enter the username of the user you want to unfollow")
        target = input()
        args = (target,)
        try:
            resProc = myCursor.callproc("unfollow_user", args)
            myDB.commit()
            print("you unfollowed " + target)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "block":
        print("Enter the username of the user you want to block")
        target = input()
        args = (target,)
        try:
            resProc = myCursor.callproc("block_user", args)
            myDB.commit()
            print("you blocked " + target)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "unblock":
        print("Enter the username of the user you want to unblock")
        target = input()
        args = (target,)
        try:
            resProc = myCursor.callproc("unblock_user", args)
            myDB.commit()
            print("you unblocked " + target)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get following activity":
        try:
            resProc = myCursor.callproc("get_following_activity")
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "sender", "date", "is_comment", "comment_to"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get user activity":
        print("Enter the username of the user who's activity you want to check")
        target = input()
        args = (target,)
        try:
            resProc = myCursor.callproc("get_user_activity", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "sender", "date", "is_comment", "comment_to"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "comment":
        print("Enter the id of the ava you want you comment on")
        id = input()
        print("Enter your comment...")
        cm = input()
        args = (id, cm)
        try:
            resProc = myCursor.callproc("comment_on_tweet", args)
            myDB.commit()
            print("you posted a comment!")
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()


    elif input_string == "get ava comments":
        print("Enter the id of the ava you want see it's comments")
        id = input()
        args = (id,)
        try:
            resProc = myCursor.callproc("get_comments_of_tweet", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "sender", "date", "is_comment", "comment_to"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()
    
    elif input_string == "get hashtag ava":
        pass

    elif input_string == "like":
        print("Enter the id of the ava you want to like")
        id = input()
        args = (id, )
        try:
            resProc = myCursor.callproc("like_tweet", args)
            myDB.commit()
            print("you liked a ava!")
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get like num":
        print("Enter the id of the ava you want to check it's like numbers")
        id = input()
        args = (id,)
        try:
            resProc = myCursor.callproc("get_like_num", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["number of likes"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get liker list":
        print("Enter the id of the ava you want to see it's likers")
        id = input()
        args = (id,)
        try:
            resProc = myCursor.callproc("get_likers_list", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["liker name"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get popular ava":
        try:
            resProc = myCursor.callproc("get_popular_tweets")
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "sender", "date", "is_comment", "comment_to", "number of likes"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "send message":
        print("Enter the username of the user you want to send message to")
        username = input()
        print("If you want to send a ava enter a and if you want to send a text message enter m")
        mode = input()
        if mode == "a":
            print("Enter the id of the ava you want to send")
            inp = input()
        elif mode == "m":
            print("Enter your message")
            inp = input()
        args = (username, inp)
        try:
            if mode == "a":
                resProc = myCursor.callproc("send_message_tweet", args)
                myDB.commit()
                print("you sent an ava to "+username)
            elif mode == "m":
                resProc = myCursor.callproc("send_message_text", args)
                myDB.commit()
                print("you sent a text message to "+username)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get message user":
        print("Enter the username of the user you are looking for her/his messages")
        username = input()
        args = (username,)
        try:
            resProc = myCursor.callproc("get_messages_from_user", args)
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["id", "content", "message ava id", "sender", "receiver", "date", "is_valid"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()

    elif input_string == "get message senders list":
        try:
            resProc = myCursor.callproc("get_all_message_senders")
            myDB.commit()
            table = PrettyTable()
            table.field_names = ["sender username"]
            for result in myCursor.stored_results():
                rows = result.fetchall()
            for row in rows:
                table.add_row(row)
            print(table)
        except mysql.connector.Error as error:
            print("Failed to update record to database rollback: {}".format(error))
            # reverting changes because of exception
            myDB.rollback()
    elif input_string == "help":
        show_commands()

    elif input_string == "exit":
        exit_ghanari = True

    else:
        print("This instruction incorrect \n")
