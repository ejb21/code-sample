<!DOCTYPE html>
<html>
<head>
    <title>PCT WebDevs — Apply</title>
    <link rel="canonical" href="http://rsbelack254.com/webdevclub/apply">
    <!--
     Author: Malachi Atkinson
     Date:   Literally the night before it's due
    
    -->
    <?php include "inc/head.php"; ?>
</head>
<body>
    <div id="container">
        <?php include "inc/header.php"; ?>
        <div id="content">
            <section class="contactform">
            <h2 class="page-header">
                Fill Out this Application so Our Team can Help Your Company
            </h2>
            <form>
                <div class="name" style="float:left">
                    <label>Name</label>
                    <input name="name" id="name" type="text" required>
                </div>
                <div class="email" style="float:left">
                    <label>Email</label>
                    <input name="email" id="email" type="text" required>
                </div>
                <div class="address">
                    <label>Address</label>
                    <input name="address" id="address" type="text" required>
                </div>
                <div class="service">
                    <label>What Services Do You Require?</label>
                    <div class="checkboxes">
                        <input name="services" id="residential" type="checkbox">
                        <label>Website Design</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Video Production</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Photography</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Graphic Design</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>E-Commerce</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>SEO</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Content Management</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Hosting</label>
                    </div>
                    <div class="checkboxes">
                        <input name="services" id="checkbox" type="checkbox">
                        <label>Other</label>
                    </div>
                </div>
                <div class="message">
                    <label>Describe in More Detail</label>
                    <textarea name="message" id="message" type="text"></textarea>
                </div>
                <input name="submit" id="submit" type="submit">
            </form>
        </section>
        </div>
        <?php include "inc/footer.php"; ?>
    </div>
</body>
</html>