<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cora's Wall</title>
    <meta name="description" content="">
    
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
        <button class="navbar-toggler hamburger center" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
    
    <main id="wall">
        <section id="win-wall">
            <div class="container">
                <div class="row align-items-end">
                    <div class="col-8">
                        <div class="header-effect">
                            <h1><span class="alex-cora">Alex Cora</span><br><span class="has-a">has a</span><br>bigass wall.</h1>
                            <h1 class="foreground"><span class="alex-cora">Alex Cora</span><br><span class="has-a">has a</span><br>bigass wall.</h1>
                        </div>
                        <h2 class="aileron tilt">He hangs a picture<br>every time the Red Sox<br>win a game.</h2>
                    </div>
                    <div class="header-effect mb-neg">
                        <h3>Below is a faithful recreation.</h3>
                        <h3 class="foreground">Below is a faithful recreation.</h3>
                    </div>
                    <div class="header-effect">
                        <h4>Sort and search functions to follow.</h4>
                        <h4 class="foreground">Sort and search functions to follow.</h4>
                    </div>
                </div>
                <div class="row" id="photos">
                    <div data-toggle="modal" data-target="#modal" data-photo="001" class="col-6 col-sm-4 photo"><img src="img/wins/001-thumb.jpg" alt="Win #1"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="002" class="col-6 col-sm-4 photo"><img src="img/wins/002-thumb.jpg" alt="Win #2"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="003" class="col-6 col-sm-4 photo"><img src="img/wins/003-thumb.jpg" alt="Win #3"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="004" class="col-6 col-sm-4 photo"><img src="img/wins/004-thumb.jpg" alt="Win #4"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="005" class="col-6 col-sm-4 photo"><img src="img/wins/005-thumb.jpg" alt="Win #5"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="006" class="col-6 col-sm-4 photo"><img src="img/wins/006-thumb.jpg" alt="Win #6"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="007" class="col-6 col-sm-4 photo"><img src="img/wins/007-thumb.jpg" alt="Win #7"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="008" class="col-6 col-sm-4 photo"><img src="img/wins/008-thumb.jpg" alt="Win #8"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="009" class="col-6 col-sm-4 photo"><img src="img/wins/009-thumb.jpg" alt="Win #9"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="010" class="col-6 col-sm-4 photo"><img src="img/wins/010-thumb.jpg" alt="Win #10"></div>
                    <div data-toggle="modal" data-target="#modal" data-photo="011" class="col-6 col-sm-4 photo"><img src="img/wins/011-thumb.jpg" alt="Win #11"></div>
                </div>
                <div class="modal fade" id="modal" aria-hidden="true">
                    <div class="wrap">
                        <!--<button class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>-->
                        <img src="" alt="" class="zoomed">
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <span class="stretch">Copyright <span class="copy">&copy;</span> <span id="championship-years">
    </footer>
</body>
</html>