<?php
  $title = 'Glozzum: Blog';
  include 'includes/header.php';
?>
    <!--Page Header-->
    <header id="page-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 m-auto text-center">
                    <h1>Read Our Blog</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio culpa ab in voluptatum quam quis eaque animi nam quibusdam iste, itaque sapiente ut totam, illum delectus dolorum laboriosam sint asperiores.</p>
                </div>
            </div>
        </div>
    </header>
    <!--Blog Section-->
    <section id="blog" class="py-3">
        <div class="container">
            <div class="row">
                <div class="col">
                    <!--card columns -->
                    <div class="card-columns">
                    <?php
                      if(isset($_SESSION['loginuser'])){ 

                        $query = "SELECT * FROM post_entries ORDER BY id DESC;";
                        //echo $query;
                        
                        $result = mysqli_query($conn, $query);
                        //loop to display all the blog posts
                        while($row = mysqli_fetch_assoc($result)){
                      

                     echo '
                            <div class="card">
                              <img class="card-img-top img-fluid" src="'.$row['image'].'" alt="Card image cap">
                              <div class="card-body">
                                <h4 class="card-title">'.$row['title'].'</h4>
                                <small class="text-muted">Written by '.$row['author'].' on '.$row['date'].'</small>
                                <hr>
                                <p class="card-text">'.$row['description'].'</p>
                              </div>
                            </div>
                           ';
                          } //end while
                          
                        }else{
                            echo 'Must be logged in to view this page';
                          }
                      ?>
                            <!-- <div class="card">
                              <img class="card-img-top img-fluid" src="https://source.unsplash.com/random/300x200" alt="Card image cap">
                              <div class="card-body">
                                <h4 class="card-title">Blog Post Two</h4>
                                <small class="text-muted">Written by Sam on 08/30</small>
                                <hr>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, enim impedit, nam voluptate eligendi, quia facilis ea repudiandae neque optio quaerat blanditiis! Veniam magnam obcaecati ullam asperiores laboriosam eaque natus?</p>
                              </div>
                            </div>
                            <div class="card bg-primary text-white text-center p-3">
                              <blockquote class="blockquote mb-0">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
                                <footer class="blockquote-footer">
                                  <small>
                                    Someone famous in <cite title="Source Title">Source Title</cite>
                                  </small>
                                </footer>
                              </blockquote>
                            </div>
                            <div class="card text-center">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This card has a regular title and short paragraphy of text below it.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                              </div>
                            </div>
                            <div class="card">
                                    <img class="card-img-top img-fluid" src="https://source.unsplash.com/random/300x200" alt="Card image cap">
                                    <div class="card-body">
                                      <h4 class="card-title">Blog Post Three</h4>
                                      <small class="text-muted">Written by Denise on 09/20</small>
                                      <hr>
                                      <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, enim impedit, nam voluptate eligendi, quia facilis ea repudiandae neque optio quaerat blanditiis! Veniam magnam obcaecati ullam asperiores laboriosam eaque natus?</p>
                                    </div>
                            </div>
                           
                            <div class="card">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is another card with title and supporting text below. This card has some additional content to make it slightly taller overall.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                              </div>
                            </div> -->
                      </div>
                </div>
            </div>
        </div>
    </section>

<?php
  include 'includes/footer.php';
?>