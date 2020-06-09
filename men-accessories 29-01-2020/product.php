<?php
    

    require_once('resourses/config.php');
    require_once(FRONT_INCLUDES . DS . 'header.php'); 
   
   
    if(!isset($_GET['product'])){
        header("Location: products.php");
    }else{
        $productAlias = $_GET['product'];
        $categoryProduct = displayProduct($productAlias);
        $randPro = randByCategoryProducts($productAlias);
    }

?>
<!--******************Πίσω απο το fixed nav bar********************-->

<div class="fixed-top-bar"></div>


<!--******************BREADCRUMB********************-->

<div class="header-wraper-product">
    <div class="breadcrumbs">
        <div id="breadcrumbs-box">
            <ul class="breadcrumbs-ul">
                <li><a href="index.php">Αρχική σελίδα</a></li>
                <?php  
                    $breadcrumbRow =  breadcrumb($productAlias);
                    $breadcrumbArray = fetch_assoc($breadcrumbRow);
                    echo "<span><i class='fas fa-chevron-right breadcrumbs-arrow'></i></span>";
                    echo "<li><a href='products.php?category=${breadcrumbArray['sub_category_alias']}'> ${breadcrumbArray['sub_category_name']}</a></li>";
                    echo "<span><i class='fas fa-chevron-right breadcrumbs-arrow'></i></span>";
                    echo "<li><a href='#?product=${breadcrumbArray['product_alias']}'>${breadcrumbArray['product_name']}</a></li>";
                ?> 
            </ul>
        </div>
    </div>



<!--*******************************PRODUCT AND DETAILS***********************-->
    <div class="product-container">
        <div class="product-container-row">
            <?php
                include_once('resourses/product-items.php')
            ?>
        </div>
    </div>
     <!--***************************RANDOM BY CATEGORY_ID PRODUCTS******************-->
    <div id="random-products-header"><h2>Μπορεί επίσης να σας αρέσει…</h2></div>
        <div class="random-products-container">
            <div class="random-products-row">
                <?php
                    while($randProArray = fetch_assoc($randPro)) : ?>
                        <div class="random-products-box">
                            <a href="product.php?product=<?=$randProArray['product_alias'];?>">
                                <img id="rand-product-image" src="<?= $randProArray['product_photo_url']; ?>" alt="<?= $randProArray['product_name']; ?>">
                                <p><?= $randProArray['sub_category_name']; ?></p>
                                <h3><?=  $randProArray['product_name']; ?></h3>
                                <p class="rand-product-price"><?=  $randProArray['product_price']; ?>.00&euro;</p>
                            </a>
                        </div>
                <?php endwhile; ?>
           </div>
       </div>

</div>











<div class="white-space white-space-details">
    <div class="white-space-line "></div>
</div>

<?php 
   require_once("resourses/newsletter.php"); 
   include_once(FRONT_INCLUDES . DS . "footer.php"); 
?>