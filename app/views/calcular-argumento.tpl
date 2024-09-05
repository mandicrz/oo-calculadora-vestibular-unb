<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcular Argumento Final</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montagu+Slab:opsz,wght@16..144,100..700&display=swap">
</head>
<body>
    <header class="header">
        <h1 class="header-title">Calculadora Vestibular Tradicional UnB</h1>
        <nav class="header-nav">
            <div class="nav-icons">
                <a href="#" id="dark-mode-toggle" class="icon-button" ><img src="/static/img/dark_mode.png" alt=""></a>
                <form action="/home/{{current_user}}" method="GET">
                    <button type="submit" class="icon-button"><img src="/static/img/Home.png" alt=""></button>
                </form>
                <div class="user-menu">
                    <a href="#" class="icon-button"><img src="/static/img/user.png" alt=""></a>
                       <div class="user-menu-content">
                        <form id="logout" action="/editar-informacoes" method="GET">
                            <button type="submit">Editar informações</button>
                        </form>
                        <form id="logout" action="/logout" method="POST">
                            <button type="submit">Logout</button>
                        </form>
                    </div>
                </div>   
            </div>
        </nav>
    </header>

    <form action="/calcular-argumento" method="POST">
        <div class="container">
            <div class="section">
                <h2>Parte 1 | Estrangeira</h2>
                <label>Acertos tipo A</label>
                <input type="number" name="acertos_ta_estg" required>
                <label>Erros tipo A</label>
                <input type="number" name="erros_ta_estg" required>
                <label>Acertos tipo B</label>
                <input type="number" name="acertos_tb_estg" required>
                <label>Erros tipo B</label>
                <input type="number" name="erros_tb_estg" required>
                <label>Acertos tipo C</label>
                <input type="number" name="acertos_tc_estg" required>
                <label>Erros tipo C</label>
                <input type="number" name="erros_tc_estg" required>
                <label>Acertos tipo D</label>
                <input type="number" name="acertos_td_estg" required>
                
                <label>Língua Estrangeira</label>
                <select name="lingua">
                    <option value="ingles">Inglês</option>
                    <option value="espanhol">Espanhol</option>
                    <option value="frances">Francês</option>
                </select>
            </div>
        
            <div class="section">
                <h2>Parte 2 | Humanas</h2>
                <label>Acertos tipo A</label>
                <input type="number" name="acertos_ta_parte_2" required>
                <label>Erros tipo A</label>
                <input type="number" name="erros_ta_parte_2" required>
                <label>Acertos tipo B</B></label>
                <input type="number" name="acertos_tb_parte_2" required>
                <label>Erros tipo B</label>
                <input type="number" name="erros_tb_parte_2" required>
                <label>Acertos tipo C</label>
                <input type="number" name="acertos_tc_parte_2" required>
                <label>Erros tipo C</label>
                <input type="number" name="erros_tc_parte_2" required>
                <label>Acertos tipo D</label>
                <input type="number" name="acertos_td_parte_2" required>
                <label>Nota da Redação</label>
                <input type="number" name="notaRedacao" required>
            </div>
        
            <div class="section">
                <h2>Parte 3 | Exatas</h2>
                <label>Acertos tipo A</label>
                <input type="number" name="acertos_ta_parte_3" required>
                <label>Erros tipo A</label>
                <input type="number" name="erros_ta_parte_3" required>
                <label>Acertos tipo B</label>
                <input type="number" name="acertos_tb_parte_3" required>
                <label>Erros tipo B</label>
                <input type="number" name="erros_tb_parte_3" required>
                <label>Acertos tipo C</label>
                <input type="number" name="acertos_tc_parte_3" required>
                <label>Erros tipo C</label>
                <input type="number" name="erros_tc_parte_3" required>
                <label>Acertos tipo D</label>
                <input type="number" name="acertos_td_parte_3" required>
            </div>
        </div>

        <button type="submit" class="submit-button">Calcular</button>

    </form>
    
    %if transfered:
    <div class="result-container">
        <p>O seus argumentos são:</p>
        <div class="result">Grupo 1: {{resultado}} e Grupo 2: {{resultado2}} </div>
    </div>
        
    %end
    <script src="/static/js/index.js"></script>
</body>
</html>