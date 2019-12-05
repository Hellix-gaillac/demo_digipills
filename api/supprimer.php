<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
require_once 'class/Cfg.php';
// if (!AbstractUser::getUserSession(User::class))
// 	exit;
$response = array();
$opt = ['options' => ['min_range' => 1]];
$id_prise = filter_input(INPUT_GET, 'id_prise', FILTER_VALIDATE_INT, $opt);
if ($id_prise) {
	$priseOcc = new PriseOccasionnelle();
	$priseOcc->id_prise = $id_prise;
	$nbSuppOcc = $priseOcc->supprimer();
	$priseReg = new PriseReguliere();
	$priseReg->id_prise = $id_prise;
	$nbSuppReg = $priseReg->supprimer();
	$prise = new Prise($id_prise);
	$prise->supprimer();

	if ($nbSuppReg || $nbSuppOcc) {
		$response['ok'] = true;
		$response['message'] = " id_prise : {$id_prise} supprimé : nb{$nbSuppReg}{$nbSuppOcc}";
	} else {
		$response['ok'] = false;
		$response['message'] = " id_prise : {$id_prise} ERREUR suppression , pas de priseReg ou priseOcc supprimées";
	}

	echo json_encode($response);
	exit;
}
