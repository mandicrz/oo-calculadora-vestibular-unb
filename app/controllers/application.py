from app.controllers.db.dataRecord import DataRecord
from app.controllers.vestibular import Vestibular
from bottle import template, request, response
class Application():

    def __init__(self):

        self.pages = {
            'home': self.home,
            'login': self.login,
            'calcular-argumento': self.calcular_argumento
        }
        self.vestibular = Vestibular()
        self._model= DataRecord()
        self._current_username = None

    def render(self,page,parameter=None):
        content = self.pages.get(page, self.login)
        if not parameter:
            return content()
        else:
            return content(parameter)

    def get_session_id(self):
        return request.get_cookie('session_id')

    def login(self):
        return template('app/views/login')

    def home(self,username=None):
        if self.is_authenticated(username):
            session_id= self.get_session_id()
            user = self._model.getCurrentUser(session_id)
            return template('app/views/home', \
            transfered=True, current_user=user)
        else:
            return template('app/views/home', \
            transfered=False)


    def is_authenticated(self, username):
        session_id = self.get_session_id()
        current_username = self._model.getUserName(session_id)
        return username == current_username


    def authenticate_user(self, username, password):
        session_id = self._model.checkUser(username, password)
        if session_id:
            self.logout_user()
            self._current_username= self._model.getUserName(session_id)
            if username == "admin":
                return session_id, "admin"
            return session_id, username
        return None


    def logout_user(self):
        self._current_username= None
        session_id = self.get_session_id()
        if session_id:
            self._model.logout(session_id)
            response.delete_cookie('session_id')

    def register_user(self, username, password, email):
        if self._model.getUserSessionId(username) is not None:
            raise ValueError("Nome de usuário já existe.")

        self._model.book(username, password, email)
        
    def calcular_argumento(self):
        acertos_ta_estg = int(request.forms.get('acertos_ta_estg') or 0)
        erros_ta_estg = int(request.forms.get('erros_ta_estg') or 0)
        acertos_tb_estg = int(request.forms.get('acertos_tb_estg') or 0)
        acertos_tc_estg = int(request.forms.get('acertos_tc_estg') or 0)
        erros_tc_estg = int(request.forms.get('erros_tc_estg') or 0)
        acertos_td_estg = int(request.forms.get('acertos_td_estg') or 0)
        
        acertos_ta_parte_2 = int(request.forms.get('acertos_ta_parte_2') or 0)
        erros_ta_parte_2 = int(request.forms.get('erros_ta_parte_2') or 0)
        acertos_tb_parte_2 = int(request.forms.get('acertos_tb_parte_2') or 0)
        acertos_tc_parte_2 = int(request.forms.get('acertos_tc_parte_2') or 0)
        erros_tc_parte_2 = int(request.forms.get('erros_tc_parte_2') or 0)
        acertos_td_parte_2 = int(request.forms.get('acertos_td_parte_2') or 0)
        
        acertos_ta_parte_3 = int(request.forms.get('acertos_ta_parte_3') or 0)
        erros_ta_parte_3 = int(request.forms.get('erros_ta_parte_3') or 0)
        acertos_tb_parte_3 = int(request.forms.get('acertos_tb_parte_3') or 0)
        acertos_tc_parte_3 = int(request.forms.get('acertos_tc_parte_3') or 0)
        erros_tc_parte_3 = int(request.forms.get('erros_tc_parte_3') or 0)
        acertos_td_parte_3 = int(request.forms.get('acertos_td_parte_3') or 0)

        notaRedacao = float(request.forms.get('notaRedacao') or 0.0)
        lingua = request.forms.get('lingua')

        calcEstg = self.vestibular.calcEstg(acertos_ta_estg, erros_ta_estg, acertos_tb_estg, acertos_tc_estg, erros_tc_estg, acertos_td_estg)
        calcP2 = self.vestibular.calcP2(acertos_ta_parte_2, erros_ta_parte_2, acertos_tb_parte_2, acertos_tc_parte_2, erros_tc_parte_2, acertos_td_parte_2)
        calcP3 = self.vestibular.calcP3(acertos_ta_parte_3, erros_ta_parte_3, acertos_tb_parte_3, acertos_tc_parte_3, erros_tc_parte_3, acertos_td_parte_3)
        
        notaEstg = self.vestibular.argEstg(calcEstg, lingua)
        notaP2 = self.vestibular.argP2(calcP2)
        notaP3 = self.vestibular.argP3(calcP3)
        notaRed = self.vestibular.argRed(notaRedacao)
    
        return self.vestibular.argFinal(notaEstg, notaP2, notaP3, notaRed)