    <!-- Footer -->
    
    <footer id="main-footer" class = "text-center p-4">
      <div class="container">
        <div class="row">
          <div class="col">
            <p> Copyright &copy;
            <span id="year"></span> Glozzum</p>

          </div>
        </div>
      </div>
    </footer>
    
    <!-- These script elements must be in this order -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="slick/slick.min.js"></script>
    <script type="text/javascript">

      //Custom scripts (internal script or external script)

      //Get the current year

      $('#year').text(new Date().getFullYear());

      //video play

      autoPlayYouTubeModal();

      //FUNCTION TO GET AND AUTO PLAY YOUTUBE VIDEO FROM DATATAG
          function autoPlayYouTubeModal() {
              var trigger = $("body").find('[data-toggle="modal"]');
              trigger.click(function () {
                  var theModal = $(this).data("target"),
                      videoSRC = $(this).attr("data-video"),
                      videoSRCauto = videoSRC + "?autoplay=1";
                  $(theModal + ' iframe').attr('src', videoSRCauto);
                  $(theModal + ' button.close').click(function () {
                      $(theModal + ' iframe').attr('src', videoSRC);
                  });
              });
          }

          // Slick slider

          $(document).ready(function(){
            $('.slider').slick();
          });
          
    </script>
    
    <!-- Login Modal -->

    <!-- Modal -->
      <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Modal Login</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form name="registerForm" id="registerForm" formenctype="value" method="post" actions="includes/register.php">
              <!-- Username Field -->
              <div class="form-group">
                  <label for="loginUsername">Username</label>
                  <input type="text" class="form-control" name="loginUsername" id="loginUsername" aria-describedby="usernameHelp" placeholder="Username">
                  <small id="usernameHelp" class="form-text text-muted"></small>
              </div>
              <!-- Password Field -->
              <div class="form-group">
                  <label for="loginPassword">Password</label>
                  <input type="password" class="form-control" name="loginPassword" id="loginPassword" placeholder="Password">
              </div>
            </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               
               <!-- Submit Button -->
              <button type="submit" class="btn btn-primary" name="loginSubmit" id="loginSubmit">Submit</button>
              
            </form>
            </div>
          </div>
        </div>
      </div>


    <!-- Register Modal -->

    <!-- Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal Register</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <form name="registerForm" id="registerForm" formenctype="value" method="post" actions="index.php">
            <!-- Username Field -->
            <div class="form-group">
                <label for="registerUsername">Username</label>
                <input type="text" class="form-control" name="registerUsername" id="registerUsername" aria-describedby="usernameHelp" placeholder="Username">
                <small id="usernameHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <!-- Password Field -->
            <div class="form-group">
                <label for="registerPassword">Password</label>
                <input type="registerPassword" class="form-control" name="registerPassword" id="registerPassword" placeholder="Password">
            </div>
            <!-- Password Confirm Field -->
            <div class="form-group">
                <label for="registerConfirmPassword">Confirm Password</label>
                <input type="confirmPassword" class="form-control" name="registerConfirmPassword" id="registerConfirmPassword" placeholder="Confirm Password">
            </div>
            <!-- Email Address Field -->
            <div class="form-group">
                <label for="registerEmail">Email Address</label>
                <input type="email" class="form-control" name="registerEmail" id="registerEmail" aria-describedby="emailHelp" placeholder="Email">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               
               <!-- Submit Button -->
              <button type="submit" class="btn btn-primary" name="registerSubmit" id="registerSubmit">Register</button>

            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- End Register Modal -->

    <!-- Register Form -->


    
  </body>
  </html>
