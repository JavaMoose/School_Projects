<?php
include '_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>Food</h1>
							<ul id="foods">
								<li>
									<h2><a href="<?= URL_ROOT ?>/foods.php">SeaFood Special</a></h2>
									<div class="infos">
										<a href="<?= URL_ROOT ?>/foods.php"><img src="<?= URL_ROOT ?>/images/seafoods.jpg" alt="Img" height="169" width="780"><span class="cover"></span></a>
										<p>
											<span>Fried Salmon Special</span> I'm a product overview. Here you can write more information about your product. Buyers like to know ...
										</p>
									</div>
								</li>
								<li>
									<h2><a href="<?= URL_ROOT ?>/foods.php">Sumptuous Desserts</a></h2>
									<div class="infos">
										<a href="<?= URL_ROOT ?>/foods.php"><img src="<?= URL_ROOT ?>/images/desserts.jpg" alt="Img" height="169" width="780"><span class="cover"></span></a>
										<p>
											<span>Choco Ice Cream Sandwich</span> I'm a product overview. Here you can write more information about your product. Buyers like to know ...
										</p>
									</div>
								</li>
								<li>
									<h2><a href="<?= URL_ROOT ?>/foods.php">Buffet</a></h2>
									<div class="infos">
										<a href="<?= URL_ROOT ?>/foods.php"><img src="<?= URL_ROOT ?>/images/buffet.jpg" alt="Img" height="169" width="780"><span class="cover"></span></a>
										<p>
											<span>Mixed Buffet</span> I'm a product overview. Here you can write more information about your product. Buyers like to know ...
										</p>
									</div>
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
