<article id="<?php echo $post->post_name; ?>">
    <h1><?php the_title(); ?></h1>
        
<?php
    echo '<time datetime="' . get_the_date('Y-m-d') . '">' . get_the_date() . '</time>';
    the_content();
?>

</article>