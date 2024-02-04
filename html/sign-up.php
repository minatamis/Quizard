<?php
require_once "config.php";
 
$email = $username = $password = $confirm_password = "";
$email_err = $username_err = $password_err = "";
 
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    if(empty(trim($_POST["email"])))
    {
        $email_err = "Please enter an email.";
    } 
    else
    {
        $sql = "CALL `sp_checkEmailExist`(?)";
        
        if($stmt = mysqli_prepare($link, $sql))
        {
            mysqli_stmt_bind_param($stmt, "s", $param_email);
            
            $param_email = trim($_POST["email"]);
            
            if(mysqli_stmt_execute($stmt))
            {
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1)
                {
                    $email_err = "This email is already in use.";
                } 
                else
                {
                    $email = trim($_POST["email"]);
                }
            } 
            else
            {
                echo "Oops! Something went wrong. Please try again later.";
            }

            mysqli_stmt_close($stmt);
        }
    }

    if(empty(trim($_POST["name"])))
    {
        $username_err = "Please enter a name.";
    } 
    else
    {
        $username = trim($_POST["name"]);
    }
    
    if(empty(trim($_POST["password"])))
    {
        $password_err = "Please enter a password.";     
    } 
    elseif(strlen(trim($_POST["password"])) < 6)
    {
        $password_err = "Password must have atleast 6 characters.";
    } 
    else
    {
        $password = trim($_POST["password"]);
    }
    
    if(empty($username_err) && empty($password_err) && empty($email_err))
    {
        
        $sql = "CALL `sp_insertUser`(?,?,?);";
         
        if($stmt = mysqli_prepare($link, $sql))
        {
            mysqli_stmt_bind_param($stmt, "sss", $param_username, $param_password, $param_email);
            
            $param_email = $email;
            $param_username = $username;
            $param_password = $password;
            
            if(mysqli_stmt_execute($stmt))
            {
                header("location: Sign-in.php");
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
  <title>Quizard - Sign Up</title>
  <link rel="stylesheet" type="text/css" href="../css/Sign in.css">
  <link rel="icon" type="image/x-icon" href="../img/quizardfavicon.png">
  
</head>


<body class="signin-body">
<div class="h1"></div>

<div class="main">
  
   <div class="firstbox"> 
          <div class="info">
    <div class="back"></div>
            <h2>Welcome to Quizard</h2>
            <p>"Unleash your Knowledge, <br> embrace the Challenges"</p>
            <button> Log in </button><br>
            <p1> Already have an account? </p1><br>

              
        </div>
      </div>

      
    <div class="secondbox">
           <hh> Sign Up </hh>

            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                <!-- <label class="email">Name</label> -->
                <input type="text" name="name" placeholder="NAME" required>

                <!-- <label class="email">EMAIL ADDRESS</label> -->
                <input type="text" name="email" placeholder="EMAIL ADDRESS" required>

                <!-- <label class="password">PASSWORD</label> -->
                <input type="password" name="password" placeholder="PASSWORD" required>

                <button type="submit">Sign Up</button>
            </form>

        </div>
      </div>
</body>
</html>
