var counter = 0;

document.addEventListener("DOMContentLoaded", function()
{
    document.getElementById('nameinput').addEventListener('focusout', validateName);
    document.getElementById('addrinput').addEventListener('focusout', validateAddress);
    document.getElementById('cityinput').addEventListener('focusout', validateCity);
    document.getElementById('emailinput').addEventListener('focusout', validateEmail);
    document.getElementById('phoneinput').addEventListener('focus', phoneInit);
    document.getElementById('phoneinput').addEventListener('keydown', lintPhone);
    document.getElementById('phoneinput').addEventListener('keyup', lintPhone);
    document.getElementById('phoneinput').addEventListener('focusout', validatePhone);
    document.getElementById('thin').addEventListener('click', validateCrust);
    document.querySelector('label[for="thin"]').addEventListener('click', validateCrust);
    document.getElementById('thick').addEventListener('click', validateCrust);
    document.querySelector('label[for="thick"]').addEventListener('click', validateCrust);
    document.getElementById('size').addEventListener('change', validateSize);
    document.getElementById('cheese').addEventListener('mousedown', validateCheese);
    document.querySelector('label[for="cheese"]').addEventListener('mousedown', validateCheese);
});

function validateName()
{
    var name = document.getElementById('nameinput');
    var namevalid = document.getElementById('namevalid');
    
    if (name.value.length < 2 || name.value.match(/\d+/g))
    {
        namevalid.classList.remove('good');
        namevalid.classList.add('bad');

        if (namevalid.classList.contains('hidden'))
        {
            namevalid.classList.remove('hidden');
            namevalid.classList.add('visible');
        }
        namevalid.textContent = "Name input is invalid!";
        return false;
    }
    else
    {
        namevalid.classList.remove('bad');
        namevalid.classList.add('good');

        if (namevalid.classList.contains('hidden'))
        {
            namevalid.classList.remove('hidden');
            namevalid.classList.add('visible');
        }

        namevalid.textContent = "Name input is valid!";
        localStorage.setItem('name', name.value);
        return true;
    }
}

function validateAddress()
{
    var address = document.getElementById('addrinput');
    var addrvalid = document.getElementById('addrvalid');
    
    if (!address.value.match(/^\d{1,5} [a-zA-Z0-9.,\- ]{2,} [a-zA-Z0-9.,\- ]{2,}$/))
    {
        addrvalid.classList.remove('good');
        addrvalid.classList.add('bad');

        if (addrvalid.classList.contains('hidden'))
        {
            addrvalid.classList.remove('hidden');
            addrvalid.classList.add('visible');
        }
        addrvalid.textContent = "Address input is invalid!";
        return false;
    }
    else
    {
        addrvalid.classList.remove('bad');
        addrvalid.classList.add('good');

        if (addrvalid.classList.contains('hidden'))
        {
            addrvalid.classList.remove('hidden');
            addrvalid.classList.add('visible');
        }

        addrvalid.textContent = "Address input is valid!";
        localStorage.setItem('address', address.value);
        return true;
    }
}

function validateCity()
{
    var city = document.getElementById('cityinput');
    var cityvalid = document.getElementById('cityvalid');
    
    if (city.value.length < 3 || !city.value.match(/^[a-zA-Z.\-, ]*$/))
    {
        cityvalid.classList.remove('good');
        cityvalid.classList.add('bad');

        if (cityvalid.classList.contains('hidden'))
        {
            cityvalid.classList.remove('hidden');
            cityvalid.classList.add('visible');
        }
        cityvalid.textContent = "City input is invalid!";
        return false;
    }
    else
    {
        cityvalid.classList.remove('bad');
        cityvalid.classList.add('good');

        if (cityvalid.classList.contains('hidden'))
        {
            cityvalid.classList.remove('hidden');
            cityvalid.classList.add('visible');
        }

        cityvalid.textContent = "City input is valid!";
        localStorage.setItem('city', city.value);
        return true;
    }
}

function validateEmail()
{
    var email = document.getElementById('emailinput');
    var emailvalid = document.getElementById('emailvalid');
    
    if (email.value.length < 3 || !email.value.match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/))
    {
        emailvalid.classList.remove('good');
        emailvalid.classList.add('bad');

        if (emailvalid.classList.contains('hidden'))
        {
            emailvalid.classList.remove('hidden');
            emailvalid.classList.add('visible');
        }
        emailvalid.textContent = "Email input is invalid!";
        return false;
    }
    else
    {
        emailvalid.classList.remove('bad');
        emailvalid.classList.add('good');

        if (emailvalid.classList.contains('hidden'))
        {
            emailvalid.classList.remove('hidden');
            emailvalid.classList.add('visible');
        }

        emailvalid.textContent = "Email input is valid!";
        localStorage.setItem('email', email.value);
        return true;
    }
}

function phoneInit()
{
    var phone = document.getElementById('phoneinput');
    if (phone.value == "") phone.value = "(";
}

