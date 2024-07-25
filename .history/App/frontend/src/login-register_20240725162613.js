const signUpButton = document.getElementById('sign-up');
const signInButton = document.getElementById('sign-in');
const signUpForm = document.getElementById('signUpForm');

signUpButton.addEventListener('click', function () {
    signInForm.style.display = 'none';
    signUpForm.style.display = 'block';
    
});

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