<?php
require_once '../api/api.php';

$start_date = $_REQUEST['start_date'];
$end_date = $_REQUEST['end_date'];
$service_provider_facebook_id = $_REQUEST['service_provider_facebook_id'];
$user_email = $_REQUEST['user_email'];
$user_facebook_id = $_REQUEST['user_facebook_id'];
$user_firstname = $_REQUEST['user_firstname'];
$user_lastname = $_REQUEST['user_lastname'];
        
echo json_decode(Appointment::Insert($start_date, $end_date, $service_provider_facebook_id, $user_email, $user_facebook_id, $user_firstname, $user_lastname));
?>
