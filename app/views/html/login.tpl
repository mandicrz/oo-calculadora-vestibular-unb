<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="/" method="post">
        <input type="hidden" name="action" value="login">
        <label for="username">Nome:</label>
        <input id="username" name="username" type="text" required /><br>

        <label for="password">Senha:</label>
        <input id="password" name="password" type="password" required /><br>

        <input value="Login" type="submit" />
    </form>
    <form action="/logout" method="post">
        <button type="submit">Logout</button>
    </form>
    
    <h1>Cadastro</h1>
    <form action="/" method="post">
        <input type="hidden" name="action" value="register">
        <label for="email">Email:</label>
        <input id="email" name="email" type="text" required /><br>

        <label for="username">Nome:</label>
        <input id="username" name="username" type="text" required /><br>

        <label for="password">Senha:</label>
        <input id="password" name="password" type="password" required /><br>

        <input value="Cadastro" type="submit" />
    </form>
    
</body>
</html>