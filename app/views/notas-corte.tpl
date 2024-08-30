<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notas de Corte</title>
    <link rel="stylesheet" type="text/css" href="/static/css/notas-corte.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montagu+Slab:opsz,wght@16..144,100..700&display=swap">
    <script src="/static/js/index.js"></script>
    
</head>
<body>
    <header class="header">
        <h1 class="header-title">Calculadora Vestibular Tradicional UnB</h1>
        <nav class="header-nav">
            <div class="nav-icons">
                <a href="#" id="dark-mode-toggle" class="icon-button" ><img src="/static/img/dark_mode.png" alt=""></a>
                <form  action="/home/{{current_user}}" method="GET">
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

    <div>
        <table class="tabela">
            <tr>
                <th colspan="4">&nbsp;</th>
                <th colspan="8">Sistema de Cotas Para Escolas Públicas</th>
                <th >&nbsp;</th>
            </tr>
            <tr>
                <th colspan="3">&nbsp;</th>
                <th >Sistema de Cotas Para Negros</th>
                <th colspan="4">Renda <= 1.5 Salário Mínimo</th>
                <th colspan="4">Renda >= 1.5 Salário Mínimo</th>
                <th>Sistema Universal</th>
            </tr>
            <tr>
                <th>Campus</th>
                <th>Turno</th>
                <th>Curso</th>
                <th>Min</th>
                <th>Min(PPI)</th>
                <th>Min(PPI) PCD</th>
                <th>Min(Não PPI)</th>
                <th>Min(Não PPI) PCD</th>
                <th>Min(PPI)</th>
                <th>Min(PPI) PCD</th>
                <th>Min(Não PPI)</th>
                <th>Min(Não PPI) PCD</th>
                <th>Min</th>
            </tr>
            
        % for notas in notaCorte:
            <tr>

                <td>{{notas[0]}}</td>
                <td>{{notas[1]}}</td>
                <td>{{notas[2]}}</td>
                <td>{{notas[3]}}</td>
                <td>{{notas[5]}}</td>
                <td>{{notas[7]}}</td>
                <td>{{notas[9]}}</td>
                <td>{{notas[11]}}</td>
                <td>{{notas[13]}}</td>
                <td>{{notas[15]}}</td>
                <td>{{notas[17]}}</td>
                <td>{{notas[19]}}</td>
                <td>{{notas[21]}}</td>
                
            </tr>
        % end 
        </table>
    <div/>


</body>
</html>