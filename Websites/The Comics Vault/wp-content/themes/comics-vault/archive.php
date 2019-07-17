<?php get_header(); ?>

    <main id="<?php $term = get_queried_object(); echo $term->slug; ?>">

        <aside style="float: right;">
            <?php get_sidebar(); ?>
        </aside>

        <?php 
            if ( have_posts() ) :
                
                the_archive_title( '<h1>', '</h1>' );
                // the_archive_description( '<div class="archive-description">', '</div>' );
        ?>

        <ul>
            <?php while ( have_posts() ) : the_post(); ?>

            <li>
                <article id="<?php echo $post->post_name; ?>">
                    <?php
                        if (has_post_thumbnail( $post->ID ) ):
                            $thumbID = get_post_thumbnail_id( $post->ID );
                            $image = wp_get_attachment_image_src( $thumbID, 'single-post-thumbnail' );
                    ?>

                    <a href="<?php echo get_permalink(); ?>">
                        <figure class="article-image">
                            <img alt="<?php echo get_post_meta($thumbID, '_wp_attachment_image_alt', true); ?>" src="<?php echo $image[0]; ?>">
                        </figure>
                    </a>

                    <?php endif; ?>

                    <h2 class="article-title"><a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a></h2>

                    <time class="article-date" datetime="<?php echo get_the_date('Y-m-d'); ?>"><?php echo get_the_date(); ?></time>
                    <p class="article-description"><?php echo get_post_meta(get_the_ID(), '_genesis_description', true); ?></p>
                    
                    <a class="read-more" href="<?php echo get_permalink(); ?>"><strong>Read more...</strong></a>
                </article>
            </li>

            <?php endwhile; the_posts_navigation(); ?>
        </ul>
        
        <?php
            else : get_template_part( 'template-parts/content', 'none' );
            endif;
		?>

    </main>

<?php
get_footer();
