<?php

require_once '../api/api.php';

$id = $_REQUEST['id'];
echo json_encode(Appointment::Delete($id));
?>
