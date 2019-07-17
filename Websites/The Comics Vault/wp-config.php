<?php
define('WP_CACHE', true);
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'miscfold_wp133');

/** MySQL database username */
define('DB_USER', 'miscfold_wp133');

/** MySQL database password */
define('DB_PASSWORD', '-b3!2YSp12');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'nswkmvezpxuptv1jpx7rsxz4ixdamw0yledbcd1dtcz5iaj8iwlsu2yhycrk6uc0');
define('SECURE_AUTH_KEY',  '02kcet8ypwcl6g0kynuzm4zbzieey1btbno5p8kpamnvynd0dvxbc124vlmjitrn');
define('LOGGED_IN_KEY',    'qb5afdspwjb0enqvsoautkf7ifykvbihmrsfnsckcgcwiqlta57lo7fnqziq1nru');
define('NONCE_KEY',        'fue1pyphcmleofvacksyafpq3edkenmmmf0hafvwlh2n78qtjuhthrwb55lvwge9');
define('AUTH_SALT',        'xlxmeifmsafh0pvt0tskl1vtxgaxuihywhyyzpmvkduwwuueg275ne0aipju1jrq');
define('SECURE_AUTH_SALT', 'ptv7ictgko2fmmz35nrmr3k4ecjotugttkjs0v7ltvyptx1nc3wddiycere5knml');
define('LOGGED_IN_SALT',   '849yws8bjbxx30jltl05j3ine4g53g4bfs5mn1zyilobkv8ueiyodfpeayrqbmdu');
define('NONCE_SALT',       'ssrkq8ih9w8assbhsou6fu1uz327wixxt2h0eu9znssh3u6aj4qgb8tnhn9zwwdz');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wpas_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
