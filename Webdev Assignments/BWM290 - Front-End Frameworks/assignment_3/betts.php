<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mookie Betts</title>
    <meta name="description" content="Markus Lynn Betts was given the initials MLB, and not by accident. His mother, Diana, knew for a certainty that her child would grow up to play Major League Baseball.">
    
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/overrides.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</head>

<body>
    <header class="center">
        <div class="insignia center">
            <nav id="home" class="navbar navbar-expand">
                <a class="navbar-brand" href="/"><img src="img/Red-Sox-Logo.png" alt="Boston Red Sox logo"></a>
            </nav>
            <div id="hero">
                <img src="img/World-Series-Champions.png" alt="World Series Champions">
            </div>
        </div>
        <button class="navbar-toggler center" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div></div><div></div><div></div>
        </button>
    </header>

    <nav class="collapse navbar-collapse navbar-nav" id="navbarSupportedContent">
        <div class="container">
            <a class="nav-item nav-link" id="nav-betts" href="betts.php"><img src="img/Betts-thumbnail.png" alt="Mookie Betts"><span>Betts</span></a>
            <a class="nav-item nav-link" id="nav-cora" href="cora.php"><img src="img/Cora-thumbnail.png" alt="Alex Cora"><span>Cora</span></a>
            <a class="nav-item nav-link" id="nav-pearce" href="pearce.php"><img src="img/Pearce-thumbnail.png" alt="Steve Pearce"><span>Pearce</span></a>
            <a class="nav-item nav-link active" id="nav-price" href="price.php"><img src="img/Price-thumbnail.png" alt="David Price"><span>Price</span></a>
            <a class="nav-item nav-link" id="nav-wall" href="wall.php"><span><span class="smallcap">T</span>he <span class="smallcap">W</span>all</span></a>
            <a class="nav-item nav-link" id="login" href="login.php"><img src="img/hat.png" alt="Red Sox hat"><i class="fa fa-user"></i> <span><span class="smallcap">L</span>ogin</span></a>
        </div>
    </nav>
    
    <main id="betts">
        <div class="container">
            <div class="row">
                <div id="mvp" class="col-sm-8">
                    <div class="header-effect">
                        <h1>M<span id="v">V</span>P</h1>
                        <h1 class="foreground">M<span id="v">V</span>P</h1>
                    </div>
                    <p class="mt-0">
                        <strong>Markus Lynn Betts</strong> was given the initials <strong>MLB</strong>,<br>and not by accident. His mother, Diana, knew for a certainty that her child would grow up to play<br><strong>M</strong>ajor <strong>L</strong>eague <strong>B</strong>aseball.
                    </p>
                    <p>
                        Today, Markus is known internationally as "<strong class="wordmark wm1">Mookie</strong>."<br>And Mookie Betts doesn't just <em>play</em> baseball &mdash;<br><a href="https://www.baseball-reference.com/leaders/WAR_bat_season.shtml" target="_blank">he is one of the best players in the history of the sport.</a>
                    </p>
                    <p class="px-5">
                        Mookie Betts bowls professionally on the PBA Tour and can solve a Rubik's Cube in under two minutes.<br>In November, he was presented with the first of many <strong class="wordmark wm2">Most Valuable Player</strong> awards.
                    </p>
                </div>
                <div id="mook" class="col-sm-4">
                    <img src="img/Betts.png" alt="Mookie Betts">
                </div>
            </div>
            <div id="trophy-case-header" class="row">
                <div class="col-12">
                    <div class="header-effect">
                        <h2>Mookie<span class="l-3">'</span>s Trophy Case</h2>
                        <h2 class="foreground">Mookie<span class="l-3">'</span>s Trophy Case</h2>
                    </div>
                    <div class="header-effect">
                        <h3>(<span class="parens">through age 26</span>)</h3>
                        <h3 class="foreground">(<span class="parens">through age 26</span>)</h3>
                    </div>
                </div>
            </div>
            <div id="trophy-case">
                <div class="card" id="commissioners">
                    <div class="trophy" id="world-series"></div>
                    <div class="caption">World Series Champion</div>
                </div>
                <div class="card">
                    <div class="trophy" id="most-valuable-player"></div>
                    <div class="caption">Most Valuable Player</div>
                </div>
                <div class="card">
                    <div class="trophy" id="batting-champion"></div>
                    <div class="caption">Batting Champion</div>
                </div>
                <div id="gold-gloves" class="d-none d-sm-block">
                    <div class="card c1-3">
                        <div class="trophy" id="gold-glove"></div>
                        <div class="caption">Gold Glove</div>
                    </div>
                    <div class="card c2-3">
                        <div class="trophy" id="gold-glove"></div>
                        <div class="caption">Gold Glove</div>
                    </div>
                    <div class="card c3-3">
                        <div class="trophy" id="gold-glove"></div>
                        <div class="caption">Gold Glove</div>
                    </div>
                </div>
                <div id="silver-sluggers" class="d-none d-sm-block">
                    <div class="card c1-2">
                        <div class="trophy" id="silver-slugger"></div>
                        <div class="caption">Silver Slugger</div>
                    </div>
                    <div class="card c2-2">
                        <div class="trophy" id="silver-slugger"></div>
                        <div class="caption">Silver Slugger</div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <span class="stretch">Copyright <span class="copy">&copy;</span> <span id="championship-years">
    </footer>
</body>
</html>