<?php 
require_once '../api/api.php';

$facebook = new Facebook(array(
    'appId'  => FB_APP_ID,
    'secret' => FB_APP_SECRET
));

// the current page name
$page = str_replace('.php', '', substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'], '/') + 1));

$user_id = 1517375131;
//$user_id = $facebook->getUser();
//if(!$user_id)
//{
//   $oauth_url = 'https://www.facebook.com/dialog/oauth';
//   $oauth_url .= '?client_id='.FB_APP_ID;
//   $oauth_url .= '&redirect_uri='.  urlencode('https://apps.facebook.com/appointments-app/');
//   $oauth_url .= '&scope=email';
//   client_redirect($oauth_url);
//}

?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html xmlns:fb="http://ogp.me/ns/fb#" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html xmlns:fb="http://ogp.me/ns/fb#" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html xmlns:fb="http://ogp.me/ns/fb#" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html xmlns:fb="http://ogp.me/ns/fb#" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="../resources/css/normalize.css">
        <link rel="stylesheet" href="../resources/css/base.css">
        <link rel="stylesheet" href="../resources/css/main.css">
    </head>
    <body id="page-<?php echo $page; ?>">