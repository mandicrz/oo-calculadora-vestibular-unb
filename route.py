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
    session_id = ctl.get_session_id()
    if session_id:
        current_username = ctl._model.getUserName(session_id)
        if current_username == username:
            return ctl.render('pagina', username)
    
    return redirect('/')


@app.route('/', method='GET')
def login():
    return ctl.render('login')

@app.route('/', method='POST')
def home_post():
    action = request.forms.get('action')
    
    if action == 'login':
        username = request.forms.get('username')
        password = request.forms.get('password')
        control = ctl.authenticate_user(username, password)
        
        if control is not None:
            session_id, username = control
            response.set_cookie('session_id', session_id, httponly=True, secure=True, max_age=3600)
            redirect(f'/pagina/{username}')
        else:
            return redirect('/')

    elif action == 'register':
        username = request.forms.get('username')
        password = request.forms.get('password')
        email = request.forms.get('email')

        if not username or not password or not email:
            return "Todos os campos são obrigatórios."
        
        try:
            ctl.register_user(username, password, email)
            return redirect('/')
        except ValueError as e:
            return f"Erro: {e}"

    
# @app.route('/register', method='POST')
# def action_register():
#     username = request.forms.get('username')
#     password = request.forms.get('password')
#     email = request.forms.get('email')

#     if not username or not password or not email:
#         return "Todos os campos são obrigatórios."
    
#     try:
#         ctl.register_user(username, password, email)
#         return redirect('/')
#     except ValueError as e:
#         return f"Erro: {e}"
    
@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/')

if __name__ == '__main__':

    run(app, host='localhost', port=8080, debug=True)