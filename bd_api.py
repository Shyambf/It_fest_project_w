import sqlite3
from datetime import datetime

class Bd:
    def __init__(self) -> None:
        self.conn = sqlite3.connect('data.db')
        self.cur = self.conn.cursor()
        self.cur.execute("""CREATE TABLE IF NOT EXISTS users(
                    userid TEXT,
                    fullname TEXT,
                    direction TEXT,
                    groups TEXT,
                    schoolnum INTEGER);
                """)
        self.cur.execute("""CREATE TABLE IF NOT EXISTS in_buid(
                    userid TEXT,
                    fname TEXT,
                    time TEXT,
                    date TEXT);
                """)
        self.cur.execute("""CREATE TABLE IF NOT EXISTS log(
                    userid TEXT,
                    fullname TEXT,
                    action TEXT,
                    time TEXT,
                    date TEXT);
                """)
        self.conn.commit()

    def log(self, texts, fname, date, time, action):
        log = (texts, fname, action, time, date)
        self.cur.execute("INSERT INTO log VALUES(?, ?, ?, ?, ?);", log)
        self.conn.commit()

    def check(self, texts):
        fname = ''
        sql_request = """SELECT * FROM users;"""
        self.cur.execute(sql_request)
        user = self.cur.fetchall()
        for row in user:
            if row[0] == texts:
                fname = row[1]
        return fname

    def add_user(self, userid, fullname, direction, group, schoolnum):
        user =(userid, fullname, direction, group, schoolnum)
        self.cur.execute("INSERT INTO users VALUES(?, ?, ?, ?, ?);", user)
        self.conn.commit()

    def entry(self, texts):
        fname = self.check(texts)
        if fname:
            date = datetime.now().strftime('%Y-%m-%d')
            time = datetime.now().strftime('%H:%M:%S')
            user = (texts, fname, time, date)
            self.cur.execute("INSERT INTO in_buid VALUES(?, ?, ?, ?);", user)
            self.conn.commit()
            self.log(texts, fname, date, time, 'вход')
    
    def exit(self, texts):
        fname = self.check(texts)
        if fname:
            date = datetime.now().strftime('%Y-%m-%d')
            time = datetime.now().strftime('%H:%M:%S')
            ins = self.get_in()
            for i in ins:
                print(i[0], texts)
                if i[0] == texts:
                    sql_req = "DELETE FROM in_buid WHERE (userid={});".format(texts)
                    self.cur.execute(sql_req)
                    self.conn.commit()
            self.log(texts, fname, date, time, 'выход')

    def get_one_user(self, texts):
            self.cur.execute("SELECT * FROM users WHERE ('userid={}');".format(texts))
            user = self.cur.fetchall()
            return user

    def get_user(self):
        return self.cur.execute("""SELECT * FROM users""")

    def get_log(self):
        return self.cur.execute("""SELECT * FROM log""")

    def get_in(self):
        return self.cur.execute("""SELECT * FROM in_buid""")