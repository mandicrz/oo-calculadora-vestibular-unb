from app.controllers.application import Application
from app.controllers.vestibular import Vestibular
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response

vestibular = Vestibular()
app = Bottle()
ctl = Application()


@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

@app.route('/home/<username>', methods=['GET'])
def action_pagina(username=None):
    session_id = ctl.get_session_id()
    if session_id:
        current_username = ctl._model.getUserName(session_id)
        if current_username == username:
            return ctl.render('home', username)
    
    return redirect('/')

@app.route('/', method='GET')
def login():
    return ctl.render('login')

@app.route('/home', method='GET')
def home():
    return ctl.render('home')

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
            redirect(f'/home/{username}')
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
            return redirect ('/')
    
@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/')
    
@app.route('/calcular-argumento', method='GET')
def argumento():
    session_id = ctl.get_session_id()
    if session_id:
        current_username = ctl._model.getUserName(session_id)
        if current_username:
            return ctl.render('calcular-argumento', username=current_username)
    
    return redirect('/')

@app.route('/calcular-argumento', methods=['POST'])
def calcular():
    acertos_ta_estg = int(request.forms.get('acertos_ta_estg', 0))
    erros_ta_estg = int(request.forms.get('erros_ta_estg', 0))
    acertos_tb_estg = int(request.forms.get('acertos_tb_estg', 0))
    acertos_tc_estg = int(request.forms.get('acertos_tc_estg', 0))
    erros_tc_estg = int(request.forms.get('erros_tc_estg', 0))
    acertos_td_estg = int(request.forms.get('acertos_td_estg', 0))
    
    acertos_ta_parte_2 = int(request.forms.get('acertos_ta_parte_2', 0))
    erros_ta_parte_2 = int(request.forms.get('erros_ta_parte_2', 0))
    acertos_tb_parte_2 = int(request.forms.get('acertos_tb_parte_2', 0))
    acertos_tc_parte_2 = int(request.forms.get('acertos_tc_parte_2', 0))
    erros_tc_parte_2 = int(request.forms.get('erros_tc_parte_2', 0))
    acertos_td_parte_2 = int(request.forms.get('acertos_td_parte_2', 0))
    
    acertos_ta_parte_3 = int(request.forms.get('acertos_ta_parte_3', 0))
    erros_ta_parte_3 = int(request.forms.get('erros_ta_parte_3', 0))
    acertos_tb_parte_3 = int(request.forms.get('acertos_tb_parte_3', 0))
    acertos_tc_parte_3 = int(request.forms.get('acertos_tc_parte_3', 0))
    erros_tc_parte_3 = int(request.forms.get('erros_tc_parte_3', 0))
    acertos_td_parte_3 = int(request.forms.get('acertos_td_parte_3', 0))

    notaRedacao = float(request.forms.get('notaRedacao', 0.0))
    lingua = request.forms.get('lingua', 'ingles')

    calcEstg = vestibular.calcEstg(acertos_ta_estg, erros_ta_estg, acertos_tb_estg, acertos_tc_estg, erros_tc_estg, acertos_td_estg)
    calcP2 = vestibular.calcP2(acertos_ta_parte_2, erros_ta_parte_2, acertos_tb_parte_2, acertos_tc_parte_2, erros_tc_parte_2, acertos_td_parte_2)
    calcP3 = vestibular.calcP3(acertos_ta_parte_3, erros_ta_parte_3, acertos_tb_parte_3, acertos_tc_parte_3, erros_tc_parte_3, acertos_td_parte_3)
    
    notaEstg = vestibular.argEstg(calcEstg, lingua)
    notaP2 = vestibular.argP2(calcP2)
    notaP3 = vestibular.argP3(calcP3)
    notaRed = vestibular.argRed(notaRedacao)
    
    argumento_final_gp_1, argumento_final_gp_2 = vestibular.argFinal(notaEstg, notaP2, notaP3, notaRed)

    return ctl.render('calcular-argumento', resultado=argumento_final_gp_1, resultado2=argumento_final_gp_2)


if __name__ == '__main__':

    run(app, host='localhost', port=8080, debug=True)