"use strict";(function() {
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
    var a = new firebase.auth.GoogleAuthProvider;
    firebase.auth().signInWithPopup(a).then(function(a) {
                var b = a.credential.accessToken,
                    c = a.user;
                console.info(a);
                var d = a.additionalUserInfo.profile;
                $("#info").html("\n"+
"<div class=\"container\">\n"+
    "<h1 style=\"text-align: center; margin-bottom: 3rem;\" class=\"display-4\">Welcome back!</h1>\n"+
    "<div class=\"row\">\n"+
        "<div style=\"padding-left: 18rem;\" class=\"col-6\">\n <img class=\"rounded-circle w-75\" src=\""+d.picture+"\" />\n </div>\n"+
        "<div class=\"col-6 text-left d-flex flex-column justify-content-center\">\n"+
            "<h2>"+d.name+"</h2>\n"+
            "<p><a style=\"color: #FE4404;\" href=\"mailto:"+d.email+"\">"+d.email+"</a></p>\n <a class=\"btn w-50\" href=\""+d.link+ "\">View Profile</a>\n </div>\n </div>\n</div>\n")}).catch(function(a){var b=a.code,c=a.message,d=a.email,e=a.credential})})();