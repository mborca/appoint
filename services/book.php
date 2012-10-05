<?php

require_once '../api/api.php';
require_once 'notification.php';

$start_date = $_REQUEST['start_date'];
$end_date = $_REQUEST['end_date'];
$service_provider_facebook_id = $_REQUEST['service_provider_facebook_id'];
$user_email = $_REQUEST['user_email'];
$user_facebook_id = $_REQUEST['user_facebook_id'];
$user_firstname = $_REQUEST['user_firstname'];
$user_lastname = $_REQUEST['user_lastname'];
$action = $_REQUEST['action'];

$notification = new Notification(FB_APP_TOKEN);

/*
  if ($notification->sendNotification($service_provider_facebook_id, 'You have have receive a new appointment.'))
  $notification->sendTwilioNotification('15149525261');//15148037957
 */

if ($action == 'book') {
    echo $user_facebook_id;
    $fbNotif = $notification->sendNotification($user_facebook_id, 'You have received a new appointment from Appoint on octobre 20th.');
    //if ($fbNotif == 1) {
    $twilioNotif = $notification->sendTwilioNotification(TWILIO_PHONE);
    if ($twilioNotif == 1) {
        echo 'All notifications ok!';
    } else {
        echo $twilioNotif;
    }
    // }

    echo json_decode(Appointment::Insert($start_date, $end_date, $service_provider_facebook_id, $user_email, $user_facebook_id, $user_firstname, $user_lastname));
} else if ($action == 'cancel') {
    echo 'action=' + $action;
    echo 'user_facebook_id=' + $user_facebook_id;
    echo 'startdate=' + $start_date;
    $fbNotif = $notification->sendNotification($user_facebook_id, 'An appointment has been canceled from Appoint on octobre 20th.');
    //if ($fbNotif == 1) {
    $twilioNotif = $notification->sendTwilioNotification(TWILIO_PHONE);
    if ($twilioNotif == 1) {
        echo 'All notifications ok!';
    } else {
        echo $twilioNotif;
    }
    // }
    json_decode(Appointment::Delete($user_facebook_id, $start_date));
}
?>
