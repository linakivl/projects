<?php while($productInfo = fetch_assoc($categoryProduct)) : ?>
            <div class="product-container-box-image">
                <img src="<?= $productInfo['product_photo_url']; ?>" alt="<?= $productInfo['product_name']; ?>">
            </div>

            <div class="product-container-box">
                <div class="product-container-box-text-details">
                    <h2><?= $productInfo['product_name']; ?></h2>
                    <p><?= $productInfo['product_price']; ?>.00&euro;</p>
                    <p><?= $productInfo['product_description']; ?></p>
                    <a id="add-product-incart" href="<?= $productInfo['product_id']; ?>">Προσθήκη στο καλάθι</a>
                    <a href="" id="add-favor"><p ><i class="far fa-heart heart-beating"></i> Προσθήκη στα αγαπημένα </p></a>
                    <p class="product-details">Κατηγορία: <?= $productInfo['sub_category_name']; ?></p>
                    <p class="product-details">Κωδικός προϊόντος: <?= $productInfo['product_sku']; ?></p>

                    <!--rgb(194, 164, 125)-->
                </div>
            </div>
<?php endwhile; ?>