function lintPhone(event)
{
    var phone = document.getElementById('phoneinput');

    if (isNaN(phone.value.charAt(phone.value.length-1)))
    {
        phone.value = "" + phone.value.substring(0, phone.value.length - 1);
    }

    if (phone.value == "")
    {
        phone.value += "(";
    }

    if (phone.value.length == 4)
    {
        phone.value += ")";
    }

    if (phone.value.length == 8)
    {
        phone.value += "-";
    }
}

function validatePhone()
{
    var phone = document.getElementById('phoneinput');
    var phonevalid = document.getElementById('phonevalid');
    
    if (phone.value.length < 3 || !phone.value.match(/^\(\d{3}\)\d{3}-\d{4}$/))
    {
        phonevalid.classList.remove('good');
        phonevalid.classList.add('bad');

        if (phonevalid.classList.contains('hidden'))
        {
            phonevalid.classList.remove('hidden');
            phonevalid.classList.add('visible');
        }
        phonevalid.textContent = "Phone input is invalid!";
        return false;
    }
    else
    {
        phonevalid.classList.remove('bad');
        phonevalid.classList.add('good');

        if (phonevalid.classList.contains('hidden'))
        {
            phonevalid.classList.remove('hidden');
            phonevalid.classList.add('visible');
        }

        phonevalid.textContent = "Phone input is valid!";
        localStorage.setItem('phone', phone.value);
        return true;
    }
}

function validateCrust()
{
    var crust = document.getElementsByName('crust');
    var crustvalid = document.getElementById('crustvalid');
    var valid = false;

    for (var i = 0; i < crust.length; i++)
    {
        if (crust[i].checked) valid = true;
    }

    if (!valid)
    {
        crustvalid.classList.remove('good');
        crustvalid.classList.add('bad');
        crustvalid.classList.remove('hidden');
        crustvalid.classList.add('visible');
        crustvalid.style.marginTop = "10px";

        crustvalid.textContent = "Please select a crust!"
        return false;
    }
    else
    {
        crustvalid.classList.remove('bad');
        crustvalid.classList.add('good');
        crustvalid.classList.remove('hidden');
        crustvalid.classList.add('visible');
        crustvalid.style.marginTop = "10px";
        
        crustvalid.textContent = "Thank you!";
        if (document.getElementById('thin').checked)
            localStorage.setItem('crust', 'Thin');
        if (document.getElementById('thick').checked)
            localStorage.setItem('crust', 'Thick');
        return true;
    }
}

function validateSize()
{
    var size = document.getElementById('size');
    var sizevalid = document.getElementById('sizevalid');

    if (size.value == "none")
    {
        sizevalid.classList.remove('good');
        sizevalid.classList.add('bad');
        sizevalid.classList.remove('hidden');
        sizevalid.classList.add('visible');
        sizevalid.style.marginTop = "10px";

        sizevalid.textContent = "Please select a size!"
        return false;
    }
    else
    
        sizevalid.classList.remove('bad');
        sizevalid.classList.add('good');{
        sizevalid.classList.remove('hidden');
        sizevalid.classList.add('visible');
        sizevalid.style.marginTop = "10px";
            
        sizevalid.textContent = "Thank you!";
        localStorage.setItem('size', size.value);
        return true;
    }
}

function validateCheese(e)
{
    e.preventDefault();
    switch(counter)
    {
        case 3:
            alert('I\'M WARNING YOU!!!!'); 
            counter++;
            return false;
        case 2:
            alert('WHAT PART OF "YOU MUST PURCHASE CHEESE" DO YOU NOT UNDERSTAND!!?!???!'); 
            counter++;
            return false;
        case 1:
            alert('You have to have cheese, damn it.');
            counter++;
            return false;
        case 0:
            alert('Gotta have cheese.');
            counter++;
            return false;
        default:
            document.getElementById('cheese').setAttribute('checked', 'checked');
            window.location.replace('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
    }
}

function validate()
{
    var valid = true;
    if (validateName() == false) valid = false;
    if (validateAddress() == false) valid = false;
    if (validateCity() == false) valid = false;
    if (validateEmail() == false) valid = false;
    if (validatePhone() == false) valid = false;
    if (validateCrust() == false) valid = false;
    if (validateSize() == false) valid = false;
    if (!valid) return false;
    
    var toppings = 'Cheese';
    if (document.getElementById('pepperoni').checked)
        toppings += ', Pepperoni';
    if (document.getElementById('sausage').checked)
        toppings += ', Sausage';
    if (document.getElementById('greenpep').checked)
        toppings += ', Green Peppers';
    if (document.getElementById('onion').checked)
        toppings += ', Onions';
    if (document.getElementById('xcheese').checked)
        toppings += ', Extra Cheese';
    localStorage.setItem('toppings', toppings);
    
    localStorage.setItem('instructions', document.getElementById('instructions').value);
    return valid;
}

















