const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const signInForm = document.getElementById('signInForm');
const signUpForm = document.getElementById('signUpForm');

signUpButton.addEventListener('click', function () {
    signInForm.style.display = 'none';
    signUpForm.style.display = 'block';
    
});