<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montagu+Slab:opsz,wght@16..144,100..700&display=swap">
    
</head>
<body>
    <header class="header">
        <h1 class="header-title">Calculadora Vestibular Tradicional UnB</h1>
        <nav class="header-nav">
            <div class="nav-icons">
                <a href="#" id="dark-mode-toggle" class="icon-button" ><img src="/static/img/dark_mode.png" alt=""></a>
                <form  action="/home/{{current_user.username}}" method="GET">
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

    % if transfered:
    <main class="main-content">
        <section class="intro">
            <h2 class="intro-title">Bem vindo(a), {{current_user.username}}</h2>
            <p class="intro-text">Essa é uma calculadora destinada aos estudantes que irão prestar o vestibular da UnB</p>
            <h3 class="intro-subtitle">Explore nossas funcionalidades:</h3>
        </section>
            
        <section class="features">
            <form action="/calcular-argumento" method="GET">
                <button type="submit" class="feature-item" >Calcular Argumento Final</button>
            </form>

            <form action="/notas-corte" method="GET">
                <button type="submit" class="feature-item" >Notas de Corte</button>
            </form>
            <form action="/passou" method="GET">
                <button type="submit" class="feature-item" >Verificar se Passou</button>
            </form>
        </section>

        <div class="info-section">
            <section class="faq">
                <h3 class="faq-title">dúvidas gerais</h3>
                <div class="faq-item">
                    <h4 class="faq-question">Title <button class="arrow">▼</button></h4>
                    <p class="faq-answer">Answer the frequently asked question in a simple sentence, a longish paragraph, or even in a list.</p>
                </div>
                <div class="faq-item">
                    <h4 class="faq-question">Title
                        <span class="arrow">▼</span>
                    </h4>
                    <p class="faq-answer">Answer the frequently asked question in a simple sentence, a longish paragraph, or even in a list.</p>
                </div>
                <div class="faq-item">
                    <h4 class="faq-question">Title
                        <span class="arrow">▼</span>
                    </h4>
                    <p class="faq-answer">Answer the frequently asked question in a simple sentence, a longish paragraph, or even in a list.</p>
                </div>
                <div class="faq-item">
                    <h4 class="faq-question">Title
                        <span class="arrow">▼</span>
                    </h4>
                    <p class="faq-answer">Answer the frequently asked question in a simple sentence, a longish paragraph, or even in a list.</p>
                </div>
                
                
            </section>

            <section class="about">
                <h3 class="about-title">sobre nós</h3>
                <h4 class="about-text" style="text-align: start; margin-left: 230px;">Amanda Cruz Lima</h4>
                <div class="about-item">
                    <div class="circle"><img class="perfil-img" src="/static/img/amanda.jpg" alt=""></div>
                    <p class="about-text">&numsp;&numsp;Estudante do 3° semestre de Engenharia de Software na Universidade de Brasília, com 19 anos. Apesar de estar mergulhada no mundo da tecnologia, o HTML ainda é um mistério para mim. Apaixonada pelo Vasco, sempre dou um jeito de torcer pelo meu time enquanto aprendo mais sobre programação </p>
                </div>
                <h4 class="about-text" style="text-align: start; margin-left: 230px;">Isaque C. Nascimento</h4>
                <div class="about-item">
                    <div class="circle"><img class="perfil-img" src="/static/img/isaque.jpg" alt=""></div>
                    <p class="about-text">&numsp;&numsp;Olá! Sou um graduando de Engenharia de Software na Universidade de Brasília (UnB). Como santista estou acostumado com adversidades, minha maior batalha não é codificar soluções complexas, mas sim escolher cores no CSS.</p>
                </div>
            </section>
        </div>
    </main>
    %end
    <script src="/static/js/index.js"></script>
</body>
</html>