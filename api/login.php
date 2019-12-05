<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type:application/json');
require_once './class/Cfg.php';
// Misc::crypter('user', 'id_user', 'mdp');

$tabErreur = [];
$user = new User();

if (filter_input(INPUT_POST, 'submit')) {
	$user->log = filter_input(INPUT_POST, 'log', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
	$user->mdp = filter_input(INPUT_POST, 'mdp', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
	if (!$user->log)
		$tabErreur[] = "Identifiant absent.";
	if (!$user->mdp)
		$tabErreur[] = "Mot de passe absent.";
	if (filter_input(INPUT_POST, 'login')) {
		// suivant la sécurité voulue, faire dans loginJwt un nouveau token(avec date) à chaque log,puis vérifier pour chaque requetes(si périmer alors refaire un jwt sans mdp)
		if (!$tabErreur && $user->loginJwt()) {
			$response['ok'] = true;
			$response['user'] = array(
				'login' => true,
				'idUser' => $user->id_user,
				'nom' => $user->nom,
				'prenom' => $user->prenom,
				'token' => $user->jwt
			);
			$response['connection'] = true;
			echo json_encode($response);
			exit;
		}
	} else if (filter_input(INPUT_POST, 'register')) {
		$user->mdp = password_hash($user->mdp, PASSWORD_DEFAULT);
		$user->nom = filter_input(INPUT_POST, 'nom', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
		$user->prenom = filter_input(INPUT_POST, 'prenom', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
		$user->email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
		if (!$user->nom)
			$tabErreur[] = "nom absent.";
		if (!$user->prenom)
			$tabErreur[] = "prenom absent.";
		if (!$user->email)
			$tabErreur[] = "email absent.";
		// verif si email ou log existant
		if (User::userExist("{$user->log}", "{$user->email}"))
			$tabErreur[] = "log ou email existant.";
		if (!$tabErreur) {
			// generate jwt
			$user->name = $user->prenom . " " . $user->nom;
			$jwt = new Jwt($user->name);
			$user->jwt = $jwt->token;

			//enregistrer compte
			if ($user = $user->sauver()) {
				$response['ok'] = true;
				$response['compte'] = "Compte créé";
				$response['user'] = array(
					'login' => true,
					'idUser' => $user->id_user,
					'nom' => $user->nom,
					'prenom' => $user->prenom,
					'token' => $user->jwt
				);
				$response['connection'] = true;
				echo json_encode($response);
				exit;
			}
		}
	}
}
$response['ok'] = false;
$response['error'] = $tabErreur;
echo json_encode($response);
exit;
