<?php 
$title = "Glozzum: Home";
include 'includes/header.php';
?>
    
    
    
    <!-- Begin slider -->
    <section id="showcase">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item carousel-image-1 active">
                <!-- used css to source in the image -->
                <!-- <img class="d-block w-100" src="img/image1.jpg" alt="First slide"> -->
                <div class="carousel-caption d-none d-md-block">
                        <h5>Picture 1</h5>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde vel veritatis dolore culpa pariatur quos dicta sapiente quibusdam nulla sit enim distinctio, odio, quo est doloremque? Quam voluptates aliquid sed.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="img/image2.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                        <h5>Picture 2</h5>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde vel veritatis dolore culpa pariatur quos dicta sapiente quibusdam nulla sit enim distinctio, odio, quo est doloremque? Quam voluptates aliquid sed.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="img/image3.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                        <h5>Picture 3</h5>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde vel veritatis dolore culpa pariatur quos dicta sapiente quibusdam nulla sit enim distinctio, odio, quo est doloremque? Quam voluptates aliquid sed.</p>
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
    </section>
    <!-- end slider -->
    <!-- Homepage icon section -->
    <section id="home-icons" class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-4 text-center">
            <i class="fa fa-cog fa-3x mb-2"></i>
            <h3>Turning Gears</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod sint id praesentium laborum quos nemo officia vitae, ipsam, minima debitis, itaque reiciendis.</p>
          </div>
          <div class="col-md-4 mb-4 text-center"><i class="fa fa-cloud fa-3x mb-2"></i>
            <h3>Sending Data</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod sint id praesentium laborum quos nemo officia vitae, ipsam, minima debitis, itaque reiciendis.</p></div>
          <div class="col-md-4 mb-4 text-center"><i class="fa fa-cart-plus fa-3x mb-2"></i>
            <h3>Making Money</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod sint id praesentium laborum quos nemo officia vitae, ipsam, minima debitis, itaque reiciendis.</p></div>
        </div>
      </div>
    </section>
    <!-- Homepage heading section -->
    <section id="home-heading" class="p-5">
      <div class="dark-overlay">
        <div class="row">
          <div class="col">
            <div class="container pt-5">
              <h1>Are You Ready To Get Started?</h1>
              <p class="d-none d-md-block">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat expedita doloribus fugit dicta repellat praesentium rerum recusandae est consequatur possimus accusamus suscipit ex tempore explicabo dolorum illum, quod saepe perspiciatis!</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Info section -->
    <section id="info" class="py-3">
      <div class="container">
          <div class="row">
              <div class="col-6 align-self-center">
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos labore magni accusantium porro saepe iure est aliquam minus, provident animi, fuga suscipit corporis ducimus nobis asperiores beatae eveniet distinctio quod.</p>
                <a href="about.html" class="btn btn-outline-danger btn-lg">Learn More</a>
              </div>
              <div class="col-6">
                <img src="img/laptop.png" alt="laptop image" class="img-fluid" />
              </div>
            </div>
      </div>
    </section>
    <!-- Video -->
    <section id="video-play">
      <div class="dark-overlay">
        <div class="row">
          <div class="col">
            <div class="container p-5">
              <a href="#" class="video" data-video="https://www.youtube.com/embed/EGmhBo1tkAk" data-toggle="modal" data-target="#videoModal">
              <i class="fa fa-play fa-3x"></i>
              </a>
              <h1>See What We Do</h1>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Photo Gallery -->

    <!-- Newsletter -->


<?php 
  include 'includes/footer.php';
?>