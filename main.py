from bd_api import Bd
from bottle import route, run, template, request
sql = Bd()
 
@route('/')
def home():
    a = sql.get_log()
    return template('template/logs', logs=list(a))

@route('/log')
def index():
    a = sql.get_log()
    return template('template/logs', logs=list(a))

@route('/action')
def index():
    return template('template/action')

@route('/users')
def users():
    user = sql.get_user()
    a = list(user)
    return template('template/user', us=a)

@route('/action', method='POST')
def do_login():
    code = request.forms.code
    if sql.check(code):
        inb = sql.get_in()
        uid = list()
        for i in inb:
            uid.append(i[0])
        if code in uid:
            sql.exit(code)
            action = 'logged out'
            return template('template/ok', action=action)
        else:
            sql.entry(code)
            action = 'logged in'
            return template('template/ok', action=action)
    else:
        return template('template/no')

@route('/registration')
def reg():
    return template('template/registr')

@route('/registration', method='POST')
def new_user():
    userid = request.forms.code
    fullname = request.forms.fname
    direction = request.forms.direction
    group = request.forms.group
    schoolnum = request.forms.schoolnum
    sql.add_user(userid, fullname, direction, group, schoolnum)
    return template('template/ok2')

@route('/in')
def in_build():
    us = sql.get_in()
    user = list(us)
    return template('template/in', user=user)



run(host='localhost', port=8080)
