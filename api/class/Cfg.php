<?php

Cfg::init();

class Cfg
{

	private static $initDone = false;

	const DB_NAME = 'digipills';
	const DB_LOG = 'root';
	const DB_MDP = '';

	// Session
	const SESSION_TIMEOUT = 3600; // s

	private function __construct()
	{
		// Classe 100% statique.
	}

	public static function init()
	{
		if (self::$initDone)
			return false;
		// Autoload
		spl_autoload_register(function ($class) {
			@include "./class/{$class}.php";
			@include "./framework/{$class}.php";
		});

		// DSN DB
		DBMySQL::setDSN(self::DB_NAME, self::DB_LOG, self::DB_MDP);
		// , self::DB_HOST);
		// Session
		Session::getInstance(self::SESSION_TIMEOUT);
		// Init Done
		return self::$initDone = true;
	}
}
