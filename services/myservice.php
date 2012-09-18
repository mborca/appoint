<?php
require_once '../api/api.php';

$id = $_REQUEST['id'];
$action = $_REQUEST['action'];
switch ($action)
{
    case 'get':
        echo json_encode(Service_Provider::GetByFacebookID($id));
        break;
    case 'register':
        $facebook_id = $_REQUEST['facebook_id'];
        $category = $_REQUEST['category'];
        $name = $_REQUEST['name'];
        $description = $_REQUEST['description'];
        $country = $_REQUEST['country'];
        $region = $_REQUEST['region'];
        $city = $_REQUEST['city'];
        $address = $_REQUEST['address'];
        $phone = $_REQUEST['phone'];
        $email = $_REQUEST['email'];
        $longitude = $_REQUEST['longitude'];
        $latitude = $_REQUEST['latitude'];
        echo json_encode(Service_Provider::Register($facebook_id, $category, $name, $description, $country, $region, $city, $address, $phone, $email, $longitude, $latitude));
        break;
    case 'delete':
        echo json_encode(Service_Provider::Delete($id));
        break;
    default:
        throw new Exception("Action not defined: $action");
}
?>
