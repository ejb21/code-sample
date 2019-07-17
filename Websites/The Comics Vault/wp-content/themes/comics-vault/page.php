<?php get_header(); ?>

<main id="page">

    <?php 
        while ( have_posts() ) :
            the_post();
            get_template_part( 'template-parts/content', 'page' );
        endwhile;
    ?>
</main>

<?php
// get_sidebar();
get_footer();
