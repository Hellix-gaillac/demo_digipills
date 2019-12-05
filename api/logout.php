<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type:application/json');
require_once './class/Cfg.php';
session_destroy();
$response = array();
$response['ok'] = true;
$response['message'] = "deconnection";

echo json_encode($response);
exit;
