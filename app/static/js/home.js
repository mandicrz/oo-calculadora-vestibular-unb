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

document.addEventListener('click', function(event) {
    const userMenu = document.querySelector('.user-menu');
    const userMenuContent = document.querySelector('.user-menu-content');
    const isClickInside = userMenu.contains(event.target);
    
    if (isClickInside) {
        userMenuContent.style.display = userMenuContent.style.display === 'block' ? 'none' : 'block';
    } else {
        userMenuContent.style.display = 'none';
    }
});
