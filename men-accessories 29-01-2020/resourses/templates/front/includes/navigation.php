<?php
    

    if(isset($_POST['log_button']))
    {
        $email = $_POST['signInEmail'];
        $username = $_POST['signInPass'];
        $hello =  signIn($email,$username);
        if($hello){
            session_start();
            $usersInfo = mysqli_fetch_array($hello);
            $_SESSION['user_first_name']=  $usersInfo['user_first_name'];
            $_SESSION['user_id']=  $usersInfo['user_id'];
            
             header("location: " . $_SERVER['PHP_SELF']);
             
        }else{
            $error_message = "Λάθος e-mail ή password";
        }
    }

    $sql = "SELECT `sub_category_alias`, sub_category_name, id FROM sub_category" ;
    $result = query($sql);

?>
<div class="form-acount form">
    <div class="form-acount-wraper">
            <div class="form-acount-row">
                <div class="col-form-acount">
                    <div class="col-form-acount-buttons">
                        <a href="#" class="col-form-acount-buttons-box color-buttons" id="col-form-logIn">Σύνδεση</a>
                        <div class="col-form-acount-buttons-line"></div>
                    
                    </div>
                  
                    <form   method="post" onsubmit="return checkform(this)" id="signInForm">
                        <div class="email-box">
                            <input type="email" class="input-text" id="signInEmail" name="signInEmail" placeholder="Email">
                            <small></small>
                        </div>
                        <div class="pass-box">
                            <input type="password" class="input-text" id="signInPass" name="signInPass" placeholder="Password">
                            <small></small>
                        </div>
                        <p id="problem-message" class="problem-msg"></p> 

                        <input type="checkbox" name="log_checkbox">
                        <label for="log-checkbox" id="checkbox-text">Να με θυμάσαι</label>
                        <input  type="submit" id="submit" name="log_button" value="Σύνδεση">
                        <?php if(isset($error_message)){ ?>
                            <script>
                                const problemMessage = document.getElementById("problem-message");
                                document.querySelector(".form").style.display = "block";
                               
                                problemMessage.innerHTML = "Λάθος e-mail ή password";              
                            </script>
                        <?php	} ?>           
                    </form>
                    <a href="#" id="forget-pass">Ξεχάσατε τον κωδικό σας;</a>
                    <a href="register.php" class="col-form-signIn" id="create-acount">Δημιουργία λογαριασμού</a>
                </div>
            </div>
     </div>
</div>


<!--/***********************side-bar*********************/-->
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
<div class="header-container" id="header-container">
    <div class="header-container-box">
        <div class="header-container-col header-container-col-nav">
            <!-- <div class="fas-container"><i class="fas fa-bars fas-container"></i></div> -->
            <nav>
                <ul>
                    <li><a id="barsLink"><i class="fas fa-bars bar-ul"></i></a></li>
                    <li class="collection">
                        <a href="#" rel="noopener noreferrer">Collection</a>
                        <div class="dropdownmenu">
                            <?php
                                while($row = fetch_assoc($result)) :
                            ?>
                                <a href="products.php?category=<?=$row['sub_category_alias'];?>"><?= $row['sub_category_name']; ?></a>
                            
                            <?php  endwhile; ?>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="header-container-col header-container-logo">
            <div class="header-container-logo-img">
                <a href="index.php"><img src="img/andrews-ties-logo.png" alt="logo"></a>
            </div>
        </div>
<!--***********************************NAV BAR ICONS*******************************************-->
        <div class="header-container-col header-container-icons">
       
            <div>            
            
                <ul>
                    
                <?php if(!isset($_SESSION['user_first_name'])){ ?>
               
                    <a href="#" id="btnLog" class="btnLog"><i class="far fa-user header-container-icons-buy"></i> </a> 
                <?php  }  else { ?> 
                    <p>Καλωσήρθες <?=$_SESSION['user_first_name']?></p>
                    <a href="admin/logout.php" class="btnLog"><i class="fas fa-sign-out-alt"></i></a>   
                  
                <?php } ?>

            
                <a href="" class="btnLog"><i class="far fa-heart header-container-icons-buy"></i></a>
                <a href="cart-page.php" class="btnLog"><i class="fas fa-shopping-bag header-container-icons-buy">
                    <?php
                        echo isset($_SESSION['cart']) ? "(". count($_SESSION['cart']) . ")" : "(" . 0 .")";
                    ?>
                </i></a>
                </ul>
            </div>
        
        </div> 
      
    </div>
    
</div>   

<div class="searcharea">
        <input type="text" id="search" placeholder="Search..."/>
		<ul id="results"></ul>
</div>
<script>
        $("#search").on("input", function() {
            var key = $("#search").val();
        
            if (key) {
                $("#results").load("search.php?key=" + encodeURI(key));
                $("#search").addClass("open");
                $("#results").addClass("open");
            } else {
                $("#results").html("");
                $("#search").removeClass("open");
                $("#results").removeClass("open");
            }
        });
</script>