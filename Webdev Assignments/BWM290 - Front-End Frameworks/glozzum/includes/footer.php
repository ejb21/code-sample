    <!--Footer -->
    <footer id="main-footer" class="text-center p-4">
      <div class="container">
        <div class="row">
          <div class="col">
            <p>Copyright &copy;
            <span id="year"></span> Glozzum</p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Video Modal -->
    <div class="modal fade" id="videoModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <iframe src="" frameborder="0" height="350" width="100%" allowfullscreen></iframe>
            </div>
          </div>
        </div>
      </div>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="loginModalLabel">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- Login form -->
            <form name="loginForm" id="loginForm" formenctype="value" method="post" action="index.php" novalidate>
              <div class="form-group">
                <label for="loginUsername">Username</label>
                <input type="text" class="form-control" name="loginUsername" id="loginUsername" placeholder="Enter username">
              </div>
              <div class="form-group">
                <label for="loginPassword">Password</label>
                <input type="password" class="form-control" name="loginPassword" id="loginPassword" placeholder="Enter password">
              </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <input type="submit" name="loginsubmit" id="loginsubmit" class="btn btn-primary" value="Login">
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Register Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="registerModalLabel">Register</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- Register form -->
            <form name="registerForm" id="registerForm" formenctype="value" method="post" action="index.php" novalidate>
              <div class="form-group">
                <label for="registerUsername">Username</label>
                <input type="text" class="form-control" name="registerUsername" id="registerUsername" placeholder="Enter username (8 characters)">
              </div>
              <div class="form-group">
                <label for="registerPassword">Password</label>
                <input type="password" class="form-control" name="registerPassword" id="registerPassword" placeholder="Enter password">
              </div>
              <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="form-control" name="registerConfirmPassword" id="registerConfirmPassword" placeholder="Enter confirm password">
              </div>
              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" name="registerEmail" id="registerEmail" aria-describedby="emailHelp" placeholder="Enter email address">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
              </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <input type="submit" name="registersubmit"  id="registersubmit" class="btn btn-primary" value="Register">
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- These script elements must be in this order -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="slick/slick.min.js"></script>

    <script>
        //Custom scripts (internal script or external script)

        //Get the current year for the copyright
        $('#year').text(new Date().getFullYear());

        //Video Play
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

        $(document).ready(function(){
            $('.slider').slick();
        });
    </script>
</body>

</html>