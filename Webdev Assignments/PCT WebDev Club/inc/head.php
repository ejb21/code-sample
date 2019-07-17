<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#006eb4">
<meta name="robots" content="noindex">

<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" type="image/png" href="img/favicon.png">

<meta name="description" content="The W2C exists to advance its members' education in important web technologies, provide local businesses with high-quality, affordable websites, network with business leaders and professionals in the field, and to have fun doing it.">

<script>
    var nav = document.getElementsByClassName("header_nav_mobile");
    var arrow = document.getElementsByClassName("header_nav_arrow");
    var link = document.getElementsByClassName("header_nav_mobile_link");
    const match = window.matchMedia( "(max-width: 480px)" );
    nav[0].style.visibility = 'hidden';
    
    function navExpand()
    {
        if(nav[0].style.visibility == 'visible')
        {
            nav[0].style.visibility = 'hidden';
            nav[0].style.height = '0';
            arrow[0].classList.remove("u-flip-bg");
            arrow[1].classList.remove("u-flip-bg");
            arrow[0].classList.add("u-unflip-bg");
            arrow[1].classList.add("u-unflip-bg");

            for(i = 0; i<link.length; i++)
            {
                link[i].classList.remove("u-show");
            }
        }
        else
        {
            nav[0].style.visibility = 'visible';
            if(match.matches)
            {
                nav[0].style.height = '15rem';
            }
            else
            {
                nav[0].style.height = '10rem';
            }
            arrow[0].classList.remove("u-unflip-bg");
            arrow[1].classList.remove("u-unflip-bg");
            arrow[0].classList.add("u-flip-bg");
            arrow[1].classList.add("u-flip-bg");

            for(i = 0; i<link.length; i++)
            {
                link[i].classList.add("u-show");
            }
        }
    }
</script>