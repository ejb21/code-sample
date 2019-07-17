<article id="<?php echo $post->post_name; ?>">

    <?php if (!is_front_page()) { ?><h1><?php the_title(); ?></h1> <?php }

	    the_content(); ?>

</article>