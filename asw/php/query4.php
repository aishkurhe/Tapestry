<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aswdb";

// Initialize variables
$min_estimated_value = "";
$results = [];

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get minimum estimated value from the form
    $min_estimated_value = $_POST["min_estimated_value"];

    // Create connection
    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Query data from the database based on user input
        $stmt = $conn->prepare("SELECT title, estimated_value
                                FROM Tapestry
                                WHERE estimated_value > :min_estimated_value");
        $stmt->bindParam(':min_estimated_value', $min_estimated_value);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Close connection
        $conn = null;
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
        die(); // Stop further execution if connection fails
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query 4: Find Tapestries with Estimated Value Greater Than</title>
    <!-- Add your CSS styles here if needed -->
</head>
<body>
    <h1>Query 4: Find Tapestries with Estimated Value Greater Than</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="min_estimated_value">Enter Minimum Estimated Value:</label>
        <input type="number" id="min_estimated_value" name="min_estimated_value" value="<?php echo $min_estimated_value; ?>" required>
        <button type="submit">Submit</button>
    </form>
    <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
        <?php if (empty($results)): ?>
            <p>No results found.</p>
        <?php else: ?>
            <h2>Results</h2>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Estimated Value</th>
                </tr>
                <?php foreach ($results as $row): ?>
                    <tr>
                        <td><?php echo $row['title']; ?></td>
                        <td><?php echo $row['estimated_value']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>
    <?php endif; ?>
</body>
</html>
