var mouseMoved, walk;
	
window.addEventListener('DOMContentLoaded', function()
{
    var background = document.querySelector('div#background');
	background.style.backgroundImage = 'url("images/background-min.jpg")';
    background.style.visibility = 'visible';
    background.style.opacity = '1';
	
	document.querySelector('#gallery .sports').style.backgroundImage = 'url("images/psu.jpg")';
	document.querySelector('#gallery .celebs').style.backgroundImage = 'url("images/weezy.jpg")';
	document.querySelector('#gallery .movieTV').style.backgroundImage = 'url("images/potter.jpg")';
	document.querySelector('#gallery .comicCharacters').style.backgroundImage = 'url("images/harley.jpg")';
	
	var navLinks = document.querySelectorAll('nav > div:first-child span > a:not(:first-of-type)');
	
	var navLogo = document.querySelector('nav > div:first-child > a:first-child');
	var navDiv = document.querySelector('nav > div:first-child > div');
	
	navLogo.addEventListener('click', function(e)
	{
		if (window.matchMedia('(min-width: 1351px)').matches) return;
		e.preventDefault();
		navDiv.classList.toggle('open');
	});
	
	navDiv.addEventListener('click', function() { navDiv.classList.toggle('open'); });
	
	for (var i = 0; i < navLinks.length; i++)
		navLinks[i].addEventListener('click', function() { document.querySelector('section#gallery').classList.remove('init'); });

    var subtotal = 40,
        printTotal = 0,
        figureTotal = 0,
        mediumTotal = 0,
        artStyleTotal = 0,
        backgroundTotal = 0,
        total = subtotal;

    var span = document.getElementById('total');

    var printSize = document.getElementsByName('prints')[0];
    var figureType = document.getElementsByName('figureType');
    var medium = document.getElementsByName('medium');
    var artStyle = document.getElementsByName('artStyle');
    var background = document.getElementsByName('background')[0];


    printSize.addEventListener('change', function()
    {
        if (this.value == '9in. × 12in.') printTotal = 0;
        else if (this.value == '11in. × 14in.') printTotal = 20;
        else if (this.value == '11in. × 17in.') printTotal = 40;
        total = subtotal + printTotal + figureTotal + mediumTotal + artStyleTotal + backgroundTotal;
        span.textContent = '$' + total;
    });

    for (var i = 0; i < figureType.length; i++)
    {
        figureType[i].onclick = function()
        {
            if (this.value == 'Head') figureTotal = 0;
            if (this.value == 'Torso') figureTotal = 10;
            if (this.value == 'Bust') figureTotal = 30;
            if (this.value == 'Pet') figureTotal = 0;
            if (this.value == 'Full') figureTotal = 40;
            if (this.value == 'Couple') figureTotal = 40;
            if (this.value == 'Trio') figureTotal = 100;
            total = subtotal + printTotal + figureTotal + mediumTotal + artStyleTotal + backgroundTotal;
            span.textContent = '$' + total;
        };
    }

    for (var i = 0; i < medium.length; i++)
    {
        medium[i].onclick = function()
        {
            if (this.value == 'Pencil') mediumTotal = 0;
            if (this.value == 'Marker (Greyscale)' || this.value == 'Marker (Color)') mediumTotal = 30;
            if (this.value == 'Dry Media') mediumTotal = 20;
            total = subtotal + printTotal + figureTotal + mediumTotal + artStyleTotal + backgroundTotal;
            span.textContent = '$' + total;
        };
    }

    for (var i = 0; i < artStyle.length; i++)
    {
        artStyle[i].onclick = function()
        {
            if (this.value == 'Sketch') artStyleTotal = 0;
            if (this.value == 'Realism') artStyleTotal = 100;
            total = subtotal + printTotal + figureTotal + mediumTotal + artStyleTotal + backgroundTotal;
            span.textContent = '$' + total;
        };
    }

    background.onclick = function()
    {
        if (this.checked) backgroundTotal = 30;
        else backgroundTotal = 0;
        total = subtotal + printTotal + figureTotal + mediumTotal + artStyleTotal + backgroundTotal;
        span.textContent = '$' + total;
    };

    // gallery click handler
    document.querySelectorAll("#gallery .column").forEach(column=>{
        column.addEventListener('click', event=>{
            // if(document.getElementById('gallery').classList.toggle('collapse')) {
            //     loadGallery(column.getAttribute('data-category-id'));
            // }
            document.getElementById('gallery').classList.add('collapse');
            loadGallery(column.getAttribute('data-category-id'));
        }, true);
    })
	
	document.querySelector('div#background').addEventListener('click', function()
	{
		if (document.getElementById('gallery').classList.contains('collapse'))
			document.getElementById('gallery').classList.remove('collapse');
	});
	
	var gal = document.querySelector('#gallery > .gallery-target');
	var isDown = false;
	var startX;
	var scrollLeft;

	let downHandler = e=>{
        isDown = true;
        gal.classList.add('active');
        var pageX = e.pageX;
        if(e.touches && e.touches.length > 0){
            pageX = e.touches[0].pageX;
        }
        startX = pageX - gal.offsetLeft;
        scrollLeft = gal.scrollLeft;
    };
    let leaveHandler = e=>{
        isDown = false;
        gal.classList.remove('active');
    };
    let upHandler = e=>{
        isDown = false;
        gal.classList.remove('active');
        mouseMoved = Math.abs(walk) > 10;
        walk = 0;
    };
    let moveHandler = e=>{
        if(!isDown) return;
        e.preventDefault();
        var pageX = e.pageX;
        if(e.touches && e.touches.length > 0){
            pageX = e.touches[0].pageX;
        }
        var x = pageX - gal.offsetLeft;
        walk = x - startX;
        gal.scrollLeft = scrollLeft - walk;
    };

	gal.addEventListener('mousedown', downHandler);
	gal.addEventListener('mouseleave', leaveHandler);
	gal.addEventListener('mouseup', upHandler);
	gal.addEventListener('mousemove', moveHandler);

	gal.addEventListener('touchstart', downHandler);
	gal.addEventListener('touchmove', moveHandler);
	gal.addEventListener('touchend', upHandler);

	gal.addEventListener('wheel', e=>{
	    walk = Math.max(e.deltaX, e.deltaY) || Math.min(e.deltaX, e.deltaY);
	    gal.scrollLeft = gal.scrollLeft + walk;
    });
});

