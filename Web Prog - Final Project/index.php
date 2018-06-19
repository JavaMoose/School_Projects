<?php
include '_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<?php

		$dsn = DB_SOURCE;
		$username = DB_USER;
		$password = DB_PASS;

		try {
			$conn = new PDO($dsn, $username, $password);
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}

		$sql = "SELECT * FROM blogposts ORDER BY postdate DESC LIMIT 3";
		$pdoQuery = $conn->prepare($sql);
		$pdoQuery->execute();
?>

			<div id="contents">
				<div id="adbox">
					<img src="<?= URL_ROOT ?>/images/sea-sound.jpg" alt="Img">
					<h1>Enjoy the Summer with Us!</h1>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forum</a>.
					</p>
				</div>
				<div id="main">
					<div class="box">
						<div>
							<div>
								<h3>Latest Blog</h3>
								<ul>
									<?php while ($row = $pdoQuery->fetch(PDO::FETCH_ASSOC)): ?>
									<li>
										<h4><a href="<?= URL_ROOT ?>/news.php"><?php echo $row['title']; ?></a></h4>
										<span><?php echo $row['postdate']; ?></span>
										<p><?php echo $row['postbody']; ?></p>
									</li>
									<?php endwhile; ?>
								</ul>
							</div>
						</div>
					</div>
					<div id="testimonials" class="box">
						<div>
							<div>
								<h3>Testimonials</h3>
								<p>
									“In hac habitasse platea dictumst. Integer purus justo, egestas eu consectetur eu, cursus in tortor. Quisque nec nunc ac mi ultrices iaculis. Aenean quis elit mauris, nec vestibulum lorem.” <span>- <a href="index.php">Juan De La Cruz</a></span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div id="sidebar">
					<div class="section">
						<a href="<?= URL_ROOT ?>/rooms.php"><img src="<?= URL_ROOT ?>/images/rooms.png" alt="Img"></a>
					</div>
					<div class="section">
						<a href="<?= URL_ROOT ?>/dives.php"><img src="<?= URL_ROOT ?>/images/dive-site.png" alt="Img"></a>
					</div>
					<div class="section">
						<a href="<?= URL_ROOT ?>/foods.php"><img src="<?= URL_ROOT ?>/images/food.png" alt="Img"></a>
					</div>
				</div>
			</div>
		</div>

<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
