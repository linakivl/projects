<?php
    $sql = "SELECT `id`, `sub_category_name`,`sub_category_alias`, `sub_category_photo` FROM `sub_category`"; 
    $twoRows = query($sql);
?>

<section class="categories-wraper">
    <div class="products-categories-container">
        <div class="products-categories-row">
            <div class="products-categories-row-box">
                <?php  while($categoryRow = fetch_assoc($twoRows)): ?>

                    <div class="products-categories-row-category">   
                        <div class="products-categories-row-box-photo">

                            <a href="products.php?category=<?=$categoryRow['sub_category_alias']; ?>"><img src="<?= $categoryRow['sub_category_photo']; ?>" alt="<?= $categoryRow['sub_category_name']; ?>">
                            <h3><?= $categoryRow['sub_category_name']; ?></h3></a>
                            
                        </div>
                    </div>  

                <?php endwhile; ?>
            </div>    
       </div>
    </div>
</section>