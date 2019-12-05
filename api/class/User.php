<?php
class User extends AbstractUser
{
	public function __construct($id_user = null, $log = null, $mdp = null, $jwt = null, $nom = null, $prenom = null, $email = null)
	{
		$this->id_user = $id_user;
		$this->log = $log;
		$this->mdp = $mdp;
		$this->jwt = $jwt;
		$this->nom = $nom;
		$this->prenom = $prenom;
		$this->email = $email;
	}

	//charger dans abstractUser
	public function sauver()
	{
		// Persister $this en se basant sur sa PK.
		$db = DBMySQL::getInstance();
		$id_user = $this->id_user ?: 'DEFAULT';
		$req = "INSERT INTO user VALUES(DEFAULT, {$db->esc($this->log)}, {$db->esc($this->mdp)}, {$db->esc($this->jwt)}, {$db->esc($this->nom)}, {$db->esc($this->prenom)}, {$db->esc($this->email)}) ON DUPLICATE KEY UPDATE log={$db->esc($this->log)}, mdp={$db->esc($this->mdp)}, jwt={$db->esc($this->jwt)}, nom={$db->esc($this->nom)}, prenom={$db->esc($this->prenom)}, email= {$db->esc($this->email)}";
		$db->xeq($req);
		$this->id_user = $this->id_user ?: $db->pk();
		return $this;
		//voir pour code hash(mdp)
	}
	function supprimer()
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$this->id_user)
			return false;
		$req = "DELETE FROM user WHERE id_user={$this->id_user}";
		return (bool) DBMySQL::getInstance()->xeq($req)->nb();
	}
	public function chargerJwt()
	{
		// Hydrate $this en se basant sur le Jwt.
		$db = DBMySQL::getInstance();
		if (!$this->jwt)
			return false;
		$req = "SELECT * FROM user WHERE jwt={$db->esc($this->jwt)}";
		return DBMySQL::getInstance()->xeq($req)->ins($this);
	}
	public function verifJwt()
	{
		// Hydrate $this en se basant sur le Jwt.
		$db = DBMySQL::getInstance();
		if (!$this->jwt && $this->id_user)
			return false;
		$req = "SELECT * FROM user WHERE jwt={$db->esc($this->jwt)} HAVING id_user={$this->id_user}";
		return (bool) DBMySQL::getInstance()->xeq($req)->nb();
	}
	public function supprimerJwt()
	{
		// Supprimer l'enregistrement correspondant à $this à partir du jwt.
		// Retourne le nb d'enregistrement supprimer
		$db = DBMySQL::getInstance();
		if (!$this->jwt)
			return false;
		$req = "DELETE FROM user WHERE jwt={$db->esc($this->jwt)}";
		return (bool) DBMySQL::getInstance()->xeq($req)->nb();
	}
	public function loginJwt()
	{
		// Suppose les propriétés log et mdp renseignées.
		// Retourne true ou false selon que le user a été logué (et hydraté) ou pas.
		if (!($this->log && $this->mdp))
			return false;
		$db = DBMySQL::getInstance();
		$req = "SELECT * FROM user WHERE log={$db->esc($this->log)}";
		if (!$obj = $db->xeq($req)->prem())
			return false;
		if (!password_verify($this->mdp, $obj->mdp))
			return false;
		$this->id_user = $obj->id_user;
		$this->charger();
		return $this;
	}
	public static function tab($where = 1, $orderBy = 1, $limit = null)
	{
		// Retourne un tableau d'enregistrements sous la forme d'instances.
		$req = "SELECT * FROM user WHERE {$where} ORDER BY {$orderBy}" . ($limit ? " LIMIT {$limit}" : '');
		return DBMySQL::getInstance()->xeq($req)->tab(self::class);
	}
	//charger les prises de this.user
	public function toutesPrises()
	{
		$tabPrise = Prise::toutes($this->id_user);
		return $tabPrise;
	}
	public static function userExist($log, $email)
	{
		// Retourne un tableau d'enregistrements sous la forme d'instances.
		$db = DBMySQL::getInstance();
		$req = "SELECT * FROM user WHERE (log={$db->esc($log)} OR email={$db->esc($email)})";
		return (bool) DBMySQL::getInstance()->xeq($req)->nb();
	}
}
