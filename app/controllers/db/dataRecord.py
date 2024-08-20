from app.models.userAccount import UserAccount
import json
import uuid

class DataRecord():
    #Banco de dados JSON
    
    def __init__(self):

        self.__user_accounts= []
        self.__authenticated_users = {}
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/user_accounts.json", "r") as arquivo_json:
                # Verifica se o arquivo está vazio
                content = arquivo_json.read().strip()
                if not content:
                    self.__user_accounts = []
                else:
                    user_data = json.loads(content)
                    self.__user_accounts = [UserAccount(**data) for data in user_data]
        except FileNotFoundError:
            self.write()

    def write(self):
        with open("app/controllers/db/user_accounts.json", "w") as arquivo_json:
            user_data = [vars(user_account) for user_account in self.__user_accounts]
            json.dump(user_data, arquivo_json, indent=4)

    def book(self,username,password, email):
        if self.getUserSessionId(username) is not None:
            raise ValueError("Username already exists.")
        
        new_user = UserAccount(username, password, email)
        self.__user_accounts.append(new_user)
        self.write()


    def getCurrentUser(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id]
        else:
            return None


    def getUserName(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id].username
        else:
            return None


    def getUserSessionId(self, username):
        for session_id in self.__authenticated_users:
            if username == self.__authenticated_users[session_id].username:
                return session_id
        return None  # Retorna None se o usuário não for encontrado


    def checkUser(self, username, password):
        for user in self.__user_accounts:
            if user.username == username and user.password == password:
                session_id = str(uuid.uuid4())  # Gera um ID de sessão único
                self.__authenticated_users[session_id] = user
                return session_id  # Retorna o ID de sessão para o usuário
        return None


    def logout(self, session_id):
        if session_id in self.__authenticated_users:
            del self.__authenticated_users[session_id] # Remove o usuário logado