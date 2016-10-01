<?php

/**
 * login.php -- simple login screen
 * Patrick Appiah-Kubi 
 */

/** This is the login page */
define('PAGE_NAME', 'login');


define('B_PATH','../');


require_once(B_PATH . 'functions/global.php');
//require_once(B_PATH . 'functions/i18n.php');
require_once(B_PATH . 'functions/plugin.php');
require_once(B_PATH . 'functions/constants.php');
require_once(B_PATH . 'functions/page_header.php');
require_once(B_PATH . 'functions/html.php');
require_once(B_PATH . 'functions/forms.php');

/**
 * Allow administrators to define custom session handlers
 * for bare without needing to change anything in
 * php.ini (application-level).
 *
 * In config_local.php, admin needs to put:
 *
 *     $custom_session_handlers = array(
 *         'my_open_handler',
 *         'my_close_handler',
 *         'my_read_handler',
 *         'my_write_handler',
 *         'my_destroy_handler',
 *         'my_gc_handler',
 *     );
 *     session_module_name('user');
 *     session_set_save_handler(
 *         $custom_session_handlers[0],
 *         $custom_session_handlers[1],
 *         $custom_session_handlers[2],
 *         $custom_session_handlers[3],
 *         $custom_session_handlers[4],
 *         $custom_session_handlers[5]
 *     );
 * 
 * We need to replicate that code once here because PHP has
 * long had a bug that resets the session handler mechanism
 * when the session data is also destroyed.  Because of this
 * bug, even administrators who define custom session handlers
 * via a PHP pre-load defined in php.ini (auto_prepend_file)
 * will still need to define the $custom_session_handlers array 
 * in config_local.php.
 */
global $custom_session_handlers;
if (!empty($custom_session_handlers)) {
    $open    = $custom_session_handlers[0];
    $close   = $custom_session_handlers[1];
    $read    = $custom_session_handlers[2];
    $write   = $custom_session_handlers[3];
    $destroy = $custom_session_handlers[4];
    $gc      = $custom_session_handlers[5];
    session_module_name('user');
    session_set_save_handler($open, $close, $read, $write, $destroy, $gc);
}

header('Pragma: no-cache');

do_hook('login_cookie');

$loginname_value = (b_GetGlobalVar('loginname', $loginname) ? htmlspecialchars($loginname) : '');

/* Output the javascript onload function. */

$header = "<script language=\"JavaScript\" type=\"text/javascript\">\n" .
          "<!--\n".
          "  var alreadyFocused = false;\n".
          "  function _loginpage_onload() {\n".//add code here
          "    document.login_form.js_autodetect_results.value = '" . B_PREF_JS_ON . "';\n".
          "    if (alreadyFocused) return;\n".
          "    var textElements = 0;\n".
          "    for (i = 0; i < document.login_form.elements.length; i++) {\n".
          "      if (document.login_form.elements[i].type == \"text\" || document.login_form.elements[i].type == \"password\") {\n".
          "        textElements++;\n".
          "        if (textElements == " . (isset($loginname) ? 2 : 1) . ") {\n".
          "          document.login_form.elements[i].focus();\n".
          "          break;\n".
          "        }\n".
          "      }\n".
          "    }\n".
          "  }\n".
          "// -->\n".
          "</script>\n";
$custom_css = 'none';

// Load default theme if possible
if (@file_exists($theme[$theme_default]['PATH']))
   @include ($theme[$theme_default]['PATH']);


displayHtmlHeader( "$org_name - " . _("Login"), $header, FALSE );

echo "<body text=\"$color[8]\" bgcolor=\"$color[4]\" link=\"$color[7]\" vlink=\"$color[7]\" alink=\"$color[7]\" onLoad=\"_loginpage_onload();\">" . //add code here
     "\n" . addForm('redirect.php', 'post', 'login_form');

$username_form_name = 'login_username';
$password_form_name = 'secretkey';
do_hook('login_top');


if(b_getGlobalVar('mailtodata', $mailtodata)) {
    $mailtofield = addHidden('mailtodata', $mailtodata);
} else {
    $mailtofield = '';
}


echo  html_tag( 'table',
        html_tag( 'tr',
          html_tag( 'td',
                  '<b>' . sprintf (_("%s Login"), "Bare PC") . "</b>\n",
                  'center', $color[0] )
                ) .
                html_tag( 'tr',
                    html_tag( 'td',  "\n" .
                        html_tag( 'table',
                            html_tag( 'tr',
                                html_tag( 'td',
                                    _("Name:") ,
                                'right', '', 'width="30%"' ) .
                                html_tag( 'td',
				    addInput($username_form_name, $loginname_value, 0, 0, ' onfocus="alreadyFocused=true;"'),
                                'left', '', 'width="70%"' )
                                ) . "\n" .
                            html_tag( 'tr',
                                html_tag( 'td',
                                    _("Password:") ,
                                'right', '', 'width="30%"' ) .
                                html_tag( 'td',
				    addPwField($password_form_name, null, ' onfocus="alreadyFocused=true;"').
				    //addHidden('js_autodetect_results', B_PREF_JS_OFF).
                    $mailtofield . 
				    addHidden('just_logged_in', '1'),
                                'left', '', 'width="70%"' )
                            ) ,
                        'center', $color[4], 'border="0" width="100%"' ) ,
                    'left',$color[4] )
                ) . 
                html_tag( 'tr',
                    html_tag( 'td',
                        '<center>'. addSubmit(_("Login")) .'</center>',
                    'left' )
                ),
            '', $color[4], 'border="0" width="350"' ) . '</center>',
        'center' )
    ) ,
'', $color[4], 'border="0" cellspacing="0" cellpadding="0" width="100%"' );
do_hook('login_form');
echo '</form>' . "\n";

do_hook('login_bottom');
?>
</body></html>
