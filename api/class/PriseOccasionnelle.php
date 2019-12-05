<?php

class PriseOccasionnelle implements ORM
{
	public $id_prise_occasionnelle;
	public $id_prise;
	public $dose_max;
	public $heure_entre_prises = null;
	public $date_der_prise = null;

	public function __construct($id_prise_occasionnelle = null, $id_prise = null, $dose_max = null, $heure_entre_prises = null, $date_der_prise = null)
	{
		$this->id_prise_occasionnelle = $id_prise_occasionnelle;
		$this->id_prise = $id_prise;
		$this->dose_max = $dose_max;
		$this->heure_entre_prises = $heure_entre_prises;
		$this->date_der_prise = $date_der_prise;
	}

	function charger()
	{
		// Hydrate $this en se basant sur sa PK.
		if (!$this->id_prise)
			return false;
		$req = "SELECT * FROM prise_occasionnelle WHERE id_prise={$this->id_prise}";
		return DBMySQL::getInstance()->xeq($req)->ins($this);
	}

	function sauver()
	{
		// Persister $this en se basant sur sa PK.
		$db = DBMySQL::getInstance();
		$req = "INSERT INTO prise_occasionnelle VALUES(DEFAULT, {$this->id_prise}, {$this->dose_max}, {$db->esc($this->heure_entre_prises)},null)";
		$db->xeq($req);
		$this->id_prise_occasionnelle = $this->id_prise_occasionnelle ?: $db->pk();
		return $this;
	}

	function supprimer()
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$this->id_prise)
			return false;
		$req = "DELETE FROM prise_occasionnelle WHERE id_prise={$this->id_prise}";
		return DBMySQL::getInstance()->xeq($req)->nb();
	}
	static function supp($id_prise)
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$id_prise)
			return false;
		$req = "DELETE FROM prise_occasionnelle WHERE id_prise={$id_prise}";
		return DBMySQL::getInstance()->xeq($req)->nb();
	}
	static function tab($where = 1, $orderBy = 1, $limit = null)
	{
		// Retourne un tableau d'enregistrements sous la forme d'instances.
		$req = "SELECT * FROM prise_occasionnelle WHERE {$where} ORDER BY {$orderBy}" . ($limit ? " LIMIT {$limit}" : '');
		return DBMySQL::getInstance()->xeq($req)->tab(self::class);
	}
}
