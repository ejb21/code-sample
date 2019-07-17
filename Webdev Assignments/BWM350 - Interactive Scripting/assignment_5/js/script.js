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

$(document).ready(function()
{
    if ($('#home').length)
    {
        background = document.getElementById('home_background');
        binary();
        setInterval(binary,353);
        home();
    }
    else
    {
        background = document.getElementById('header_background');
        binary();
        setInterval(binary,353);
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
});