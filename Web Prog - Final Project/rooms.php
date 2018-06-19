<?php
include '_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>Rooms</h1>
							<ul id="rooms">
								<li>
									<a href="<?= URL_ROOT ?>/rooms.php"><img src="<?= URL_ROOT ?>/images/first-class.jpg" alt="Img"></a>
									<h2><a href="<?= URL_ROOT ?>/rooms.php">First Class Room</a></h2>
									<p>
										Cras dui sapien, feugiat vitae tristique ut, lobortis tempor orci. Donec pulvinar sagittis metus ut tristique. Pellentes que habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas idios.
									</p>
									<span class="rate">Rate: 220 / Day</span>
								</li>
								<li>
									<a href="<?= URL_ROOT ?>/rooms.php"><img src="<?= URL_ROOT ?>/images/deluxe.jpg" alt="Img"></a>
									<h2><a href="<?= URL_ROOT ?>/rooms.php">Deluxe Room</a></h2>
									<p>
										Sed et augue lorem. In sit amet placerat arcu. Mauris volutpat ipsum ac justo mollis vel vestibulum orci gravida. Vestibulum sit amet porttitor odio. Nulla facilisi. Fusce at pretium felis.
									</p>
									<span class="rate">Rate: 150 / Day</span>
								</li>
								<li>
									<a href="<?= URL_ROOT ?>/rooms.php"><img src="<?= URL_ROOT ?>/images/suite.jpg" alt="Img"></a>
									<h2><a href="<?= URL_ROOT ?>/rooms.php">Suite Room</a></h2>
									<p>
										Sed et augue lorem. In sit amet placerat arcu. Mauris volutpat ipsum ac justo mollis vel vestibulum orci gravida. Vestibulum sit amet porttitor odio. Nulla facilisi. Fusce at pretium felis.
									</p>
									<span class="rate">Rate: 180 / Day</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
