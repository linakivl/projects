<?php
session_start();
//print_r($_SESSION);
$host="localhost";
        $username="root";
        $userpass="";
        $database="eshop";
        $con=@mysqli_connect($host,$username,$userpass,$database); //απενεργοποιεί τα warnings & erros του apache
        if(!$con){
            echo "Mysql Connection Error";
            die();
    }
    if(isset($_POST['log_button'])) {
        
        //φιλτράρουμε το email για να βγάλει τους περιττούς χαρακτήρες
        $email = filter_var($_POST['log_email'], FILTER_SANITIZE_EMAIL);
        //αποθηκεύουμε σε ένα session το email για να κρατηθεί στο input
        $_SESSION['log_email'] = $email;
        //μετατροπη του κωδικου σε hash
        $password = hash("SHA512",$_POST['log_password']);

        mysqli_query($con, "set names 'utf8'");
        //αποθηκευση του ερωτήματος
        $query = "SELECT * FROM users WHERE user_email = '$email' AND user_password = '$password'";
       
        $check_database_query = mysqli_query($con, $query);
        $check_login_query = mysqli_num_rows($check_database_query);

        if($check_login_query > 0){
            session_start();
            $arrow_query = mysqli_fetch_array($check_database_query);
            $_SESSION['user_first_name']=  $arrow_query['user_first_name'];
            header("location: index.php");
            die();
        }
        else{
            $error_message =  "Λάθος username & password";       
        }
     }

        mysqli_query($con, "set names 'utf8'");
        //πληροφοριες απο την κατηγορια προιοντων 1/2
        $sql = "SELECT `sub_category_name`, `sub_category_photo` FROM `sub_category` LIMIT 2";    
        $categoryQuery = mysqli_query($con,$sql);
        //πληροφοριες απο την κατηγορια προιοντων 3/4
        $sql2 = "SELECT `sub_category_id`, `sub_category_name`, `sub_category_photo` FROM `sub_category` WHERE `sub_category_id` BETWEEN 3 AND 4";
        $categoryQuery2 = mysqli_query($con, $sql2);
        //dropdown query
        $menusql = "SELECT `sub_category_name` FROM `sub_category`";
        $dropdownMenu = mysqli_query($con, $menusql);
        //random photos ties
        $randomsql = "SELECT `product_photo`, `product_name`, `product_price` FROM `products` WHERE `product_sub_category_id` = 1 ORDER BY RAND() LIMIT 3";
        $randomProducts = mysqli_query($con, $randomsql);
?>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
    <link  href="../css/style.css" rel="stylesheet">
    <link  href="../css/menu.css" rel="stylesheet">
    <link  href="../css/newsletter.css" rel="stylesheet">
    <link  href="../css/sign.css" rel="stylesheet">   
    <link  href="../css/cssAll/all.css" rel="stylesheet">
   
    <script src="../js/jquery-3.3.1.min.js" defer></script>
    <script src="../js/jquery.js" defer></script>
    <script src="../js/app.js" defer></script>   
    </head>
   
<body>

<div class="form-acount form">
    <div class="form-acount-wraper">
            <div class="form-acount-row">
                <div class="col-form-acount">
                    <div class="col-form-acount-buttons">
                        <a href="#" class="col-form-acount-buttons-box color-buttons" id="col-form-logIn">Σύνδεση</a>
                        <div class="col-form-acount-buttons-line"></div>
                        <a href="#"  class="col-form-acount-buttons-box" id="col-form-signIn">Εγγραφή</a>
                    </div>
                    <form action="index.php" method="post">
                        <input type="email" class="input-text" name="log_email" placeholder="Διεύθυνση email χρήστη">
                        <input type="password" class="input-text" name="log_password" placeholder="Κωδικός">
                        <p id="problem-message" class="problem-msg"></p> 
                        <input type="checkbox" name="log_checkbox">
                        <label for="log-checkbox" id="checkbox-text">Να με θυμάσαι</label>
                        <input id="logIn-button" type="submit"  name="log_button" value="Σύνδεση">
                                         
                    </form>
                    <a href="#" id="forget-pass">Ξεχάσατε τον κωδικό σας;</a>
                    <?php
                        if(isset($error_message)){ ?>
                            <script>
                                const problemMessage = document.getElementById("problem-message");
                                document.querySelector(".form").style.display = "block";
                               
                                problemMessage.innerHTML = "Λάθος e-mail ή password";              
                            </script>
                        <?php	}
                        ?>
                   
                </div>
            </div>
     </div>
