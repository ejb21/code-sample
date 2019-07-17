$(document).ready(function()
{
    $('.navbar-toggler').unbind();
    $('.navbar-collapse').unbind();

    $('.navbar-toggler').click(function()
    {
        $(this).toggleClass('cross');
        document.activeElement = null;
    });

    $('.navbar-toggler').mouseout(function()
    {
        $(this).addClass('reset');
        setTimeout(function(){ $('.navbar-toggler').removeClass('reset'); }, 100);
    });

    if ($('#photos').length)
    {
        var rand;

        $('.photo').each(function()
        {
            rand = Math.random() * .75;
            if (Math.random() > .5) rand *= -1;
            $(this).css('transform','rotate(' + rand + 'deg)');
        });

        var trigger = $("body").find('[data-toggle="modal"]');

        trigger.click(function (e)
        {
            e.preventDefault();
            var modal = $(this).data("target"),
            img = '../img/wins/' + $(this).attr("data-photo") + '.jpg';

            $(modal + ' img').attr('src', img);

            var rand = Math.random() * .75;
            if (Math.random() > .5) rand *= -1;
            $('#modal').css('display', 'flex');
            $('#modal').css('transform', 'rotate(' + rand + 'deg)');
            $('#modal').fadeIn(500);
            $('.modal-backdrop').fadeIn(500);

            $(document).on('click', '.modal-backdrop', function ()
            {
                $('#modal').fadeOut(500);
                $('.modal-backdrop').fadeOut(500);
                $('body').removeClass('modal-open');
            });
        });
    }

    if ($('.home-toggler').length)
    {
        $('.home-toggler').click(function()
        {
            $('.home-header').toggleClass('menu-open');
        });
    }

    populateTrophies();
});

function populateTrophies()
{
    var trophies = [ 2004, 2007, 2013, 2018 ];
    var span = document.getElementById('championship-years');

    for (var i = 0; i < trophies.length; i++)
    {
        if (i > 0) span.innerHTML += '<span class="comma">,</span> ';
        span.innerHTML += trophies[i];
    }
}