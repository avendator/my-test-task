<?php
session_start();

define( 'ROOT_DIR', getcwd() );

require_once( ROOT_DIR . '/application/User.php' );

require_once( ROOT_DIR . '/public/login-form.php' );