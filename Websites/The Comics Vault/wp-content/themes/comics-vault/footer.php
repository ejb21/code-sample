<footer><?php

    ob_start();
    dynamic_sidebar('footer');
    
    $sidebar = ob_get_contents();

    $sidebar = preg_replace(array(
        '/<div[^>]*>/',
        '/<\/div>$/'
    ), '', $sidebar);

    ob_end_clean();

    echo $sidebar;

?></footer>

<?php
    wp_footer();
?>

</body>
</html>