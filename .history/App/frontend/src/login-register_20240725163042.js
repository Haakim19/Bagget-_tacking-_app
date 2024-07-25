

document.addEventListener('DOMContentLoaded', (event) => {
    const signInForm = document.getElementById('sign-up');
    const registerForm = document.getElementById('sign-in');
    const signInLink = document.getElementById('loginLink');
    const registerLink = document.getElementById('signInLink');

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