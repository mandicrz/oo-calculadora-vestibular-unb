# from vestibular import Vestibular

class UserAccount():
    def __init__(self, username, password, email, argGrupo1=None, argGrupo2=None):
        self.username= username
        self.password= password
        self.email= email
        self.argGrupo1 = argGrupo1 if argGrupo1 is not None else []
        self.argGrupo2 = argGrupo2 if argGrupo2 is not None else []
        