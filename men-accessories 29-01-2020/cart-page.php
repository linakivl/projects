<?php 
      session_start();
      // 
    require_once('resourses/config.php'); 
    
    require_once('resourses/config.php');
     if(isset($_POST['empty'])){
       session_unset();
       $cartUrl = $_SERVER['REQUEST_URI'];
       redirectFunction($cartUrl);
       header("Location:" . $_SESSION['url']);
     }
  ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
  table, th, td {
  border: 1px solid black;
  }
  
</style>
</head>
<body>
  <h1>CART</h1>
<?php
   
    // $cartUri = $_SERVER['REQUEST_URI'];
    
    
    if(isset($_GET['id']) && is_numeric($_GET['id']) ){

      $idproduct = $_GET['id'];

        if(isset($_SESSION['cart'][$idproduct])) {

          $_SESSION['cart'][$idproduct]['quantity']++;
          print_r($_SESSION['cart'][$idproduct]);
          header("Location:" . $_SESSION['url']);
          }else{

          $result = cartDisplay($idproduct);
          echo "helo";
          list($id, $name, $price) = mysqli_fetch_array($result);
          $_SESSION['cart'][$idproduct] = ['quantity' => 1 , 'id' => $id, 'name' => $name, 'price' => $price];
          print_r($_SESSION['cart'][$idproduct]);
          header("Location:" . $_SESSION['url']);
      
        }
         
    
    } else if(isset($_SESSION['cart'])){
      $total = 0; //synoliko poso
      $qnt = 0;   //to synolo tou kathe proiontos * posotitas
      $i = 0;
      $row = count($_SESSION['cart']);
      echo '<table>
            <tr>
              <th>Product Name</th>
              <th>Price</th>
              <th>Quantity</th>  
              <th>Total</th>      
            </tr>';
          while($row > $i){
     
          foreach($_SESSION['cart'] as $k){ 
          $qnt =  $k['quantity'] * $k['price'];
          $total += $k['quantity'] * $k['price'];  

       echo '<tr>
            <td>'. $k["name"] . '</td>
            <td>' . $k["price"] . '.00&euro;' . '</td>    
            <td>' . $k["quantity"] . '</td>
            <td>' . $qnt . '</td>    
            </tr>';

           $row--;
        }   
    }
    echo 
      '<tr>
        <td>Total</td>
        <td colspan="3">' . $total .  '.00&euro;' .'</td>
      </tr>
    </table>
    '
    ;
      
    }else{
       echo "<h2>The cart is empty</h2>";
     
    }
    
?>

  <form  method="POST">
      <input type="submit" value="Empty basket" name="empty">
    </form>
   

</body>
</html>
