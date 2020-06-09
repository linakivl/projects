<?php
	 require_once('resourses/config.php');
	 
	$key = $_GET["key"];
	$query = "SELECT * FROM products WHERE product_name like '%".$key."%' LIMIT 5";
	$result = query($query);

	while ($record = mysqli_fetch_assoc($result)) { ?>
	
	<a href="product.php?product=<?= $record['product_alias']?>">
		<li>
			<img src="<?=$record["product_photo_url"]?>"/>
			<div class="title"><?=preg_replace("/($key)/i","<b>\$1</b>",$record["product_name"])?></div>
		</li>
	</a>
		
	<?php } ?>