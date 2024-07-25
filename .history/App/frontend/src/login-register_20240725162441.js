const signUpButton = document.getElementById('sign-up');
const signInButton = document.getElementById('sign-in');
const signInForm = document.getElementById('signInForm');
const signUpForm = document.getElementById('signUpForm');

signUpButton.addEventListener('click', function () {
    signInForm.style.display = 'none';
    signUpForm.style.display = 'block';
    
});