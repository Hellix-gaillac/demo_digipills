<?php

class PriseReguliere implements ORM
{
	public $id_prise_reguliere;
	public $id_prise;
	public $heure;
	public $dose;
	public $validation_prise = false;


	public function __construct($id_prise_reguliere = null, $id_prise = null, $heure = null, $dose = null, $validation_prise = null)
	{
		$this->id_prise_reguliere = $id_prise_reguliere;
		$this->id_prise = $id_prise;
		$this->heure = $heure;
		$this->dose = $dose;
		$this->validation_prise = $validation_prise;
	}

	function charger()
	{
		// Hydrate $this en se basant sur sa PK.
		if (!$this->id_prise)
			return false;
		$req = "SELECT * FROM prise_reguliere WHERE id_prise={$this->id_prise}";
		return DBMySQL::getInstance()->xeq($req)->ins($this);
	}

	function sauver()
	{
		// Persister $this en se basant sur sa PK.
		$db = DBMySQL::getInstance();
		$req = "INSERT INTO prise_reguliere VALUES(DEFAULT,{$this->id_prise}, {$db->esc($this->heure)}, {$this->dose}, null) ";
		$db->xeq($req);
		$this->id_prise_reguliere = $this->id_prise_reguliere ?: $db->pk();
		return $this;
	}

	function supprimer()
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$this->id_prise)
			return false;
		$req = "DELETE FROM prise_reguliere WHERE id_prise={$this->id_prise}";
		return DBMySQL::getInstance()->xeq($req)->nb();
	}
	static function supp($id_prise)
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$id_prise)
			return false;
		$req = "DELETE FROM prise_reguliere WHERE id_prise={$id_prise}";
		return DBMySQL::getInstance()->xeq($req)->nb();
	}

	static function tab($where = 1, $orderBy = 1, $limit = null)
	{
		// Retourne un tableau d'enregistrements sous la forme d'instances.
		$req = "SELECT id_prise_reguliere,id_prise,DATE_FORMAT(heure,'%H:%i') heure,dose,validation_prise FROM prise_reguliere WHERE {$where} ORDER BY {$orderBy}" . ($limit ? " LIMIT {$limit}" : '');
		return DBMySQL::getInstance()->xeq($req)->tab(self::class);
	}

	public function get_categorie()
	{
		if (!$this->categorie && $this->id_categorie) {
			$this->categorie = new Categorie($this->id_categorie);
			$this->categorie->charger();
		}
		return $this->categorie;
	}

	public function refExiste()
	{
		$db = DBMySQL::getInstance();
		$id_produit = $this->id_produit ?: 0;
		return (bool) self::tab("ref={$db->esc($this->ref)} AND id_produit!={$id_produit}")[0];
	}

	public function __get($nom)
	{
		$methode = "get_{$nom}";
		return $this->$methode();
	}
}
