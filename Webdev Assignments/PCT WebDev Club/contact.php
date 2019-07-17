<!DOCTYPE html>
<!-- Author: Ryan Belack
     Date: 05/04/2018 -->

<html>

<head>
    <?php include "inc/head.php" ?>
    
    <title>PCT WebDevs — Contact</title>
 </head>

<body>
    <div id="container">
        <?php include "inc/header.php" ?>

        <div id="content">

        <section class="contact">

            <h1 class="contact_heading">G<span class="u-smallcap u-inline">et In</span> T<span class="u-smallcap u-inline">ouch<br class="u-m-visible"> With</span> O<span class="u-smallcap u-inline">ur</span> T<span class="u-smallcap u-inline">eam</span></h1>
            <h2 class="contact_heading--sub">Contact Information</h2>
            
            <div id="googleMap" style="max-width:150rem;width:85%;height:400px;" class="contact_map"> </div>

            <script>
            function myMap() {
            var mapProp= {
                center:new google.maps.LatLng(41.234318, -77.023470),
                zoom:15,
            };
            var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
            }
            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJegloAmoNNXmNBYkeCgkdCqBKS-1x3JI&callback=myMap"></script>

            <div class="row contact contact_address">
                <div class="col-1-of-3">
                    <h3 class="contact_heading--info">Address</h3>
                    <p class="contact_info">206 College Ave<p>
                    <p class="contact_info">Williamsport, PA<p>
                </div>
                <div class="col-1-of-3">
                    <h3 class="contact_heading--info">Email</h3>
                    <p class="contact_info">mja8@pct.edu<p>
                </div>
                <div class="col-1-of-3">
                    <h3 class="contact_heading--info">Phone</h3>
                    <p class="contact_info">123 456 7890<p>
                </div>
            </div>

            <hr style="text-align:center; margin: 0 auto;width:50%">

            <h2 class="contact_heading--sub">Get In Touch</h2>


        </section>

        <section>
           
            <form class="contactForm">
                <div class="name" style="float:left">
                    <label>Name</label>
                    <input name="name" id="name" type="text" required>
                </div>
                <div class="email" style="float:left">
                    <label>Email</label>
                    <input name="email" id="email" type="text" required>
                </div>
                <div class="company">
                    <label>Company</label>
                    <input name="company" id="company" type="text" required>
                </div>
                <div class="message">
                    <label>Describe in More Detail</label>
                    <textarea name="message" id="message" type="text"></textarea>
                </div>
                <input name="submit" id="submit" type="submit">
            </form>
        </section>

        </div>

        
            <?php include "inc/footer.php" ?>
       
    </div>
</body>

</html>