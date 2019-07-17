"use strict";
(function()
{
    if (!firebase.apps.length)
    {
        firebase.initializeApp({
            apiKey: "AIzaSyChBLxit-qtvZqYm0PVsgFyQj3wbd79S5U",
            authDomain: "boston-reddit-sox.firebaseapp.com",
            databaseURL: "https://boston-reddit-sox.firebaseio.com",
            projectId: "boston-reddit-sox",
            storageBucket: "boston-reddit-sox.appspot.com",
            messagingSenderId: "1020863615591"
        });
    }
    firebase.auth().onAuthStateChanged(function(user)
    {
        if (user)
        {
            $('#account').removeClass('hidden');
            $('#info').html(
                '<div class="container">'+
                    '<h1 style="text-align: center; margin-bottom: 3rem;" class="display-4">Welcome back!</h1>' +
                    '<div class="row">' +
                        '<div style="padding-left: 18rem;" class="col-6">' +
                            '<img class="rounded-circle w-75" src="' + user.photoURL + '">'+
                        '</div>' +
                        '<div class="col-6 text-left d-flex flex-column justify-content-center">' +
                            '<h2>' + user.displayName + '</h2>' +
                            '<p><a style="color: #FE4404;" href="mailto:' + user.email + '">' + user.email + '</a></p>' +
                            '<a class=\"btn w-50\" style="z-index: 99999;" href='+'https://www.reddit.com/">View Profile</a>' +
                        '</div>' +
                    '</div>' +
                '</div>');
            
            if (document.querySelector('section.intro div#intro-overlay'))
            {
                var rand;
                var upvote;

                for (var i = 1; i < 76; i++)
                {
                    upvote = document.createElement('img');
                    upvote.setAttribute('class', 'upvote');
                    upvote.src = '../img/upvote-transparent.png';
                    upvote.alt = 'Upvote #' + i;
                    rand = Math.random() * 120 - 10;
                    upvote.style.left = rand + 'vw';
                    rand = Math.random() * -500 - 10;
                    upvote.style.top = rand + 'vh';
                    document.body.prepend(upvote);
                }

                setTimeout(function() { $('img.upvote').remove() }, 10000);
            }
        }
        else firebase.auth().signInWithPopup(new firebase.auth.GoogleAuthProvider);
    });
})();