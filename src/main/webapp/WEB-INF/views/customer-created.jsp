<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Created Successfully</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }

        .success-message {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            font-size: 16px;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="success-message">
            <h2><i class="fas fa-check-circle"></i> Customer Created Successfully!</h2>
            <p>The customer has been successfully created and added to the system.</p>

            <!-- Optionally, you can display the created customer details -->
            <p><strong>Name:</strong> ${customer.name}</p>
            <p><strong>Gender:</strong> ${customer.gender}</p>
            <p><strong>Date of Birth:</strong> ${customer.dob}</p>
            <p><strong>Address:</strong> ${customer.address}</p>
            <p><strong>Net Worth:</strong> ${customer.networth}</p>

            <!-- Back to home or customer list -->
            <a href="/home" class="btn btn-back">Back to Home</a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
