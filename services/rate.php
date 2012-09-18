<?php
require_once '../api/api.php';

$rating = $_REQUEST['rating'];
$facebook_id = $_REQUEST['facebook_id'];
$service_provider_facebook_id = $_REQUEST['service_provider_facebook_id'];

echo json_decode(Service_Provider::Rate($rating, $facebook_id, $service_provider_facebook_id))
?>
