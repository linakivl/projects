<?php 
  
  require_once('resourses/config.php');
  include_once(FRONT_INCLUDES . DS . 'header.php'); 
  
  // echo $_SESSION['user_first_name'];
      if($_GET['category']){
        $linkId = $_GET['category'];
        
        $products = getProducts($linkId);
      }else{
        header('Location: index.php');
      }
      $uri = $_SERVER['REQUEST_URI'];
      redirectFunction($uri);
?>  
<!--******************Πίσω απο το fixed nav bar********************-->
    <div class="fixed-top-bar"></div>
<!--*****************Nav links*************************-->    
    <div class="header-wraper-products">
        <div class="white-space white-space-details">
            <div class="white-space-line "></div>
                          
        </div>
        <?php
            $infoCatQuery = getAllCategoriesInfo($linkId);
            $categoryRowInfo =  mysqli_fetch_array($infoCatQuery);
            echo "<h2 class='header-category-name'>${categoryRowInfo['sub_category_name']}</h2>";
        ?>
         <ul class="list-nav-links">
              <?php getCategories() ?>
        </ul>
    </div>
<!--****************************PRODUCTS**************************-->


  <?php 
  include_once("resourses/products-items.php");?>
  
   <div class="white-space white-space-details">
          <div class="white-space-line "></div>
                       
    </div>
  
  
 
   <?php 
   require_once("resourses/newsletter.php"); 
   include_once(FRONT_INCLUDES . DS . "footer.php"); ?>