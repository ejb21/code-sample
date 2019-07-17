<?php get_header(); ?>

    <main id="not-found">

        <article id="404">

            <h1>Page Not Found</h1>
            <p>Generic text</p>

            <?php
                get_search_form();
                // the_widget( 'WP_Widget_Recent_Posts' );
            ?>

        </article>

    </main>

<?php
get_footer();
