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

		$sql = "SELECT * FROM contacts ORDER BY ID";
		$pdoQuery = $conn->prepare($sql);
		$pdoQuery->execute();
?>

<div id="contents">
  <div class="box">
    <div>
      <div class="body">
        <table>
		        <tr>
			           <th>ID</th>
			           <th>Name</th>
			           <th>Email</th>
			           <th>Phone</th>
                 <th>Message</th>
		        </tr>
		        <?php while ($row = $pdoQuery->fetch(PDO::FETCH_ASSOC)): ?>
			      <tr>
						        <td><?php echo $row['id']; ?></td>
						        <td><?php echo $row['name']; ?></td>
						        <td><?php echo $row['email']; ?></td>
						        <td><?php echo $row['phone']; ?></td>
                    <td><?php echo $row['message']; ?></td>
    	      </tr>
		        <?php endwhile; ?>
	         </table>
         </div>
       </div>
     </div>
   </div>
   
<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
