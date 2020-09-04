<?php

namespace application;
use \Exception;

/**
 * Class User
 * @package application
 */
class User {

	/**
	 * @var int $delay
	 */
	public $delay = 5 * 60;

	/**
	 * @param string $login
	 * @param string $pass
	 * 
	 * @return bool
	 */
	public function is_user( $login, $pass ) {

		$data = $this->get_user_data();

		if ( !$data ) return false;

		foreach ( $data as $value ) {
			if ( $value['login'] == $login && $value['password'] == $pass ) {
				return true;
			}
		}
	}

	/**
	 * Setting up a session on successful authorization
	 * @throws object \Exception
	 * @return bool true
	 */
	public function sign_on( $credentials ) {
		if ( !$this->is_user( $credentials['login'], $credentials['password'] ) ) {
			if ( !isset( $_SESSION['counter'] ) ) {
				$_SESSION['counter'] = 1;
			} else {
				$_SESSION['counter']++;
			}

			if ( $_SESSION['counter'] == 3 ) {
				$_SESSION['failed_attempt'] = time();
			}

			throw new Exception('Неверные данные');
		} else {
			$_SESSION['user_name'] = $_POST['user'];
		}
		return true;
	}

	/**
	 * @return void
	 */
	public function log_out() {
		unset( $_SESSION['counter'] );
		unset( $_SESSION['user_name'] );
		session_destroy();
	}

	/**
	 * @return array | NULL
	 */
	private function get_user_data() {

		$file = ROOT_DIR . '/storage/data.txt';

		if ( file_exists( $file ) && is_readable( $file ) ) {
			$lines = file( $file );
			$data = [];

			if ( $lines ) {
				foreach ( $lines as $line ) {
					$pos = strpos( $line, ':' );
					$login = trim( substr( $line, 0, $pos ) );
					$password = trim( substr( $line, $pos + 1 ) );
					$data[] = [
						'login' => $login,
						'password' => $password			
					];
				}
			}

			return $data;
		}
		return NULL;
	}
}