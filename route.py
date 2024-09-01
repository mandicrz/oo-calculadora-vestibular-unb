from app.controllers.application import Application
from app.controllers.vestibular import Vestibular
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response

vestibular = Vestibular()
app = Bottle()
ctl = Application()
# -------------------------------------------------------------------

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

# -------------------------------------------------------------------

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
            if username == "admin" and password == "vascodagama":
                redirect('/admin')
            else:
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
            
            session_id = ctl.get_session_id()
            current_username = ctl._model.getUserName(session_id)
            
            if current_username == "admin":
                return redirect('/admin')
            else:
                return redirect('/')
            
        except ValueError as e:
            return redirect ('/')
        
# -------------------------------------------------------------------

@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/')
    
# -------------------------------------------------------------------

@app.route('/admin', method='GET')
def admin_page():
    if ctl.is_authenticated('admin'):
        users = ctl.get_all_users()
        return template('app/views/admin', users=users)
    return redirect('/')

@app.route('/admin/remove_user', method='POST')
def remove_user():
    if ctl.is_authenticated('admin'):
        ctl.remove_user(request.forms.get('username'))
        return redirect('/admin')
    return redirect('/')

@app.route('/admin/edit_user', method='POST')
def edit_user():
    if ctl.is_authenticated('admin'):
        ctl.edit_user(
            request.forms.get('username'),
            request.forms.get('new_username'),
            request.forms.get('new_password'),
            request.forms.get('new_email')
        )
        return redirect('/admin')
    return "Erro ao editar usuário."

# -------------------------------------------------------------------

@app.route('/home/<username>', methods=['GET'])
def home_page(username):
    authenticated_user = ctl.get_authenticated_user()
    if authenticated_user == username:
        return ctl.render('home', username)
    return redirect('/')
# -------------------------------------------------------------------
@app.route('/calcular-argumento', method='GET')
def calcular_arg():
    current_user = ctl.get_authenticated_user()
    if current_user:
        return template('app/views/calcular-argumento',
                        resultado=None, resultado2=None,
                        transfered=True, 
                        current_user=current_user)

@app.route('/calcular-argumento', method= 'POST')
def calcular():
    argumento_final_gp_1, argumento_final_gp_2 = ctl.calcular_argumento()
    
    current_user = ctl.get_authenticated_user()
    if current_user:
        return template('app/views/calcular-argumento', 
                        resultado=argumento_final_gp_1, 
                        resultado2=argumento_final_gp_2, 
                        transfered=True, 
                        current_user=current_user)
    return redirect ('/')
# -------------------------------------------------------------------
@app.route('/notas-corte', method='GET')
def notas():
    if ctl.get_authenticated_user():
        return ctl.notas_corte()
    return redirect('/')
# -------------------------------------------------------------------
@app.route('/passou', method='GET')
def passou():
    current_user = ctl.get_authenticated_user()
    if current_user:
        return ctl.passou()
    return redirect('/')

@app.route('/passou', method='POST')
def passou_post():
    current_user = ctl.get_authenticated_user()
    if current_user:
        return ctl.passou()
    return redirect('/')
# -------------------------------------------------------------------
@app.route('/editar-informacoes', method='GET')
def editar_informacoes():
    current_user = ctl.get_authenticated_user()
    if current_user:
        user = ctl._model.getCurrentUser(ctl.get_session_id())
        return template('app/views/editar-informacoes', user=user, current_user=current_user)  
    return redirect ('/')

@app.route('/editar-informacoes', method='POST')
def editar_informacoes():
    current_user = ctl.get_authenticated_user()
    if current_user:
        return ctl.editar_informacoes()
    return redirect ('/')
# -------------------------------------------------------------------

if __name__ == '__main__':

    run(app, host='localhost', port=8080, debug=True)
    