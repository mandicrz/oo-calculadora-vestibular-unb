from app.controllers.db.dataRecord import DataRecord
from bottle import template, request, response
class Application():

    def __init__(self):

        self.pages = {
            'home': self.home,
            'login': self.login
        }

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
        return template('app/views/html/login')

    def home(self,username=None):
        if self.is_authenticated(username):
            session_id= self.get_session_id()
            user = self._model.getCurrentUser(session_id)
            return template('app/views/html/home', \
            transfered=True, current_user=user)
        else:
            return template('app/views/html/home', \
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