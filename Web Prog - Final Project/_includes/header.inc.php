<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Bhaccasyoniztas Beach Resort Website Template</title>
	<link rel="stylesheet" href="<?= URL_ROOT ?>/css/style.css" type="text/css">
</head>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="<?= URL_ROOT ?>/index.php"><img src="<?= URL_ROOT ?>/images/logo.png" alt="LOGO" height="112" width="118"></a>
				</div>
				<div id="navigation">
					<ul>
						<li>
							<?php
								if (isset($_COOKIE['userID'])) {
									echo ('<a href="' . URL_ROOT . '/admin.php">Admin</a>');
								}
								else {
									echo ('<a href="' . URL_ROOT . '/login/index.php">Admin</a>');
								}
							?>
						</li>
						<li class="selected">
							<a href="<?= URL_ROOT ?>/index.php">Home</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/about.php">About</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/rooms.php">Rooms</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/dives.php">Dive Site</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/foods.php">Food</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/news.php">News</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/contact/contact.php">Contact</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/login/index.php">Login</a>
						</li>
						<li>
							<a href="<?= URL_ROOT ?>/register/index.php">Register</a>
						</li>
					</ul>
				</div>
			</div>
