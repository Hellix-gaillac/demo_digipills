<?php

class Prise implements ORM
{
	public $id_user;
	public $id_prise;
	public $code_cis;
	public $denomination;
	public $notice;
	public $unite_dosage;
	public $trie;
	public $date_fin = null;
	public $tabPrise = [];


	public function __construct($id_prise = null, $id_user = null, $code_cis = null, $denomination = null, $notice = null, $unite_dosage = null, $trie = null, $date_fin = null)
	{
		$this->id_prise = $id_prise;
		$this->id_user = $id_user;
		$this->code_cis = $code_cis;
		$this->denomination = $denomination;
		$this->notice = $notice;
		$this->unite_dosage = $unite_dosage;
		$this->trie = $trie;
		$this->date_fin = $date_fin;
	}

	function charger()
	{
		// Hydrate $this en se basant sur sa PK.
		if (!$this->id_prise)
			return false;
		$req = "SELECT * FROM prise WHERE id_prise={$this->id_prise}";
		return DBMySQL::getInstance()->xeq($req)->ins($this);
		//doit charger les prise occanionnelle et reguliere
	}

	function sauver()
	{
		// Persister $this en se basant sur sa PK.
		$db = DBMySQL::getInstance();
		$id_prise = $this->id_prise ?: 'DEFAULT';
		$req = "INSERT INTO prise VALUES({$id_prise}, {$this->id_user}, {$this->code_cis}, {$db->esc($this->denomination)}, {$db->esc($this->notice)}, {$db->esc($this->unite_dosage)}, null) ON DUPLICATE KEY UPDATE id_user={$this->id_user}, code_cis={$this->code_cis}, denomination={$db->esc($this->denomination)}, notice={$db->esc($this->notice)}, unite_dosage={$db->esc($this->unite_dosage)}, date_fin=null";
		$db->xeq($req);
		$this->id_prise = $this->id_prise ?: $db->pk();
		return $this;
	}
	function sauvertest()
	{
		// Persister $this en se basant sur sa PK.
		$db = DBMySQL::getInstance();
		$id_prise = $this->id_prise ?: 'DEFAULT';
		$req = "INSERT INTO prise VALUES({$id_prise}, {$this->id_user}, {$this->code_cis}, {$db->esc($this->denomination)}, {$db->esc($this->notice)}, {$db->esc($this->unite_dosage)}, null)";
		$db->xeq($req);
		$this->id_prise = $this->id_prise ?: $db->pk();
		return $this;
	}

	function supprimer()
	{
		// Supprimer l'enregistrement correspondant à $this.
		if (!$this->id_prise)
			return false;
		$req = "DELETE FROM prise WHERE id_prise={$this->id_prise}";
		return (bool) DBMySQL::getInstance()->xeq($req)->nb();
	}

	static function tab($where = 1, $orderBy = 1, $limit = null)
	{
		// Retourne un tableau d'enregistrements sous la forme d'instances.
		$req = "SELECT * FROM prise WHERE {$where} ORDER BY {$orderBy}" . ($limit ? " LIMIT {$limit}" : '');
		return DBMySQL::getInstance()->xeq($req)->tab(self::class);
	}

	// public function get_categorie()
	// {
	// 	if (!$this->categorie && $this->id_categorie) {
	// 		$this->categorie = new Categorie($this->id_categorie);
	// 		$this->categorie->charger();
	// 	}
	// 	return $this->categorie;
	// }

	// public function refExiste()
	// {
	// 	$db = DBMySQL::getInstance();
	// 	$id_produit = $this->id_produit ?: 0;
	// 	return (bool) self::tab("ref={$db->esc($this->ref)} AND id_produit!={$id_produit}")[0];
	// }

	// public function __get($nom)
	// {
	// 	$methode = "get_{$nom}";
	// 	return $this->$methode();
	// }

	//retourne un tableau pour lister les prises de l'user,
	static function toutes($id_user)
	{
		$prises =  self::tab("id_user={$id_user}");
		foreach ($prises as $prise) {
			if ($tabData = PriseOccasionnelle::tab("id_prise={$prise->id_prise}")) {
				$prise->trie = 1;
				foreach ($tabData as $data) {
					$prise->tabPrise[] = $data;
				}
			} else if ($tabData = PriseReguliere::tab("id_prise={$prise->id_prise}", "heure")) {
				$prise->trie = 0;
				foreach ($tabData as $data) {
					$prise->tabPrise[] = $data;
				}
			}
		}
		// fonction trie priseOcc et priseReg
		usort($prises, function ($a, $b) {
			return strcmp($a->trie, $b->trie);
		});
		return $prises;
	}
}
