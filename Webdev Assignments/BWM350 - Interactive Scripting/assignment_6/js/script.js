function phoneInit()
{
    var phone = document.getElementById('phoneinput');
    if (phone.value == '') phone.value = '(';
}

function lintPhone(event)
{
    var phone = document.getElementById('phoneinput');

    if (isNaN(phone.value.charAt(phone.value.length-1)))
        phone.value = '' + phone.value.substring(0, phone.value.length - 1);

    if (phone.value == '')
        phone.value += '(';

    if (phone.value.length == 4)
        phone.value += ')';

    if (phone.value.length == 8)
        phone.value += '-';
}

$(document).ready(function()
{
    $('#form').validate(
    {
        rules:
        {
            name:
            {
                required: true,
                minlength: 2,
                pattern: /^[a-zA-Z\s]*$/
            },
            address:
            {
                required: true,
                pattern: /^\d{1,5} [a-zA-Z0-9.,\- ]{2,} [a-zA-Z0-9.,\- ]{2,}$/
            },
            city:
            {
                required: true,
                minlength: 3,
                pattern: /^[a-zA-Z.\-, ]*$/
            },
            email:
            {
                required: true,
                pattern: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
            },
            phone:
            {
                required: true,
                pattern: /^\(\d{3}\)\d{3}-\d{4}$/
            },
            'crust[]': 'required',
            size: 'required',
            'toppings[]': 'required'
        },

        messages:
        {
            name:
            {
                required: 'Please provide a name.',
                minlength: 'Name is too short.',
                pattern: 'Names consist of letters and spaces.'
            },
            address:
            {
                required: 'Please provide an address.',
                pattern: 'Invalid address.'
            },
            city:
            {
                required: 'Please provide a city.',
                minlength: 'City name is too short.',
                pattern: 'Invalid city.'
            },
            email:
            {
                required: 'Please provide an email.',
                email: 'Invalid email address.'
            },
            phone:
            {
                required: 'Please provide a number.',
                pattern: 'Invalid phone number.'
            },
            'crust[]': 'Please select a crust.',
            size: 'Please select a size.',
            'toppings[]': 'Please select a topping.'
        },

        errorPlacement: function(e, el)
        {
            if (el.is('[name="crust[]"]'))
                e.addClass('visible').addClass('bad').addClass('ml-0').addClass('crust-error')
                    .insertAfter(el.parent());
            else if (el.is('[name="size"]'))
                e.addClass('visible').addClass('bad').addClass('ml-0').addClass('size-error')
                    .insertAfter(el.parent());
            else if (el.is('[name="toppings[]"]'))
                e.addClass('visible').addClass('bad').addClass('ml-0').addClass('toppings-error')
                    .insertBefore('#instrlabel');
            else
                e.addClass('visible').addClass('bad').insertAfter(el);
        },

        success: function(label)
        {
            label.text('OK!').removeClass('bad').addClass('good');
        }
    });
});