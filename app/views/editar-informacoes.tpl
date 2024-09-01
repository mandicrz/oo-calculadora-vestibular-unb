<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configurações da Conta</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montagu+Slab:opsz,wght@16..144,100..700&display=swap">
    <style>
    :root {
    --background-color: #d9d9d9;
    --background-color2: #525b4e3b;
    --text-color: #fff;
    --text-color2: #3a4137;
    --header-color: #3a4137;
    --itens: #3a4137;
    }

    body {
        font-family: "Montagu Slab", serif;
        background-color: var(--background-color);
        color: var(--text-color);
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        transition: background-color 0.3s, color 0.3s;
        display: flex;
        justify-content: center;
        align-items: center; 
        min-height: 100vh;
    }

    .container {
        max-width: 400px; 
        width: 100%;
        padding: 20px;
        background-color: var(--background-color2);
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 0 auto; 
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-size: 16px;
        color: var(--text-color2);
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    button {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        border: 1px solid var(--itens);
        background-color: var(--background-color);
        color: var(--text-color2);
    }

    input[readonly] {
        background-color: var(--background-color2);
        cursor: not-allowed;
    }

    button {
        background-color: var(--header-color);
        color: var(--text-color);
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 10px; 
    }

    button:hover {
        background-color: var(--text-color2);
    }

    .header-title {
        margin: 0 0 20px;
        color: var(--header-color);
        text-align: center; 
    }

    </style>
</head>
<body>
    
    <div class="container">
        <h1 class="header-title">Editar Informações da Conta</h1>
    
        <form action="/editar-informacoes" method="POST">
            <div class="form-group">
                <label for="current-username">Usuário Atual:</label>
                <input type="text" id="current-username" name="current_username" value="{{ user.username }}" readonly>
            </div>
            <div class="form-group">
                <label for="current-password">Senha Atual:</label>
                <input type="text" id="current-password" name="current_password" value="{{ user.password }}" readonly>
            </div>
            <div class="form-group">
                <label for="current-email">Email Atual:</label>
                <input type="email" id="current-email" name="current_email" value="{{ user.email }}" readonly>
            </div>
            <div class="form-group">
                <label for="new-username">Novo Usuário:</label>
                <input type="text" id="new-username" name="new_username">
            </div>
            <div class="form-group">
                <label for="new-password">Nova Senha:</label>
                <input type="password" id="new-password" name="new_password">
            </div>
            <div class="form-group">
                <label for="new-email">Novo Email:</label>
                <input type="email" id="new-email" name="new_email">
            </div>
            <button type="submit">Salvar Alterações</button>
        </form>
        <h2 class="header-title">Argumentos Salvos</h2>
        
        <div class="form-group">
            <label for="argGrupo1">Argumentos Grupo 1:</label>
            <input type="text" id="argGrupo1" value="{{user.argGrupo1}}" readonly>
        </div>
        
        <div class="form-group">
            <label for="argGrupo2">Argumentos Grupo 2:</label>
            <input type="text" id="argGrupo2" value="{{user.argGrupo2}}" readonly>
        </div>

        <form action="/remover-argumentos" method="POST">
            <button type="submit">Remover Argumentos</button>
        </form>
    </div>
</body>
</html>