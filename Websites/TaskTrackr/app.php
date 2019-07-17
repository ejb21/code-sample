<?php
require_once "helpers/csrf.php";

$csrf = new CSRF_Protect();
?>
<!doctype html>
<html>


<head>
    <meta charset="utf-8">
    <title>TaskTrackr</title>
    
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/tablestyle.css" rel="stylesheet" type="text/css">
    
    <script>
        var MyVar = {} ;
        
        function minimize( element , node , parent )
            {
                document.getElementById( 'far' ).appendChild( document.getElementById( element ) ) ;
                
                node.remove() ;
                
                parent.className = 'fartask' ;
            }
        
        function popup( task )
            {
                document.getElementById( 'popup' ).style.display = "block" ;
                
                MyVar.task = task ;
            }
        
        function remove()
            {
                document.getElementById( 'popup' ).style.display = "none" ;
                
                document.getElementById( MyVar.task ).style.display = "none" ;
            }
        
        function complete()
            {
                document.getElementById( 'popup' ).style.display = "none" ;
                
                document.getElementById( MyVar.task ).style.display = "none" ;
            }
        
        function cancel()
            {
                document.getElementById( 'popup' ).style.display = "none" ;
            }
        
        function modify()
            {
                document.getElementById( 'modifypanel' ).style.display = "block" ;
            }
        
        function modcancel()
            {
                document.getElementById( 'modifypanel' ).style.display = "none" ;
            }
    </script>
</head>


<body>
<header></header>
    
<div id="body">
    <button onclick="location.href='actions/logout.php';" id="logout">LOG OUT</button>
    <button onclick="modify()" id="modify">MODIFY ACCOUNT</button>

    <div id="mapcontain">
        <img src="images/Frame.png">
    </div>

    <div id="map">
        <script>
            function myMap()
                {
                    var mapProp =
                        {
                            center: new google.maps.LatLng
                                        ( 41.234789 , -77.021957 ) ,
                            zoom: 13 ,
                        } ;

                    var map = new google.maps.Map( document.getElementById( "map" ) , mapProp ) ;
                }
            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUX3EydTl1W8x0n4mk_ESEQMGTxOIaBs8&callback=myMap">
        </script>
    </div>

    <div id="inbody">
        <h1>MY TASKS</h1>
<!--        
    <div id="near">
        <div class="neartask" id="1">
            Sample Task<span class="dash" onclick="minimize(this.parentNode.id , this , this.parentNode)">—</span><span class="ex" onclick="popup(this.parentNode.id)">X</span><br>
            <span class="loc">WILLIAMSPORT, PA</span>
        </div>
    </div>
        
        <h1 id="othertasks">OTHER TASKS</h1>
        
    <div id="far">
        <div class="fartask" id="2">
            Sample Task<span class="ex" onclick="popup(this.parentNode.id)">X</span><br>
            <span class="loc">MILL HALL, PA</span>
        </div>
    </div>
-->
    
<? include("helpers/render_tasks_table.php"); ?>

        <div id="addtask">
            <h2>ADD A TASK:</h2>
            
            <div id="leftcol">
                Task Name:<br>
                Task Latitude:<br>
                Task Longitude:
            </div>
            
            <div id="rightcol">
            <?php
                require_once "helpers/csrf.php";
                $csrf = new CSRF_Protect();
            ?>
                <form action="actions/add_task.php" id="taskadd">
                    <? $csrf->echoInputField(); ?>
                    <input type="text" id="taskname" name="name" size="40" required><br>
                    <input type="number" id="tasklat" name="latitude" size="40" step="0.000001" required>
                    <input type="number" id="tasklong" name="longitude" size="40" step="0.000001" required>
            
                    <button type="submit" id="tasksub">ADD TASK</button>
                </form>
            </div>
        </div>
        
        <div id="addtaskbg"></div>
        
        <div id="popup">
            <p>Remove task or mark as complete?<br></p>
            
            <button id="remove" onclick="remove()" class="popupbutt">REMOVE</button>
            <button id="complete" onclick="complete()" class="popupbutt">COMPLETE</button>
            <button id="cancel" onclick="cancel()" class="popupbutt">CANCEL</button>
        </div>
    </div>
    
</div>
    
    <div id="modifypanel">
    <?php
        require_once "helpers/csrf.php";
        $csrf = new CSRF_Protect();
    ?>
        <form id="registerform" method="post" action="api.php?action=modify_account">
            <? $csrf->echoInputField(); ?>

            <label for="fname" id="fnamelabel">FIRST NAME:</label><br>
            <input type="text" name="first_name" id="fname" required><br>

            <label for="lname" id="lnamelabel">LAST NAME:</label><br>
            <input type="text" name="last_name" id="lname" required><br>

            <label for="username" id="usernamelabel">USERNAME:</label><br>
            <input type="text" name="username" id="username" required><br>

            <label for="password" id="passwordlabel">PASSWORD:</label><br>
            <input type="password" name="password0" id="password" required><br>

            <label for="confpass" id="confpasslabel">CONFIRM PASSWORD:</label><br>
            <input type="password" name="password1" id="confpass" required><br>

            <button type="submit">MODIFY</button>
            <input type="button" onclick="modcancel()" value="CANCEL">
        </form>
    </div>

</body>

</html>