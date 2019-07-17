var syntaxes, subheadings, binaryString, background, rand;

function home()
{
    syntaxes = 
    [
        ['<title>', '</title>'],
        ['console.log(\'', '\');'],
        ['<? echo \'', '\'; ?>'],
        ['Console.WriteLine("', '");'],
        ['print "', '"'],
        ['sudo echo "', '"'],
        ['SELECT * FROM ', ';'],
        ['msg db \'', '\''],
        ['/', '/g'],
        ['PRINT "', '"'],
        ['printf("', '\\n");'],
        ['std::cout << "', '\\n";'],
        ['content: "', '";'],
        ['DBMS_OUTPUT.PUT_LINE("','");'],
        ['fmt.Println("', '")'],
        ['System.out.println("', '");'],
        ['// ', ''],
        ['/* ', ' */'],
        ['{# ', ' #}'],
        ['<!-- ', ' -->'],
        ['^', '$'],
        ['puts \'', '\''],
        ['grep -ir \'', '\''],
        ['git commit -m \'', '\''],
        ['NSLog(@"', '");'],
        ['\'name\': \'', '\','],
        ['db.find({"name": "', '" })'],
        ['Ctrl + F "', '"'],
        ['<h1>', '</h1>'],
        ['Ctrl + C', 'Ctrl + V'],
        ['<?php /*', '*/ ?>'],
        ['_start:', 'int 0x80']
    ];

    subheadings =
    [
        'Founder of Eric Budd Enterprises',
        'Fantasy commissioner',
        'CSS Rembrandt',
        'Search engine optimizer',
        'Graphic designer',
        'Photoshopper',
        'Videographer',
        'Digital marketer',
        'reddit karma whore',
        'Facebook "Like" magnet',
        'Affable email correspondent',
        'Dangerously hard worker',
        'Webmaster',
        'Software developer',
        'Graphic designer',
        'Sabermetrician',
        'Team player',
        'Rockstar',
        'Scrum Master',
        'High school news editor',
        'Quick study',
        'Guitar Hero demigod',
        'Soft skill-ful',
        'Straight shooter',
        'Data scientist',
        'Tech support',
        'WiFi troubleshooter',
        'J.V. shortstop',
        'Data miner',
        'World Series Champion',
        'Sneakerhead',
        'Millennial',
        'Database administrator',
        'Social media marketer',
        'Google Ads manager',
        'Turner-off-and-back-on-er',
        'Management material',
        'Memeology Navy SEAL',
        'Teacher\'s pet',
        'Excel user',
        'CMS surgeon',
        'PHP interpreter',
        'Proficient in text-shadow'
    ];

    setInterval(swaps,2000);
}
    
function binary()
{
    binaryString = background.textContent.substring(1);
    background.textContent = binaryString;

    if (Math.random() > .5)
        background.textContent += '1';
    else
        background.textContent += '0';
}

function swaps()
{ 
    rand = Math.floor(Math.random() * syntaxes.length);
    if (syntaxes[rand][2])
    {
        $('#home_open').html(syntaxes[rand][0]).fadeIn();
        $('#home_close').html(syntaxes[rand][1]).fadeIn();
    }
    $('#home_open').text(syntaxes[rand][0]).fadeIn();
    $('#home_close').text(syntaxes[rand][1]).fadeIn();
    
    rand = Math.floor(Math.random() * subheadings.length);
    $('#home #landing h2 span').text(subheadings[rand]).fadeIn();
}

function initMap()
{
    var locust = { lat: 41.1992, lng: -77.26006 };
    var map = new google.maps.Map ( document.getElementById('map'), { zoom: 18, center: locust, mapTypeId: 'satellite' } );


    var mkImg = new google.maps.MarkerImage('../img/circle.png');
    mkImg.size = new google.maps.Size(150,150);
    mkImg.scaledSize = new google.maps.Size(150,150);

    var marker = new google.maps.Marker
    ({
        position: locust,
        map: map,
        icon: mkImg,
        title: 'Home'
    });

    map.panBy(450, -80);
}