function loadGallery(category){
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = ()=>{
        if(xhr.readyState !== 4) return; // we don't care
        let target = document.querySelector("#gallery .gallery-target");
        target.innerHTML = "";
        target.onscroll = function(){};
        if(xhr.status !== 200){
            target.innerHTML = '<div class="error">' +
                '<h2>Network Error ' + xhr.status + '</h2>' +
                '<p>We couldn\'t load any images due to a network error.  Please refresh the page and try again.</p>' +
                '</div>';
            return;
        }
        let images = JSON.parse(xhr.responseText);
        if(!images){
            target.innerHTML = '<div class="error">' +
                '<h2>Data Error</h2>' +
                '<p>We couldn\'t load any images due to a data error.  Please use the <a href="#contact">contact form</a> if this error persists.</p>' +
                '</div>';
            return;
        }
        images.reverse();

		let ordinaryDiv = document.createElement('div');
		ordinaryDiv.style.display = 'inline-block';
		ordinaryDiv.style.height = '100%';
		var newDiv;
        let i = 0, lastImg;
        loadImage(images[i++]);

        function loadImage(image) {
            // create and append image first to update lastImg as early as possible
            let img = document.createElement('img');
			img.draggable = false;
			newDiv = ordinaryDiv.cloneNode();
			newDiv.appendChild(img);
            newDiv.onclick = ()=>launchModal(image);
            target.appendChild(newDiv);
            lastImg = img;

            // add load listener before setting src to avoid race condition
            img.addEventListener('load', addImageIfAble);
            img.src = image['thumb'];

            // set other attributes in order of importance because async
            img.alt = image['alt'];
            img.title = image['title'];
        }
        function addImageIfAble(){
            if(i < images.length && lastImg.complete && lastImg.offsetLeft < target.scrollLeft + target.clientWidth){
                loadImage(images[i++]);
            }
        }
        function launchModal(image){
			if (mouseMoved) { mouseMoved = false; return; }
            let lightbox = document.querySelector('#lightbox-target');
            lightbox.innerHTML = '';
            lightbox.style.display = 'block';
            lightbox.onclick = ()=>lightbox.style.display = "none";

            let img = document.createElement('img');
            img.src = image['full'];
            img.alt = image['alt'];
            img.title = image['title'];

            let caption = document.createElement('figcaption');
            caption.innerHTML = '<b>' + image['title'] + '</b>: <i>' + image['alt'] + '</i>';

            let figure = document.createElement('figure');
            figure.appendChild(img);
            figure.appendChild(caption);
            lightbox.appendChild(figure);
        }

        // handle overscroll dynamic load
        target.onscroll = addImageIfAble;
    };
    xhr.open('get', '/imajax.php?id='+category);
    xhr.send(null);
}