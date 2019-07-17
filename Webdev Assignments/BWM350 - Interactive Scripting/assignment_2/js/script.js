
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

        if (crustvalid.classList.contains('hidden'))
        {
            crustvalid.classList.remove('hidden');
            crustvalid.classList.add('visible');
            crustvalid.style.marginTop = "10px";
        }

        crustvalid.textContent = "Please select a crust!"
        return false;
    }
    else
    {
        if (crustvalid.classList.contains('visible'))
        {
            crustvalid.classList.remove('bad');
            crustvalid.classList.add('good');
            crustvalid.textContent = "Thank you!";
        }

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

        if (sizevalid.classList.contains('hidden'))
        {
            sizevalid.classList.remove('hidden');
            sizevalid.classList.add('visible');
            sizevalid.style.marginTop = "10px";
        }

        sizevalid.textContent = "Please select a size!"
        return false;
    }
    else
    {
        if (sizevalid.classList.contains('visible'))
        {
            sizevalid.classList.remove('bad');
            sizevalid.classList.add('good');
            sizevalid.textContent = "Thank you!";
        }

        return true;
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
    return valid;
}