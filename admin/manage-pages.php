<?php
session_start();
error_reporting(0);
include('includes/config.php');

if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
        // Handle form submission
        $pagetype = 'aboutus';
        $pagedetails = $_POST['pgedetails'];

        // Update the database
        $sql = "UPDATE pusoe_pages SET detail=:pagedetails WHERE type=:pagetype";
        $query = $dbh->prepare($sql);
        $query->bindParam(':pagetype', $pagetype, PDO::PARAM_STR);
        $query->bindParam(':pagedetails', $pagedetails, PDO::PARAM_STR);
        $query->execute();
        $msg = "About Us details updated successfully";
    }

    // Fetch the current "About Us" details from the database
    $pagetype = 'aboutus';
    $sql = "SELECT detail from pusoe_pages where type=:pagetype";
    $query = $dbh->prepare($sql);
    $query->bindParam(':pagetype', $pagetype, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    if ($query->rowCount() > 0) {
        $aboutUsDetails = htmlentities($results[0]->detail);
    } else {
        $aboutUsDetails = ""; // Default value if not found in the database
    }
}
?>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="theme-color" content="#3e454c">
    <title>Pusoe Bakers | Manage About Us</title>
    <!-- Font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Sandstone Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Admin Style -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <?php include('includes/header.php'); ?>
    <div class="ts-main-content">
        <?php include('includes/leftbar.php'); ?>
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-title">Manage About Us</h2>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="panel panel-default">
                                    <div class="panel-heading">About Us</div>
                                    <div class="panel-body">
                                        <form method="post" name="chngpwd" class="form-horizontal">
                                            <?php if ($msg) { ?>
                                                <div class="succWrap"><strong>SUCCESS</strong>: <?php echo htmlentities($msg); ?> </div>
                                            <?php } ?>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">About Us Details</label>
                                                <div class="col-sm-8">
                                                    <textarea class="form-control" rows="5" cols="50" name="pgedetails" id="pgedetails" placeholder="About Us Details" required><?php echo $aboutUsDetails; ?></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-4">
                                                    <button type="submit" name="submit" value="Update" id="submit" class="btn-primary btn">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Loading Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
