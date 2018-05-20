<?php
define('WP_SITEURL', '/');

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

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
define('AUTH_KEY',         'cTOe;mQC2bn_)GhIG{$=2u#9iKtJ$g]1j@fd2#:{3!~W-lP8XJocqgrX;!zx9lBi');
define('SECURE_AUTH_KEY',  'l{x;lVmb-)OrJc,_irsMq+G} n|:JN!Mv82-Hp`m*~u%HiQl?M:6hk1Jh&v^&[cr');
define('LOGGED_IN_KEY',    'm60EbT@-.>L>l^2UlV)>72|:`N{P36!^r48O#dGEvr 6Pxbbc6Yt07Ssr.*^L[z)');
define('NONCE_KEY',        '@y%b.:T6Uk#o`mE|DtS]9nR:L,<D:/_/D8O%1xbwN|b?gfzH,G7q&cIXZQR|Nl<m');
define('AUTH_SALT',        '!ZG=SV`tHG|$r/k16+L8:My [Qw)d~s+Ywov#.9RP7S_nRzB/ FG+2+$Uuw;g$I0');
define('SECURE_AUTH_SALT', ' mX&6JpS| ]WC$ce|KX~~V*@)yqr5{:;u0gD.p~1^/?6/*(Ae~AUk5IR.UyZctz|');
define('LOGGED_IN_SALT',   '+%=+;;>uS*o#S|}2HrYi?&AkQd[#Ll{ZQYX6x/Uzx:l^e#m8]EC{x``TW@~)x%p@');
define('NONCE_SALT',       '#_c?#hGRnjyLw;t-7yLhxzhAp|D7sf!<Se&BB,F*F(7iT>lR@d:W;ut2g@|]zs6U');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

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


