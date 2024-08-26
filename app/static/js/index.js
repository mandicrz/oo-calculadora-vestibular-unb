document.addEventListener('DOMContentLoaded', () => {
    const userIcon = document.querySelector('.user-icon');
    const userMenuContent = document.querySelector('.user-menu-content');

    userIcon.addEventListener('click', (event) => {
        event.preventDefault();
        userMenuContent.classList.toggle('show');
    });

    window.addEventListener('click', (event) => {
        if (!userIcon.contains(event.target) && !userMenuContent.contains(event.target)) {
            userMenuContent.classList.remove('show');
        }
    });
});


document.addEventListener('DOMContentLoaded', () => {
    const darkModeToggle = document.querySelector('#dark-mode-toggle');
    
    if (!darkModeToggle) {
        console.error('Elemento com ID #dark-mode-toggle não encontrado.');
        return; // Interrompe a execução do script aqui.
    }

    const currentMode = localStorage.getItem('darkMode') || 'light';

    if (currentMode === 'dark') {
        document.body.classList.add('dark-mode');
    }

    darkModeToggle.addEventListener('click', (event) => {
        event.preventDefault();
        document.body.classList.toggle('dark-mode');
        const mode = document.body.classList.contains('dark-mode') ? 'dark' : 'light';
        localStorage.setItem('darkMode', mode);
    });
});


document.addEventListener("DOMContentLoaded", function() {
    const faqQuestions = document.querySelectorAll(".faq-question");

    faqQuestions.forEach((question) => {
        question.addEventListener("click", () => {
            const answer = question.nextElementSibling;
            answer.classList.toggle("active");
            if (answer.classList.contains("active")) {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        });
    });
});
