<?php
if (isset($_POST['submitForm'])) {
    // Handle both newsletter subscription and review submission here
    $email = $_POST['emailid'];
    $reviewMessage = $_POST['reviewMessage'];

    // Database connection setup
    $hostname = "localhost"; // Change to your MySQL server hostname
    $username = "root";      // Default XAMPP username
    $password = "";          // No password (empty)
    $database = "pusoe";     // Your database name

    try {
        // Establish a database connection
        $dbh = new PDO("mysql:host=$hostname;dbname=$database", $username, $password);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Check if the email is already subscribed
        $checkEmailSql = "SELECT SubscriberEmail FROM pusoe_subscribers WHERE SubscriberEmail = :email";
        $checkEmailQuery = $dbh->prepare($checkEmailSql);
        $checkEmailQuery->bindParam(':email', $email, PDO::PARAM_STR);
        $checkEmailQuery->execute();

        if ($checkEmailQuery->rowCount() > 0) {
            // Email is already subscribed
            echo "<script>alert('Email address is already subscribed.');</script>";
        } else {
            // Email is not subscribed, insert it along with the review message
            $insertSql = "INSERT INTO pusoe_subscribers (SubscriberEmail, ReviewMessage) VALUES (:email, :reviewMessage)";
            $insertQuery = $dbh->prepare($insertSql);
            $insertQuery->bindParam(':email', $email, PDO::PARAM_STR);
            $insertQuery->bindParam(':reviewMessage', $reviewMessage, PDO::PARAM_STR);

            if ($insertQuery->execute()) {
                // Review submitted successfully
                echo "<script>alert('Review submitted successfully.');</script>";
            } else {
                // Review submission failed
                echo "<script>alert('Failed to submit review.');</script>";
            }
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pusoe Bakers</title>
    <!-- Include your CSS and other head elements here -->
    <link rel="stylesheet" href="assets2/css/style.css" type="text/css">
    <link rel="stylesheet" href="assets2/css/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="assets2/css/owl.transitions.css" type="text/css">
    <link href="assets2/css/slick.css" rel="stylesheet">
    <link href="assets2/css/bootstrap-slider.min.css" rel="stylesheet">
    <link href="assets2/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
    <!-- Your page content goes here -->

    <footer>
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h6>About Us</h6>
                        <ul>
                            <li><a href="page.php?type=aboutus">About Us</a></li>
                            <!-- <li><a href="page.php?type=faqs">FAQs</a></li>
                            <li><a href="page.php?type=privacy">Privacy</a></li>
                            <li><a href="page.php?type=terms">Terms of use</a></li>
                            <li><a href="admin/">Admin Login</a></li> -->
                        </ul>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <h6>Subscribe and Leave a Review</h6>
                        <div class="newsletter-review-form">
                            <form method="post">
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail2">Email Address <span>*</span></label>
                                    <input type="email" class="form-control unicase-form-control text-input"
                                        id="email" onBlur="userAvailability()" name="emailid" required>
                                    <span id="user-availability-status1" style="font-size:12px;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="reviewMessage">Your Review:</label>
                                    <textarea name="reviewMessage" id="reviewMessage" class="form-control"
                                        required placeholder="Write your review here"></textarea>
                                </div>
                                <button type="submit" name="submitForm" class="btn btn-block"> Submit
                                    <span class="angle_arrow"><i class="fa fa-angle-right"
                                            aria-hidden="true"></i></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-  col-md-push-3">
                        <p class="copy-left">Copyright &copy; 2023 Pusoe Bakers | Design and developed by Nabin Pokhrel  </p>
                          <!--l Media Icons (Right Si Sociade) -->
            <div class="col-md-12 text-right">
            <div class="footer_widget">
                    <p class="copy-right">Connect with Us:</p>
                    <ul>
                        <li><a href="https://www.facebook.com/anabin123"><i
                                    class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
                    </div>
                </div>
            </div>
        </div>
        
    </footer>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="container">
            <!-- ... (previous code) ... -->

            <!-- Display Data from Database -->
            <div class="row">
                <div class="col-md-6">
                    <?php
                    try {
                        // Database Connection
                        $dbh = new PDO('mysql:host=localhost;dbname=pusoe', 'root', '');
                        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                        // Fetch Contact Info
                        $sql = "SELECT `Address`, `EmailId`, `ContactNo` FROM `pusoe_contactusinfo`";
                        $query = $dbh->prepare($sql);
                        $query->execute();
                        $contactInfo = $query->fetch(PDO::FETCH_ASSOC);

                        if ($contactInfo) {
                            echo "Address: " . htmlentities($contactInfo['Address']) . "<br>";
                            echo "Email: " . htmlentities($contactInfo['EmailId']) . "<br>";
                            echo "Phone: " . htmlentities($contactInfo['ContactNo']);
                        } else {
                            echo "Contact information not available.";
                        }
                    } catch (PDOException $e) {
                        echo "Database connection failed: " . $e->getMessage();
                    }
                    ?>
                </div>
            </div>
            <!-- End Data Section -->
        </div>
    </footer>
    <!-- End Footer Section -->

    <!-- Include your JavaScript and other script tags here -->
</body>

</html>
