<?php
session_start();
 
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: sign-in.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chosen topic</title>
    <link rel="stylesheet" type="text/css" href="../css/chosen-topic.css">
    <link rel="icon" type="image/x-icon" href="../img/quizardfavicon.png">
</head>
<body>
    <div class="home">
        <div class="section-one">
            <!-- header -->
            <div class="header-container">
                <div class="top-filler"></div>
                <div class="navlogo-section">
                    <div class="logoside">
                        <a href="homepage.php">
							<img src="../img/logo.png" alt="logo">
							<p class="logo" style="color: white;">QUIZARD</p>
						</a>
						

					</div>
					<div class="right-nav">
						<div class="navbar">
							<!-- put class active when in this tab -->
							<a href="homepage.php">Home</a>
							<a class="active" href="content.php">Quizzez</a>
							<a href="scoreboard.php">Scoreboard</a>

                        </div>
                        <div class="user-nav">
                        <?php
							if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true)
							{
								echo "<a class='login' href='sign-in.php'>Log in</a>";
								echo "<a class='reg' href='sign-up.php'>Register</a>";
								
							}
							else
							{
								echo "<a class='username'>User: " . $_SESSION["username"] . "</a>";
								echo "<a class='reg' href='logout.php'>Log out</a>";
							}
							
							?>                         
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            <!-- end of header -->
            <!-- insert body here -->
            <div class="bod">
                <h1 class="middle-rectangle-h1">Your Chosen Topic is:</h1>

                <div class="middle-rectangle">
                    <div class="middle-rectangle-heading">
                        HTML
                    </div>
                    <div class="middle-rectangle-subheading">
                        Game: 4 pics 1 word
                    </div>
                </div>
                <a href="4pics.php">
                    <div class="bottom-rectangle">
                        <div class="bottom-rectangle-header">
                            Play
                        </div>
                    </div>
                </a>
            </div>

            <!-- footer -->
            <div class="footer-container">
                <div class="inner-footer">
                    <div class="left-foot">
                        <div class="inside-left">
                            <img src="../img/quizardfavicon.png" alt="logo">
                            
                            <p>“Unleash your Knowledge, embrace the Challenges.“</p>
                            <p class="from">@Quizard</p>
                        </div>
                        
                    </div>
                    <div class="mid-foot">
                        <div class="inside-mid">
                            <p class="head">Reseources</p>
							<p><a href="help-center.php">Overview</a></p>
							<p><a href="aboutus.php">About Us</a></p>
							<p><a href="contact-us.php">Contact Support</a></p>

                        </div>
                        
                    </div>
                    <div class="right-foot">
                        <div class="inside-right">
                            <div class="eyes-to-center">
                                <span class="eyes"></span>
                            </div>
                            
                            <div class="socials-container">

                                <a href="" class="social facebook">
                                    <svg height="1em" viewBox="0 0 320 512">
                                        <path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"></path>
                                    </svg>
                                </a>

                                <a href="" class="social instagram">
                                    <svg height="1em" viewBox="0 0 448 512">
                                        <path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path>
                                    </svg>
                                </a>

                                <a href="" class="social twitter">
                                    <svg height="1em" viewBox="0 0 512 512">
                                        <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                                    </svg>
                                </a>
                            </div>


                        </div>
                        
                    </div>

                </div>
                <p class="cright">Copyright ® 2024 Quizard All rights Reserved</p>
                
            </div>
        
        </div>
    </div>
</body>
</html>


