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
