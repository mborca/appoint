<?php

require_once '../api/api.php';

$category = $_REQUEST['category'];
$country = $_REQUEST['country'];
$city = $_REQUEST['city'];
echo json_encode(Service_Provider::Search($category, $country, $city));
?>
