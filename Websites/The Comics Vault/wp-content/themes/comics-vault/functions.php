<?php

/*  Underscores functions -- see backup for developer comments  */

if ( ! function_exists( 'comics_vault_setup' ) ) :

    function comics_vault_setup()
    {
		load_theme_textdomain( 'comics-vault', get_template_directory() . '/languages' );
		add_theme_support( 'automatic-feed-links' );
		add_theme_support( 'title-tag' );
        add_theme_support( 'post-thumbnails' );
        
		register_nav_menus( array(
			'menu-1' => esc_html__( 'Primary', 'comics-vault' ),
		) );

		add_theme_support( 'html5', array(
			'search-form',
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
		) );

		add_theme_support( 'custom-background', apply_filters( 'comics_vault_custom_background_args', array(
			'default-color' => 'ffffff',
			'default-image' => '',
		) ) );

		add_theme_support( 'customize-selective-refresh-widgets' );

		add_theme_support( 'custom-logo', array(
			'height'      => 250,
			'width'       => 250,
			'flex-width'  => true,
			'flex-height' => true,
		) );
	}
endif;

add_action( 'after_setup_theme', 'comics_vault_setup' );

function comics_vault_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'comics_vault_content_width', 640 );
}

add_action( 'after_setup_theme', 'comics_vault_content_width', 0 );

function comics_vault_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'Sidebar', 'comics-vault' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here.', 'comics-vault' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2>',
		'after_title'   => '</h2>',
    ) );
    
    register_sidebar( array(
        'name'          => 'Footer',
        'id'            => 'footer',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
        'before_title'  => '<h2>',
        'after_title'   => '</h2>',
    ));
}

add_action( 'widgets_init', 'comics_vault_widgets_init' );

function comics_vault_scripts() {
	wp_enqueue_script( 'comics-vault-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );

	wp_enqueue_script( 'comics-vault-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'comics_vault_scripts' );

require get_template_directory() . '/inc/custom-header.php';
require get_template_directory() . '/inc/template-tags.php';
require get_template_directory() . '/inc/template-functions.php';
require get_template_directory() . '/inc/customizer.php';

if ( defined( 'JETPACK__VERSION' ) ) {
	require get_template_directory() . '/inc/jetpack.php';
}

add_filter( 'get_the_archive_title', function ($title) {

    if ( is_category() ) { $title = single_cat_title( '', false ); }
    elseif ( is_tag() ) { $title = single_tag_title( '', false ); }
    elseif ( is_author() ) { $title = '<span class="vcard">' . get_the_author() . '</span>' ; }
    return $title;
});

/*  end Underscores  */