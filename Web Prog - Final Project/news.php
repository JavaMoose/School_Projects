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

		$sql = "SELECT * FROM blogposts ORDER BY postdate DESC";
		$pdoQuery = $conn->prepare($sql);
		$pdoQuery->execute();
?>

<?php
 	  if (isset ($_COOKIE["postblogError"])) {
 	    echo ($_COOKIE["postblogError"]);
 	    setcookie("postblogError", "", time()-3600, "/");
 	  }
?>

			<div id="contents">
				<div class="box">
					<div>
						<div id="news" class="body">
							<div class="sidebar">
								<h3>Latest News</h3>
								<ul>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">2023 Bikini Contest Winners</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Top 10 Diving Spots</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Fishing ban to be implemented this year</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Lifeguard saves child from drowning</a>
									</li>
								</ul>
								<h3>Vaction Tips</h3>
								<ul>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">What to bring on the beach?</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Planning Fun Activities</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Diving Checklist</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">First Aid</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">How to Build a Sand Castle?</a>
									</li>
									<li>
										<a href="<?= URL_ROOT ?>/news.php">Tanning Tips</a>
									</li>
								</ul>
							</div>
							<div>
								<?php
									if (isset($_COOKIE['userID'])) {
										echo ('<a href="' . URL_ROOT . '/blog/newblogpost.php">New Post</a>');
									}
									else {
										echo ('<a href="' . URL_ROOT . '/login/index.php">Login to create Post</a>');
									}
								?><br>
								<h1>News</h1>
								<?php while ($row = $pdoQuery->fetch(PDO::FETCH_ASSOC)): ?>
								<div>
									<img src="<?= URL_ROOT ?>/blog/uploads/<?php echo $row['postimage']; ?>" />
									<h2><?php echo $row['title']; ?><h2>
									<span><?php echo $row['postdate']; ?></span>
									<p><?php echo $row['postbody']; ?></p>
								</div>
								<?php endwhile; ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
