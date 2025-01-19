<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aswdb";

// Initialize variables
$artist_name = "";
$results = [];

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get artist name from the form
    $artist_name = $_POST["artist_name"];

    // Create connection
    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Query data from the database based on user input
        $stmt = $conn->prepare("SELECT t.title, t.estimated_value
                                FROM Tapestry t
                                INNER JOIN Artist a ON t.artist_id = a.artist_id
                                WHERE a.name = :artist_name");
        $stmt->bindParam(':artist_name', $artist_name);
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
    <title>Query 3</title>
    <!-- Add your CSS styles here if needed -->
</head>
<body>
    <h1>Query 3: Find Tapestries by Artist Name</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="artist_name">Enter Artist Name:</label>
        <input type="text" id="artist_name" name="artist_name" value="<?php echo $artist_name; ?>" required>
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
