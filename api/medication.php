<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type:application/json');
require_once './class/Cfg.php';

$opt = ['options' => ['min_range' => 1]];
$response = array();
$tabErreur = [];
$user = new User();
if (filter_input(INPUT_GET, 'id_user')) {
    // charger les prises d'un utilisateur connecté avec vérif de token
    $user->jwt = filter_input(INPUT_POST, 'token', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
    $user->id_user = filter_input(INPUT_GET, 'id_user', FILTER_VALIDATE_INT, $opt);
    if ($user->verifJwt()) {
        $prise = Prise::toutes($user->id_user);
        $response['ok'] = true;
        $response['get'] = true;
        $response['message'] = "Toutes les prises envoyées!";
        $response['data'] = $prise;
    } else {
        $response['ok'] = false;
        $response['message'] = "L'utilisateur et le token ne correspondent pas";
    }
    echo json_encode($response);
    exit;
}
$prise = new Prise();
if (filter_input(INPUT_POST, 'submit')) {
    // enregistrement nouvelle prises ou modification grâce à id_prise
    $user->id_user = filter_input(INPUT_POST, 'id_user', FILTER_VALIDATE_INT, $opt);
    $user->jwt = filter_input(INPUT_POST, 'token', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
    if ($user->verifJwt()) {
        $prise->id_user = $user->id_user;
        $prise->id_prise = filter_input(INPUT_POST, 'id_prise', FILTER_VALIDATE_INT, $opt);
        $prise->code_cis = filter_input(INPUT_POST, 'code_cis', FILTER_VALIDATE_INT, $opt);
        $prise->denomination = filter_input(INPUT_POST, 'denomination', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
        $prise->notice = filter_input(INPUT_POST, 'notice', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
        $prise->unite_dosage = filter_input(INPUT_POST, 'unite_dosage', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
        $prise_reguliere = filter_input(INPUT_POST, 'reguliere', FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);
        $prise_occasionnelle = filter_input(INPUT_POST, 'occasionnelle', FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);
        $prise = $prise->sauver();
        if ($prise->id_prise) {
            PriseOccasionnelle::supp($prise->id_prise);
            PriseReguliere::supp($prise->id_prise);
        }
        if ($prise_occasionnelle) {
            $priseOcc = new PriseOccasionnelle();
            $priseOcc->id_prise = $prise->id_prise;
            $priseOcc->dose_max = filter_input(INPUT_POST, 'dose_max', FILTER_VALIDATE_FLOAT, $opt);
            $priseOcc->heure_entre_prises = filter_input(INPUT_POST, 'heure_entre_prises', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
            $priseOcc = $priseOcc->sauver();
            if ($priseOcc->id_prise_occasionnelle) {
                $response['message'] = "Enregistrement de la prise Occasionnelle validée!";
            }
            $prise->tabPrise = $priseOcc;
        } elseif ($prise_reguliere) {
            $tabPrises = json_decode(filter_input(INPUT_POST, 'tabPrise', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES));
            $tabPrisesReg = array();
            foreach ($tabPrises as $detailPrise) {
                $priseReg = new PriseReguliere();
                $priseReg->id_prise = $prise->id_prise;
                $priseReg->heure = $detailPrise->heure;
                $priseReg->dose = $detailPrise->dose;
                $priseReg = $priseReg->sauver();
                $tabPrisesReg[] = $priseReg;
            };
            if ($tabPrisesReg) {
                $prise->tabPrise = $tabPrisesReg;
                $response['message'] = "Enregistrement de" . count($tabPrisesReg) . " prise(s) régulière(s) validée(s)!";
            }
        }
        $response['ok'] = true;
        $response['data'] = array($prise);
        echo json_encode($response);
        exit;
    }
} else if ($prise->id_prise = filter_input(INPUT_GET, 'id_prise')) {
    $user->id_user = filter_input(INPUT_POST, 'id_user', FILTER_VALIDATE_INT, $opt);
    $user->jwt = filter_input(INPUT_POST, 'token', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
    if ($user->verifJwt()) {
        //charger prise avec id_prise en GET pour modifications
        $prise->charger();
        $priseOcc = new PriseOccasionnelle();
        $priseOcc->id_prise = $prise->id_prise;
        $priseReg = new PriseReguliere();
        $priseReg->id_prise = $prise->id_prise;
        if ($priseOcc->charger()) {
            $prise->occasionnelle = true;
            $prise->tabPrise = $priseOcc;
        } else {
            $prise->reguliere = true;
            $prise->tabPrise = PriseReguliere::tab("id_prise={$prise->id_prise}");
        }
        $response['data'] = $prise;
        $response['ok'] = true;
        $response['message'] = "Envoie de la prise de id_prise : {$prise->id_prise}";
        echo json_encode($response);
        exit;
    }
}

$response['ok'] = false;
$response['message'] = "Erreur";
echo json_encode($response);
exit;