$(document).ready(function()
{
    if ($('#home').length)
    {
        background = document.getElementById('home_background');
        binary();
        setInterval(binary,353);
        home();
        $('.draggable').draggable();
    }
    else
    {
        background = document.getElementById('header_background');
        binary();
        setInterval(binary,353);

        $(document).on('click', '#hamburger.open svg', function()
        {
            $(this).css('transform', 'rotate3d(0,1,0,90deg) scaleX(1.1) scale(1.37) rotate(3.35deg)')
                .delay(150);
            $('#hamburger').load('../img/cross.svg')
                .css('transform', 'rotate3d(0,1,0,180deg) scale(1.26) rotate(-7deg)');
            $('#hamburger').toggleClass('close');
            $('#hamburger').toggleClass('open');
            $('header').toggleClass('open');
        });
        
        $(document).on('click', '#hamburger.close svg', function()
        {
            $(this).css('transform', 'rotate3d(0,1,0,270deg) scale(1.26) rotate(-7deg)')
                .delay(150);
            $('#hamburger').load('../img/hamburger.svg')
                .css('transform', 'rotate3d(0,1,0,360deg) scaleX(1.1) scale(1.37) rotate(3.35deg)');
            $('#hamburger').toggleClass('close');
            $('#hamburger').toggleClass('open');
            $('header').toggleClass('open');
        });
    }

    if ($('#info').length)
    {
        initMap();

        $(window).scroll(function()
        {
            var mypos = $(window).scrollTop();

            $("#info p:nth-of-type(3),#info p:nth-of-type(4),#info p:nth-of-type(5),#info p:nth-of-type(6)").each(function ()
            {
                if (mypos > $(this).offset().top - ($(window).height() * .65))
                {
                    $(this).css('opacity', 1);
                    $(this).css('top', 0);
                };
            });
        });

        var table = $('table');

        $('.sortable')
        .each(function(){
            
            var th = $(this),
                thIndex = th.index(),
                inverse = false;
            
            th.click(function(){
                
                table.find('td').filter(function(){
                    
                    return $(this).index() === thIndex;
                    
                }).sortElements(function(a, b){
                    
                    return $.text([a]) > $.text([b]) ?
                        inverse ? -1 : 1
                        : inverse ? 1 : -1;
                    
                }, function(){
                    
                    // parentNode is the element we want to move
                    return this.parentNode; 
                    
                });
                
                inverse = !inverse;
                    
            });
                
        });
    }

    if ($('[data-fancybox]').length) $('[data-fancybox]').fancybox();

    if ($('#portfolio .card').length)
    {
        var rand;

        $('#portfolio .card').each(function()
        {
            rand = (Math.random() * 8) - 4;
            $(this).css('transform', 'rotate(' + rand + 'deg)');
        });
    }

    if ($('#media').length)
    {
        $('#media #email').click(function()
        {
            if (window.matchMedia('max-width: 900px').matches) $('#arrow').css('left', '-38.6vw');
            else $('#arrow').css('left', '-34.3rem');
            $('#arrow').css('transform', 'rotate(0deg)');
            $('#arrow').removeClass('not-null');
            $('#media').fadeOut(500);
            $('#arrow').show();
            $('input[name="email"]').show();
            $('#form').fadeIn(500);
            $('#form').css('display', 'flex');
            $('#form').css('top', '-5rem');
            $('#form').css('top', '0');
        });

        $('#media #phone').click(function()
        {
            if (window.matchMedia('max-width: 900px').matches) $('#arrow').css('left', '-38.6vw');
            else $('#arrow').css('left', '-34.3rem');
            $('#arrow').css('transform', 'rotate(0deg)');
            $('#arrow').removeClass('not-null');
            $('#media').fadeOut(500);
            $('#arrow').show();
            $('input[name="phone"]').show();
            $('#form').fadeIn(500);
            $('#form').css('display', 'flex');
            $('#form').css('top', '-5rem');
            $('#form').css('top', '0');
        });

        $('#media #reddit').click(function()
        {
            if (window.matchMedia('max-width: 900px').matches) $('#arrow').css('left', '-34.3rem');
            else $('#arrow').css('left', '-34.3rem');
            $('#arrow').css('transform', 'rotate(0deg)');
            $('#arrow').removeClass('not-null');
            $('#media').fadeOut(500);
            $('#arrow').show();
            $('input[name="reddit"]').show();
            $('#form').fadeIn(500);
            $('#form').css('display', 'flex');
            $('#form').css('top', '-5rem');
            $('#form').css('top', '0');
        });

        $('input').keypress(function()
        {
            if ($(this).val() != '')
            {
                $(this).css('padding', '0 11rem 0 1.5rem');
                $('#arrow').css('transform', 'rotate(180deg)');
                $('#arrow').addClass('not-null');

                if (window.matchMedia('max-width: 900px').matches) $('#arrow').css('left', '38.6vw');
                else $('#arrow').css('left', '34.3rem');
            }
        });

        $('input').focusout(function()
        {
            if ($(this).val() == '')
            {
                $(this).css('padding', '0 1.5rem 0 11rem');
                $('#arrow').css('transform', 'rotate(0deg)');
                $('#arrow').removeClass('not-null');

                if (window.matchMedia('max-width: 900px').matches) $('#arrow').css('left', '-38.6vw');
                else $('#arrow').css('left', '-34.3rem');
            }
        });

        $(document).on('click', '#arrow', function(e)
        {
            var value;

            if ($('input[name="email"]').val() != '')
            {
                value = $('input[name="email"]').val();
                if (!value.match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/))
                {
                    e.preventDefault();
                    $('#feedback').text('Invalid email address.');
                    return;
                }
            }

            if ($('input[name="phone"]').val() != '')
            {
                value = $('input[name="phone"]').val();
                if (!value.match(/^\(\d{3}\)\d{3}-\d{4}$/) &&
                    !value.match(/^\d{7,10}$/) &&
                    !value.match(/^\d{3}-\d{3}-\d{4}$/))
                {
                    e.preventDefault();
                    $('#feedback').text('Invalid phone number.');
                    return;
                }
            }

            if ($('input[name="reddit"]').val() != '')
            {
                value = $('input[name="reddit"]').val();
                if (!value.match(/^[A-Za-z0-9-_]{3,20}/))
                {
                    e.preventDefault();
                    $('#feedback').text('Invalid reddit account.');
                    return;
                }
            }

            $('#form').fadeOut(200);
            $('#arrow').hide();
            $('#feedback').text('');
            $('input').val('');
            $('input').css('padding', '0 1.5rem 0 11rem');
            $('input').hide();
            $('#media').fadeIn(500);
            $('#media').css('display', 'flex');
            $('#media').css('top', '5rem');
            $('#media').css('top', '0');
        });
    }

    if ($('#skillset').length)
    {
        $(document).on('click', '#skills .nav div:not(.active)', function()
        {
            $('#skills .nav div').removeClass('active');
            $(this).addClass('active');

            $('#skills .icons div.active').fadeOut(100).removeClass('active');

            if ($(this).hasClass('nav-web')) $('#skills .icons div.web').delay(50).fadeIn(200).addClass('active');
            if ($(this).hasClass('nav-software')) $('#skills .icons div.software').delay(50).fadeIn(200).addClass('active');
            if ($(this).hasClass('nav-computing')) $('#skills .icons div.computing').delay(50).fadeIn(200).addClass('active');
            if ($(this).hasClass('nav-soft')) $('#skills .icons div.soft').delay(50).fadeIn(200).addClass('active');
        })
    }
});