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

<body style="background-color: #C60C30;">
    <header class="center home-header">
        <div class="insignia center">
            <nav id="home" class="navbar navbar-expand">
                <a class="navbar-brand" href="/"><img src="img/Red-Sox-Logo.png" alt="Boston Red Sox logo"></a>
            </nav>
            <div id="hero">
                <img src="img/World-Series-Champions.png" alt="World Series Champions">
            </div>
        </div>
        <button class="navbar-toggler hamburger center home-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div></div><div></div><div></div>
        </button>
    </header>

    <nav class="collapse navbar-collapse navbar-nav home-nav" id="navbarSupportedContent">
        <div class="container">
            <a class="nav-item nav-link" id="nav-betts" href="betts.php"><img src="img/Betts-thumbnail.png" alt="Mookie Betts"><span>Betts</span></a>
            <a class="nav-item nav-link" id="nav-cora" href="cora.php"><img src="img/Cora-thumbnail.png" alt="Alex Cora"><span>Cora</span></a>
            <a class="nav-item nav-link" id="nav-pearce" href="pearce.php"><img src="img/Pearce-thumbnail.png" alt="Steve Pearce"><span>Pearce</span></a>
            <a class="nav-item nav-link active" id="nav-price" href="price.php"><img src="img/Price-thumbnail.png" alt="David Price"><span>Price</span></a>
            <a class="nav-item nav-link" id="nav-wall" href="wall.php"><span><span class="smallcap">T</span>he <span class="smallcap">W</span>all</span></a>
            <a class="nav-item nav-link" id="login" href="login.php"><img src="img/hat.png" alt="Red Sox hat"><i class="fa fa-user"></i> <span><span class="smallcap">L</span>ogin</span></a>
        </div>
    </nav>

    <footer class="home-footer">
        <span class="stretch">Copyright <span class="copy">&copy;</span> <span id="championship-years">
    </footer>
</body>
</html>