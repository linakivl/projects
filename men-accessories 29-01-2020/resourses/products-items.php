<div class="container-products">
    <div class="container-products-row">
        <?php while($row = fetch_assoc($products)) :?>
            <div class="container-products-box">
                <a href="product.php?product=<?=$row['product_alias']?>">
                    <img src="<?= $row['product_photo_url']?>" alt="<?= $row['product_name']?>">
                <div class="container-products-text">
                    <h3><?= $row['product_name']?></h3>
                    <p><?= $row['product_price']?>.00&euro;</p>
                    </a>
                    <a id="add-cart-product" href="product.php?id=<?= $row['product_id']?>"> Προσθήκη στο καλάθι </a>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</div>
