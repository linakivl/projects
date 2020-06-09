<?php
  require_once('resourses/config.php');
  include_once(FRONT_INCLUDES . DS . 'header.php');
 
?>

<!--************************************************ HERO IMAGE ************************************************-->
    <section class="header-wraper">
        <header>     
            <div class="header-container-heading">
                <div class="header-container-heading-row">
                    <div class="header-container-paragraph">
                   
                        <p>Υψηλη ποιοτητα</p>
                        <h1>Premium Men’s Accessories</h1>
                        <div class="header-container-paragraph-explore">
                            <a href="#collection-section">Εξερευνήστε την συλλογή<span></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </section>

    <section class="white-space">
        <div class="white-space-line"></div>
        <div></div>                    
    </section>
<!--************************************************ CATEGORIES ************************************************-->
    <section class="categories-wraper">
        <div class="categories-container" id="collection-section">
            <div class="categories-row-header">
                <div class="categories-row-header">
                    <h4>ΑΝΑΚΑΛΥΨΤΕ</h4>
                </div>
                <div class="categories-row-header-space"></div>
                <div class="categories-row-header-products">
                    <h2>Κατηγορίες Προϊόντων</h2>
                </div>
                <div class="categories-row-header-space"></div>
            </div>
        </div>
    </section>

    <?php  require_once("resourses/categories.php"); ?> 

<!--************************************************ BANNER ************************************************-->
    <section class="category-banner">
        <div class="category-banner-container">
            <div class="category-banner-row-box">
               <div class="category-banner-row-text">
                   <h3>VENICE COLLECTION</h3>
                   <h2>Αναδείξτε την καλύτερη εικόνα σας</h2>
                   <div class="category-banner-btn">
                       <a id="btn-translate" href="#">Εξερευνήστε την συλλογή<span></span></a>
                    </div>
               </div>             
            </div>
        </div>                   
    </section>
    <section class="white-space">
        <div class="white-space-line"></div>
        <div></div>                    
    </section>
<!--************************************************ NEW ENTRIES ************************************************-->
    <section class="random-section-products">
        <div class="random-container-products">
            <div class="random-row-products">
                <h2>Νέες Αφίξεις</h2>
                <h4>Ανανεώστε το look σας, εμπνευστείτε από τα νέα προϊόντα μας!</h4>
                <div class="random-row-products-photos">
                    <?php  newEntries() ?> 
                </div>
            </div>
        </div>
    </section>
<!--************************************************ BANNER QUOTE ************************************************/-->
    <section class="quote-banner">
        <div class="quote-container">
            <div class="quote-row-section">
                <h2>"Μια καλοδεμένη γραβάτα είναι το πρώτο
                    σημαντικό βήμα στη ζωή ενός άνδρα." 
                </h2>
                <h3>Όσκαρ Ουάιλντ</h3>
                <div class="quote-row-section-img">
                    <img src="img/home/tie-icon.png" alt="tie icon">
                </div>
            </div>
        </div>                    
    </section>

    <section class="white-space">
        <div class="white-space-line"></div>
        <div></div>                    
    </section>    
<!--************************************************ NEWSLETTER SECTION ************************************************/-->    
    <?php require_once("resourses/newsletter.php"); ?>
    <?php require_once(FRONT_INCLUDES . DS . "footer.php"); ?>
</body>
</html>