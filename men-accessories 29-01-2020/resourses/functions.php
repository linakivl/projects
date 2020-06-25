<?php
   
    //Στέλνω το query
    function query($sql){

        global $connection;
        //confirm 
        $query = mysqli_query($connection, $sql);

        if(!$query){

            die("QUERY FAILED " . mysqli_error($connection));

        }
        
        return $query;
    }

    function num_rows($validSql){

        if(mysqli_num_rows($validSql) < 1){

            echo "This query returns zero results";

        }else{

            return $validSql;
        }

    }

    //Μετατρέπω το query σε associative πίνακα
    function fetch_assoc($query){
        global $connection;
        $result = mysqli_fetch_assoc($query);
        return $result;

        mysqli_close($connection);

    }

    function escape_string($theString){

        //Ειδικούς χαρακτήρες
        global $connection;
        return mysqli_real_escape_string($connection, $theString);

    }
    //New entries IN INDEX
    function newEntries(){

        $sql = "SELECT `product_id`, `product_photo_url`, `product_name`, `product_price` , `product_alias` FROM products WHERE `product_sub_category_id` = 1 ORDER BY RAND() LIMIT 3";
        $result = query($sql);
    
        //HEREDOC WAY
        while($randomPro = fetch_assoc($result)){
            $product =<<<PRD
            <div class="random-row-products-photo">
               <a href="product.php?id={$randomPro['product_id']}"><img src={$randomPro['product_photo_url']} alt="{$randomPro['product_name']}>">
        
                <h3>{$randomPro['product_name']}</h3></a>
                <p>{$randomPro['product_price']}.00&euro;</p>
            </div>
PRD;
        echo $product;
        }
    }

    function getAllCategoriesInfo($categoryAlias){
        $queryCategories = "SELECT * FROM sub_category WHERE sub_category_alias = '$categoryAlias'";
        $resultsQuerySub = query($queryCategories);
        return $resultsQuerySub;
    }

    function getCategories(){

        $categories = "SELECT `id`, `sub_category_name`, sub_category_alias FROM `sub_category` ";
        $result = query($categories);
        while($row = fetch_assoc($result)){
            $category =<<<EOT
            <li>
            <a href="products.php?category={$row['sub_category_alias']}">{$row['sub_category_name']}</a>
            </li>
EOT;
        echo $category;
        }
    }

    function getProducts($sub_alias){

        // $queryProducts = "SELECT * FROM products WHERE `product_sub_category_id` = $id ";

        $queryProducts = "SELECT product_id, product_name, product_photo_url, product_price , product_alias, product_sub_category_id,sub_category_alias, id
         FROM products INNER JOIN sub_category ON products.product_sub_category_id = sub_category.id 
         WHERE sub_category.sub_category_alias = '$sub_alias'";
        $results = query($queryProducts);
        return $results;
    }

   
    
    function displayProduct($product_alia){

        $query_sql = "SELECT `product_id`, `product_name`,`product_alias`,`product_description`,`product_price`,`product_sub_category_id`,`product_sale`,`product_photo_url`,`product_quantity`,`product_sku`, `sub_category_name`,`sub_category_alias`
        FROM products
        INNER JOIN sub_category ON products.product_sub_category_id = sub_category.id 
        WHERE products.product_alias = '$product_alia'";

        $products = query($query_sql);
        return  $products;
    }

    function randByCategoryProducts($product_alia){

        $query_sql = "SELECT `product_sub_category_id` FROM products WHERE `product_alias` = '$product_alia' LIMIT 1";
        $result = query($query_sql);
        $sci = fetch_assoc($result);
        foreach($sci as $col => $key){
            $sub_cat_id = $key;
        }
        $query_sql_two = "SELECT `product_id`, `product_name`, `product_price`, `product_alias`,
                        `product_photo_url`,`product_sub_category_id`,`sub_category_name`,`id` 
                        FROM products iNNER JOIN sub_category 
                        ON products.product_sub_category_id = sub_category.id 
                        WHERE products.product_sub_category_id = $sub_cat_id
                        ORDER BY RAND() LIMIT 4";
                        
        $result_two = query($query_sql_two);  
        $readyQuery = num_rows($result_two);           
        return $readyQuery;
    }

    function breadcrumb($productAlias){

        $breadcrumbQuery =  "SELECT `product_id`, `product_name`,`product_sub_category_id`,`product_alias`,
        `sub_category_name`,`id`, `sub_category_alias`
        FROM products iNNER JOIN sub_category 
        ON products.product_sub_category_id = sub_category.id 
        WHERE products.product_alias = '$productAlias'
        ORDER BY RAND() LIMIT 1";
        
        $oneRow = query($breadcrumbQuery);
        return $oneRow;

    }
/*********************SIGN IN FUNCTIONS************************/
    function signIn($email, $password){
        global $connection;

            $emailSanitize = filter_var($email, FILTER_SANITIZE_EMAIL);
            $passwordEscapeString = mysqli_real_escape_string($connection, trim($password));
            $passwordHash = hash("SHA512", $password);
            
            $query = "SELECT * FROM users WHERE user_email = '$email' AND user_password = '$passwordHash'";
            $sql = query($query);
            $rows = mysqli_num_rows($sql);
            if($rows == 1){
                return $sql;
            }else{
                return  false;
            }
    }
    function signUp($name, $surname, $email, $password){
        global $connection;

            $emailUser= filter_var($email, FILTER_SANITIZE_EMAIL);
            $passwordEscapeString = escape_string(trim($password));
            $passwordUser = hash("SHA512", $passwordEscapeString);
            $nameUser = escape_string(trim($name));
            $surnameUser = escape_string(trim($surname));

            $checkemail = "SELECT * FROM `users` WHERE `user_email` = '$emailUser'";
            $checkResultQuery = query($checkemail);
            $checkResult= num_rows($checkResultQuery);
       
            if(!$checkResult){
                 $sql = "INSERT INTO `users` (`user_email`, `user_first_name`, 
                `user_last_name`,  `user_password`) VALUES 
                ('$emailUser','$nameUser','$surnameUser','$passwordUser')"; 

                $query = query($sql); 
                if($query){
                    return true;
                } 
            }
            else{
                return false;
            } 

    }
    function cartDisplay($id){
        global $connection;
        $sql = "SELECT `product_id`, `product_name`, `product_price` FROM products WHERE `product_id`= $id";
        $result = query($sql);
        if(mysqli_num_rows($result) == 1){
            return $result;
            mysqli_close($connection);

        }
        return false;
    }
    function redirectFunction($uri){
        $case = strrpos($uri, '/', -1)+1;
        $_SESSION['url'] = substr($uri, $case);
    }

    function logout(){
            $_SESSION = array(); 
            session_destroy();
    }

  
     
       
       
    
?>