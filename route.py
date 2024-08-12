from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response


app = Bottle()
ctl = Application()


@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

@app.route('/helper')
def helper():
    return ctl.render('helper')

@app.route('/pagina', methods=['GET'])
@app.route('/pagina/<username>', methods=['GET'])
def action_pagina(username=None):
    if not username:
        return ctl.render('pagina')
    else:
        return ctl.render('pagina',username)


@app.route('/login', method='GET')
def login():
    return ctl.render('login')


@app.route('/login', method='POST')
def action_login(): 
    username = request.forms.get('username') 
    password = request.forms.get('password') 
    
    control = ctl.authenticate_user(username, password) 
    
    if control is not None: 
        session_id, username = control
        response.set_cookie('session_id', session_id, httponly=True, secure=True, max_age=3600)
        redirect(f'/pagina/{username}')
    else: 
        return redirect('/login')
    
@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/helper')




if __name__ == '__main__':

    run(app, host='localhost', port=8080, debug=True)