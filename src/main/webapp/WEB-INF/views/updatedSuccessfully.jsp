<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Successful</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
</head>

<body>

    <div class="container mt-5">
        <h1>Customer Update</h1>

        <!-- Success message -->
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">${message}</h4>
            <p>The customer details have been updated successfully.</p>
        </div>

        <!-- Back to Customer List Button -->
        <a href="/home" class="btn btn-primary">Back to Customer List</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
