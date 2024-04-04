<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sudoku34 Input Validation 2.0</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        form input[type="text"], form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Styles for the loading indicator */
        .loading {
            display: none; /* Initially hidden */
            text-align: center;
        }
        .loading img {
            width: 50px; /* Adjust size as needed */
            height: 50px; /* Adjust size as needed */
        }

        /* Styles for success and error messages */
        .success-message, .error-message {
            display: none;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            text-align: center;
        }
        .success-message {
            background-color: #4CAF50;
            color: white;
        }
        .error-message {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Sudoku34 Input Validation 2.0</h1>
    <form id="numberForm">
        <label for="row">Enter row (0-8):</label>
        <input type="text" id="row" name="row" placeholder="Enter row number">
        <label for="col">Enter column (0-8):</label>
        <input type="text" id="col" name="col" placeholder="Enter column number">
        <label for="number">Enter a single digit number:</label>
        <input type="text" id="number" name="number" placeholder="Enter number">
        <input type="submit" id="submitBtn" value="Submit">
        <div class="loading" id="loadingIndicator">
            <img src="https://cdnjs.cloudflare.com/ajax/libs/galleriffic/2.0.1/css/loader.gif" alt="Loading...">
        </div>
        <div class="success-message" id="successMessage"></div>
        <div class="error-message" id="errorMessage"></div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('#numberForm').submit(function(e) {
        e.preventDefault();
        var row = $('#row').val();
        var col = $('#col').val();
        var number = $('#number').val();

        // Disable form inputs and submit button during AJAX request
        $('#row, #col, #number, #submitBtn').prop('disabled', true);

        // Clear success and error messages
        $('#successMessage, #errorMessage').text('').hide();

        $.ajax({
            url: 'https://sudoku-microservice.azurewebsites.net/validate?row=' + row + '&col=' + col + '&num=' + number,
            type: 'GET',
            beforeSend: function() {
                // Show loading indicator before sending the AJAX request
                $('#loadingIndicator').show();
            },
            success: function(response) {
                // Hide loading indicator after receiving the response
                $('#loadingIndicator').hide();

                // Process response and display appropriate message
                if (response.trim() === "Invalid input") {
                    $('#errorMessage').text("Invalid input: The number violates sudoku rules.").show();
                } else {
                    $('#successMessage').text("Valid input: The number is allowed in the sudoku puzzle.").show();
                    // Clear form inputs after successful submission
                    $('#row, #col, #number').val('');
                }

                // Re-enable form inputs and submit button after processing the response
                $('#row, #col, #number, #submitBtn').prop('disabled', false);
            },
            error: function(xhr, status, error) {
                // Hide loading indicator in case of an error
                $('#loadingIndicator').hide();

                // Display error message
                $('#errorMessage').text("Error occurred while validating input: " + error).show();

                // Re-enable form inputs and submit button after processing the error
                $('#row, #col, #number, #submitBtn').prop('disabled', false);
            }
        });
    });
</script>
</body>
</html>
