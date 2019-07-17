<?php get_header(); ?>

    <main id="post">
        <?php
            while ( have_posts() ) :
                the_post();
                get_template_part( 'template-parts/content', get_post_type() );
            endwhile;
        ?>
    </main>

<?php
// get_sidebar();
get_footer();
