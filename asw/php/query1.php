<?php
// Database credentials adding message
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aswdb";

// Create connection
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query data from the database
    $stmt = $conn->prepare("SELECT e.title, COUNT(te.tapestry_id) AS num_tapestries
                            FROM Exhibition e
                            LEFT JOIN Tapestry_Exhibition te ON e.exhibition_id = te.exhibition_id
                            GROUP BY e.title");
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Close connection
    $conn = null;
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
    die(); // Stop further execution if connection fails
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 1 Results</title>
    <!-- Add your CSS styles here if needed -->
</head>
<body>
    <h1>Query 1 Results</h1>
    <table>
        <tr>
            <th>Exhibition Title</th>
            <th>Number of Tapestries</th>
        </tr>
        <?php
        // Display query results in table rows
        foreach ($results as $row) {
            echo "<tr>";
            echo "<td>" . $row['title'] . "</td>";
            echo "<td>" . $row['num_tapestries'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
