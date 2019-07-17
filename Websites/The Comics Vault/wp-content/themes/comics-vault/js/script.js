document.addEventListener('DOMContentLoaded', function()
{
    var artists = document.querySelector('nav#nav a:nth-child(3)');
    if (window.matchMedia('(max-width:800px)').matches && artists.textContent == 'Local Artists') artists.textContent = 'Artists';
    if (window.matchMedia('(min-width:801px)').matches && artists.textContent == 'Artists') artists.textContent = 'Local Artists';

    var offset;
    offset = Math.floor(Math.random() * 141.67) + 1;
    document.styleSheets[0].insertRule('main:before { background-position-y: -' + offset + 'rem }');
    offset = Math.floor(Math.random() * 141.67) + 1;
    document.styleSheets[0].insertRule('main:after { background-position-y: -' + offset + 'rem }');

    if (document.querySelector('ul.sow-slider-images li'))
    {
        var rand, photos = document.querySelectorAll('ul.sow-slider-images li');

        for (var i = 0; i < photos.length; i++)
        {
            rand = Math.random() * 9 - 5;
            if ((rand > -2) && (rand < 2))
            {
                if (rand < 0) rand = -2;
                if (rand > 0) rand = 2;
            }
            photos[i].style.transform = 'rotate(' + rand + 'deg)';
        }
    }
},
false);

window.addEventListener('resize', function() {
    var artists = document.querySelector('nav#nav a:nth-child(3)');
    if (window.matchMedia('(max-width:800px)').matches && artists.textContent == 'Local Artists') artists.textContent = 'Artists';
    if (window.matchMedia('(min-width:801px)').matches && artists.textContent == 'Artists') artists.textContent = 'Local Artists'; },
false);