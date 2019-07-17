<?php 
$title = "Glozzum: Contact";
include 'includes/header.php';
?>
    

    <div class="headerimg text-center text-white p-5 mb-4">
        <div class="col-4 center">
            <h3>Contact Us</h3>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quas, temporibus?</p>
        </div>
    </div>
    <!--Form and Side Thing-->
    <div class="container">
        <div class="row mb-4">
            <div class="col-4">
                <div class="contact_container">
                    <h5>Get in Touch</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adispisicing elit. paiatur, odio!</p>
                    <h5>Address</h5>
                    <p>550 Main st, Boston MA</p>
                    <h5>Email</h5>
                    <p>test@test.com</p>
                    <h5>Phone</h5>
                    <p>(555) 555-5555</p>
                </div>
            </div>
            <div class="col-8">
                <div class="contact_container">
                    <h4 class="text-center">Please fill out this form to contact us</h4>
                    <form>
                        <div class="row mb-4">
                            <div class="col">
                                <input type="text" class="form-control" placeholder="First name">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Last name">
                            </div>
                        </div>
        
                        <div class="row mb-4">
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Email">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Phone Number">
                            </div>
                        </div>
        
                        <div class="row mb-4">
                            <div class="col">
                                <textarea class="form-control" placeholder="Message"></textarea>
                            </div>
                        </div>
                        
                        <div class="row mb-4">
                            <div class="col">
                                <input type="submit" class="form-control btn-outline-danger" value="Submit">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>    

    <!--Our Staff-->
    <div class="bg-dark text-center text-white p-4 mb-0">
            <div class="row">
                <div class="col">
                    <h3 class="">Our Staff</h3>
                </div> 
            </div>
            <div class="row">
                <div class="col-3">
                    <img class="rounded-circle mb-1" src="img/person1.jpg">
                    <h5>Jane Doe</h5>
                    <p>Marketing Manager</p>
                </div>
                <div class="col-3">
                    <img class="rounded-circle mb-1" src="img/person2.jpg">
                    <h5>Sara Williams</h5>
                    <p>Business Manager</p>
                </div>
                <div class="col-3">
                    <img class="rounded-circle mb-1" src="img/person3.jpg">
                    <h5>John Doe</h5>
                    <p>CEO</p>
                </div>
                <div class="col-3">
                    <img class="rounded-circle mb-1" src="img/person4.jpg">
                    <h5>Steve Smith</h5>
                    <p>Web Developer</p>
                </div>
            </div>
    </div>


<?php 
  include 'includes/footer.php';
?>