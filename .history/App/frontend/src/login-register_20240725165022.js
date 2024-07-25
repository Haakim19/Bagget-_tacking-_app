document.addEventListener('DOMContentLoaded', (event) => {
    const signUpForm = document.getElementById('sign-up');
    const signInForm = document.getElementById('sign-in');
    const signUpButton = document.getElementById('sign-up-button');
    const signInButton = document.getElementById('sign-in-button');

    signUpButton.addEventListener('click', (e) => {
        e.preventDefault();
        signUpForm.style.display = 'none';
        signInForm.style.display = 'block';
    });

    signInButton.addEventListener('click', (e) => {
        e.preventDefault();
        signUpForm.style.display = 'block';
        signInForm.style.display = 'none';
    });
});