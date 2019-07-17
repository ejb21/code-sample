document.addEventListener("DOMContentLoaded", function()
{
    document.getElementById('cust-name').textContent = localStorage.getItem('name');
    document.getElementById('pizza-size').textContent = localStorage.getItem('size');
    document.getElementById('pizza-toppings').textContent = localStorage.getItem('toppings');
    document.getElementById('pizza-crust').textContent = localStorage.getItem('crust');
    document.getElementById('pizza-address').textContent = localStorage.getItem('address');
    document.getElementById('pizza-city').textContent = localStorage.getItem('city');
    document.getElementById('cust-phone').textContent = localStorage.getItem('phone');
    document.getElementById('cust-email').textContent = localStorage.getItem('email');
    document.getElementById('pizza-instructions').textContent = localStorage.getItem('instructions');
});