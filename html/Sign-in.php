<?php
session_start();
 
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
  header("location: homepage.php");
  exit;
}
 
require_once "config.php";
 
$email = $password = "";
$email_err = $password_err = $login_err = "";
 
if($_SERVER["REQUEST_METHOD"] == "POST")
{
 
  if(empty(trim($_POST["email"])))
  {
    $email_err = "Please enter email.";
  } 
  else
  {
    $email = trim($_POST["email"]);
  }
  
  if(empty(trim($_POST["password"]))){
    $password_err = "Please enter your password.";
  } 
  else
  {
    $password = trim($_POST["password"]);
  }
  
  if(empty($email_err) && empty($password_err))
  {
    $sql = "CALL `sp_checkUser`(?)";
    
    if($stmt = mysqli_prepare($link, $sql))
    {
      mysqli_stmt_bind_param($stmt, "s", $param_email);
      
      $param_email = $email;
      
      if(mysqli_stmt_execute($stmt))
      {
        mysqli_stmt_store_result($stmt);
        
        if(mysqli_stmt_num_rows($stmt) == 1)
        {                    
          mysqli_stmt_bind_result($stmt, $id, $name, $pass);
          if(mysqli_stmt_fetch($stmt))
          {
            if($password==$pass)
            {
              session_start();
              
              $_SESSION["loggedin"] = true;
              $_SESSION["id"] = $id;
              $_SESSION["username"] = $name;                            
              
              header("location: homepage.php");
            } 
            else
            {
              $login_err = "Invalid password.";
            }
          }
        } 
        else
        {
          $login_err = "Invalid username or password.";
        }
      } 
      else
      {
        echo "Oops! Something went wrong. Please try again later.";
      }

      mysqli_stmt_close($stmt);
    }
  }
  
  mysqli_close($link);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quizard - LOGIN</title>
  <link rel="stylesheet" type="text/css" href="../css/Sign in.css">
  
</head>


<body class="signin-body">
<div class="h1"></div>

<div class="main">
  
  <div class="firstbox"> 
    <div class="info">
      <div class="back"></div>
      <h2>Welcome to Quizard</h2>
      <p>"Unleash your Knowledge, <br> embrace the Challenges"</p>
      <a href="sign-up.php"><button> Sign Up </button></a><br>
      <p1> Don't have an account? </p1><br>

            
    </div>
  </div>

    
  <div class="secondbox">
    <hh> Login </hh>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
      <label class="email">EMAIL ADDRESS</label>
      <input type="" name="email" placeholder="" required>
      <img class="image-inside-textbox" src="../img/email.png" alt="Image"> 
      <p><?php echo $email_err; ?></p>

      <label class="password">PASSWORD</label>
      <input type="password" name="password" placeholder="" required>

      <p><?php echo $password_err; ?></p>
      <p><?php echo $login_err; ?></p>

      <button type="submit">Login</button>
    </form>
  </div>
</div>
</body>
</html>
