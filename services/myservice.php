<?php
require_once '../api/api.php';
//header('Content-type: text/json');

$id = $_REQUEST['id'];
$action = $_REQUEST['action'];
switch ($action)
{
    case 'get':
        echo json_encode(Service_Provider::Get($id));
        break;
    case 'register':
        break;
    case 'delete':
        break;
    default:
        throw new Exception("Action not defined: $action");
}
?>
