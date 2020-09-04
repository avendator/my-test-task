<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link href="public/style.css" rel="stylesheet">
</head>
<body>
	<div class="notice">
	<?php
	use application\User;

	$user = new User();

	try {
		if ( isset( $_SESSION['failed_attempt'] ) && ( $_SESSION['failed_attempt'] + $user->delay ) > time() ) {

			$delta = ( $_SESSION['failed_attempt'] + $user->delay ) - time();

			throw new Exception('Попробуйте еще раз через ' .$delta. ' секунд');
		} elseif ( isset( $_SESSION['failed_attempt'] ) && ( $_SESSION['counter'] >= 3 ) ) {
			unset( $_SESSION['counter'] );
			unset( $_SESSION['failed_attempt'] );
		} 
	} 
	catch ( Exception $e ) {
		echo '<p>' . $e->getMessage() . '</p>';
		return;
	}

	if ( isset($_POST['log_in']) ) {

		$credentials = [
			'login'    => $_POST['user'],
			'password' => $_POST['password']
		];

		try {
			if ( $user->sign_on( $credentials ) ) {
				require_once( ROOT_DIR . '/public/user-page.php' );
				return;
			}
		}
		catch ( Exception $e ) {
			echo '<p>' . $e->getMessage() . '</p>';
		}
	}

	if ( isset( $_POST['get_out'] ) ) {

		$user->log_out();
	}

	$user = isset( $_POST['user'] ) ? $_POST['user'] : '';
	$password = isset( $_POST['password'] ) ? $_POST['password'] : '';
	?>
	</div>
	<div class="wrap">
		<form method="post">
			<div>Вход на страницу пользователя</div>
			<div>
				<label>Имя пользователя: *</label>
				<input type="text" name="user" value="<?php echo $user; ?>" required>
			</div>
			<div>
				<label>Пароль: *</label>
				<input type="password" name="password" value="<?php echo $password; ?>" required>
			</div>
			<div>
				<button type="submit" name="log_in">Вход</button>
			</div>
		</form>
	</div>
</body>
</html>