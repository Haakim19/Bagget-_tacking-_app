

const sign_up_button = document.getElementById('sign-up-button');
const register_button = document.getElementById('registr-button');
const sign_up_form = document.getElementById('sign-up-form');
const register_form = document.getElementById('register-form');

sign_up_button.addEventListener('click', () => {
    sign_up_form.style.display = 'block';
    register_form.style.display = 'none';
});

register_button.addEventListener('click', () => {
    sign_up_form.style.display = 'none';
    register_form.style.display = 'block';
});