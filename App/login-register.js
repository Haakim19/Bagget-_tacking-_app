const sign_in_button = document.getElementById('sign-in-button');
const sign_up_button = document.getElementById('sign-up-button');
const sign_in_form = document.getElementById('sign-in');
const sign_up_form = document.getElementById('sign-up');

sign_up_button.addEventListener('click',function()
{
    sign_in_form.style.display = 'none';
    sign_up_form.style.display = 'block';
})
sign_in_button.addEventListener('click',function()
{
    sign_up_form.style.display = 'none';
    sign_in_form.style.display = 'block';
})