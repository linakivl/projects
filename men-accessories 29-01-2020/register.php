<?php
    require_once('resourses/config.php');
    include_once(FRONT_INCLUDES . DS . 'header.php');

    if(isset($_POST["signUpButton"])){

       $name = $_POST["registerName"];
       $surname = $_POST["registerLastName"];
       $email = $_POST["registerEmail"];
       $password = $_POST["registerPassword"];
       $result = signUp($name, $surname, $email, $password);
       if(!$result){
        
        $acount_message =  "Το email χρησιμοποιείται ήδη";
       }else{
           $success_message =  "Η εγγραφή σας ολοκληρώθηκε με επιτυχία";
       }
    }
?>
<div class="container-register">
    <div class="container-register-row">
       
        <div class="container-register-box">
           <h2>Εγγραφή</h2>
           <p class="register-span"></p>
           <?php  if(isset($acount_message)){ ?>
            <script>
                const registerSpan = document.querySelector(".register-span");
                registerSpan.className = "register-span acount-message";
                registerSpan.innerHTML = "Το email χρησιμοποιείται ήδη";
            </script>
           <?php } else if(isset($success_message)) {?>
            <script>
                const registerSpanSuccess = document.querySelector(".register-span");
                registerSpanSuccess.className = "register-span success-message";
                registerSpanSuccess.innerHTML = "Η εγγραφή σας ολοκληρώθηκε με επιτυχία";
            </script>
           <?php } ?>



            <div class="container-register-box-fields">
               <form action="register.php" method="post" onsubmit="return checkFormSignUp(this)">
               <div id="registerNameBox">
                    <input type="text" name="registerName" id="registerName" placeholder="Όνομα" value="<?php echo  isset($name) ? $name :  '' ?>"> 
                    <small id="registerNameSmall"></small>
               </div>
                <div id="registerLastNameBox">
                    <input type="text" name="registerLastName" id="registerLastName" placeholder="Επίθετο" value="<?php echo  isset($surname) ? $surname :  '' ?>">
                    <small  id="registerNameLast"></small>
                </div>
                <div id="registerEmailBox">
                    <input type="email" name="registerEmail" id="registerEmail" placeholder="Email" value="<?php echo  isset($email) ? $email :  '' ?>">
                    <small></small>
                </div>
                <div id="registerPassBox">
                    <input type="password" name="registerPassword" id="registerPassword"  placeholder="Κωδικός">
                    <small></small>
                </div>
                <div id="registerConfirmBox">
                    <input type="password" name="registerConfirmPassword" id="registerConfirmPassword"  placeholder="Επαλήθευση Κωδικού">
                    <small></small>
                </div>
                <!-- <div>
                    <label for="birthdaytime" id="birthdayTime"> Birthday (date and time):</label>
                    <input type="date" id="birthdaytime" name="birthdaytime" max="1979-12-31" ><br><br>
                </div>
                <label for="Newsletter">Θέλεις να ενημέρωνεσαι και εσυ για τα νέα προϊόντα;</label><br>  
                <input type="checkbox" id="newslettercheck" name="newsletter" value="Newsletter">
                -->
                <input type="submit" id="signUpSubmit" name="signUpButton" value="Εγγραφή">
                </form>

            </div>
        </div>
    </div>
</div>