</div>
    <div id="myNav" class="overlay">
        <a href="javascript:void(0)" class="closebtn">&times;</a>
        <div class="overlay-content">
            <a href="#">Για Εμάς</a>
            <a href="#">Collection</a>
            <a href="#">Blog</a>
            <a href="#">Επικοινωνία</a>
            <div class="overlay-social">
            <a href="https://www.facebook.com" target="_blanc" class="social-links"><i class="fab fa-facebook "></i></a>
            <a href="https://www.instagram.com" target="_blanc" class="social-links"><i class="fab fa-instagram"></i></a>
            <a href="https://www.twitter.com" target="_blanc" class="social-links"><i class="fab fa-twitter"></i></a>
            </div>
        </div>
    </div>
    <section class="header-wraper">
        <header>     
            <div class="header-container">
                <div class="header-container-col header-container-col-nav">
                    <!-- <div class="fas-container"><i class="fas fa-bars fas-container"></i></div> -->
                    <nav>
                        <ul>
                            <li><a id="barsLink"><i class="fas fa-bars bar-ul"></i></a></li>
                            <li class="collection">
                                <a href="http://" target="_blank" rel="noopener noreferrer">Collection</a>
                                <div class="dropdownmenu">
                                    <?php
                                       while($dropdownName = mysqli_fetch_array($dropdownMenu)){ 
                                    ?>
                                    <a href=""><?= $dropdownName['sub_category_name'] ?></a>
                                    <?php  }?>
                                </div>
                           </li>
                        </ul>
                    </nav>
                </div>
                <div class="header-container-col header-container-logo">
                    <div class="header-container-logo-img">
                        <img src="../img/andrews-ties-logo.png" alt="logo">
                    </div>
                </div>
                <div class="header-container-col header-container-icons">
                    <div>
                        <ul>
                        <?php
                        if(!isset($_SESSION['user_first_name'])) { ?>
                            <a href="#" id="btnLog" class="btnLog">Login</a>
                        <?php } else { ?>
                            <a href="logout.php" class="btnLog">Logout</a>
                        <?php } ?>
                            <i class="far fa-heart header-container-icons-buy"></i>
                            <i class="fas fa-shopping-bag header-container-icons-buy"></i>
                        </ul>
                    </div>
                    <div>
                        <?php
                            if(isset($_SESSION['user_first_name'])){?>
                                <p>Καλωσήρθες <?=$_SESSION['user_first_name']?></p>
                               
                            <?php } ?>
                    </div>
                </div>  
            </div>
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
    <section class="categories-wraper">
        <div class="products-categories-container">
            <div class="products-categories-row">
               <div class="products-categories-row-box">
                   <?php
                    while($categoryRow = mysqli_fetch_array($categoryQuery)){                 
                   ?>
                     <div class="products-categories-row-category">   
                        <div class="products-categories-row-box-photo">
                            <img src="<?=$categoryRow['sub_category_photo'];?>" alt="<?=$categoryRow['sub_category_name']?>">
                            <h3><?=$categoryRow['sub_category_name'];?></h3>
                        </div>
                        <div class="products-categories-row-box-text">
                          
                        </div>
                    </div>   
                    <?php }?>
               </div>
               <div class="products-categories-row-box">
                    <?php
                        while($categoryRow2 = mysqli_fetch_array($categoryQuery2)){                 
                    ?>
                    <div class="products-categories-row-category">   
                        <div class="products-categories-row-box-photo">
                            <img src="<?=$categoryRow2['sub_category_photo'];?>" alt="<?=$categoryRow['sub_category_name']?>">
                            <h3><?=$categoryRow2['sub_category_name'];?></h3>
                        </div>
                        <div class="products-categories-row-box-text">
                            
                        </div>
                    </div>   
                    <?php }?>    
               </div>
            </div>
        </div>
    </section>
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
    <section class="random-section-products">
        <div class="random-container-products">
            <div class="random-row-products">
                <h2>Νέες Αφίξεις</h2>
                <h4>Ανανεώστε το look σας, εμπνευστείτε από τα νέα προϊόντα μας!</h4>
                <div class="random-row-products-photos">
                     <?php
                        while($randomArray = mysqli_fetch_array($randomProducts)){
                     ?>       
                    <div class="random-row-products-photo">
                        <img src="<?=$randomArray['product_photo'];?>" alt="<?=$randomArray['product_name'];?>">
                   
                        <h3><?=$randomArray['product_name'];?></h3>
                        <p><?=$randomArray['product_price'];?>.00&euro;</p>
                    </div>
                    <?php }?>
                </div>
            </div>
        </div>
    </section>
    <section class="quote-banner">
        <div class="quote-container">
            <div class="quote-row-section">
                <h2>"Μια καλοδεμένη γραβάτα είναι το πρώτο
                    σημαντικό βήμα στη ζωή ενός άνδρα." 
                </h2>
                <h3>Όσκαρ Ουάιλντ</h3>
                <div class="quote-row-section-img">
                    <img src="../img/home/tie-icon.png" alt="tie icon">
                </div>
            </div>
        </div>                    
    </section>
    <section class="white-space">
        <div class="white-space-line"></div>
        <div></div>                    
    </section>    
    <section class="white-space">
        <div></div>
        <div></div>                    
    </section>       
    <section class="newsletter-section">
        <div class="newsletter-container">
            <div class="newsletter-row">
                <div class="newsletter-row-box">
                    <div class="newsletter-row-box-header">
                        <h2>Εγγραφείτε στο Newsletter μας</h2>
                        <h4>Για να ενημερώνεστε πρώτοι για τις πιο πρόσφατες αφίξεις, καμπάνιες και προσφορές μας!</h4>
                    </div>
                    <form class="newsletter-form" action="index.php" method="post">
                        <p id="newsletter-sign">
                        <input type="email" id="newsletterEmail" name="newsletter" placeholder="Το email σας">
                        <a href="#" id="newsletter-button">Εγγραφή</a>
                        </p>
                        <p id="newsletter-check">
                            <input type="checkbox" name="checkbox" id="newsletter-checkbox">
                            <label for="checkbox">Αποδέχομαι την <a href="#">Πολιτική Απορρήτου</a></label>
                        </p>
                    </form>
                </div>
            </div>
        </div>                    
    </section>   
    <section class="white-space">
        <div></div>
        <div></div>                    
    </section>      
    <section class="white-space">
        <div></div>
        <div></div>                    
    </section>  
    <section class="white-space">
        <div></div>
        <div></div>                    
    </section>   
    <section class="white-space">
        <div></div>
        <div></div>                    
    </section>       
    <footer>
       <div class="container-footer">
           <div class="container-row">
               <div class="container-row-column-aboutus">
                   <ul class="footer-list">
                       <li><a href="#">Για Εμάς</a></li>
                       <li><a href="#">Collection</a></li>
                       <li><a href="#">Blog</a></li>
                       <li><a href="#">Επικοινωνία</a></li>
                   </ul>
               </div>
               <div class="container-row-column-copyright">
                  <p>Created by Vlasiadou | All Rights Reserved</p>          
               </div>
           </div>
       </div>
    </footer>                
</body>
</html>