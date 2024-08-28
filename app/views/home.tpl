<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora Vestibular Tradicional UnB</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montagu+Slab:opsz,wght@16..144,100..700&display=swap">
    <script src="../../static/js/index.js" defer></script>
    
</head>
<body>
    <header class="header">
        <h1 class="header-title">Calculadora Vestibular Tradicional UnB</h1>
        <nav class="header-nav">
            <div class="nav-icons">
                <a href="#" id="dark-mode-toggle" class="icon-button" ><img src="/static/img/dark_mode.png" alt=""></a>
                <form class="icon-button" action="/home/{{current_user.username}}" method="GET">
                    <button type="submit"><img src="/static/img/Home.png" alt=""></button>
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
            <div class="feature-item">
                <form action="/calcular-argumento" method="GET">
                    <button type="submit">Calcular argumento</button>
                </form>
            </div>
            <div class="feature-item">
                <a href="notas_corte.html" class="feature-button">Notas de corte</a>
            </div>
            <div class="feature-item">
                <a href="argumento_salvo.html" class="feature-button">Argumentos salvos</a>
            </div>
            <div class="feature-item">
                <a href="passou.html" class="feature-button">Verificar se passou</a>
            </div>
        </section>

        <div class="info-section">
            <section class="faq">
                <h3 class="faq-title">dúvidas gerais</h3>
                <div class="faq-item">
                    <h4 class="faq-question">Title <span class="arrow">▼</span></h4>
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
                <div class="about-item">
                    <div class="circle"></div>
                    <p class="about-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
                <div class="about-item">
                    <div class="circle"></div>
                    <p class="about-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
            </section>
        </div>
    </main>
    %end

</body>
</html>
