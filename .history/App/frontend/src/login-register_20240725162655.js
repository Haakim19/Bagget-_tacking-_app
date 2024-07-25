

document.addEventListener('DOMContentLoaded', (event) => {
    const signInForm = document.getElementById('signInForm');
    const registerForm = document.getElementById('registerForm');
    const signInLink = document.getElementById('signInLink');
    const registerLink = document.getElementById('registerLink');

    signInLink.addEventListener('click', (e) => {
        e.preventDefault();
        signInForm.style.display = 'block';
        registerForm.style.display = 'none';
    });

    registerLink.addEventListener('click', (e) => {
        e.preventDefault();
        signInForm.style.display = 'none';
        registerForm.style.display = 'block';
    });
});