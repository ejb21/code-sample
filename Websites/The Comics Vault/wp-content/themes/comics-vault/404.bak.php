<?php get_header(); ?>

    <main id="not-found">

        <article id="404">

            <h1>Page Not Found</h1>
            <p>Generic text</p>

            <?php
                get_search_form();
                // the_widget( 'WP_Widget_Recent_Posts' );
            ?>

            <div class="widget widget_categories">
                <h2 class="widget-title"><?php esc_html_e( 'Most Used Categories', 'comics-vault' ); ?></h2>
                <ul>
                    <?php
                    wp_list_categories( array(
                        'orderby'    => 'count',
                        'order'      => 'DESC',
                        'show_count' => 1,
                        'title_li'   => '',
                        'number'     => 10,
                    ) );
                    ?>
                </ul>
            </div><!-- .widget -->

            <?php
            /* translators: %1$s: smiley */
            $comics_vault_archive_content = '<p>' . sprintf( esc_html__( 'Try looking in the monthly archives. %1$s', 'comics-vault' ), convert_smilies( ':)' ) ) . '</p>';
            the_widget( 'WP_Widget_Archives', 'dropdown=1', "after_title=</h2>$comics_vault_archive_content" );

            the_widget( 'WP_Widget_Tag_Cloud' );
            ?>

        </article>

    </main>

<?php
get_footer();
