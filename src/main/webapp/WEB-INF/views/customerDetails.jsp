<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            padding-top: 50px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .card-body {
            padding: 30px;
        }

        h1, h2 {
            color: #4e73df;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 500;
            color: #555;
        }

        .input-group {
            margin-bottom: 1.5rem;
        }

        .input-group input {
            border-radius: 25px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .input-group input:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.25rem rgba(79, 123, 255, 0.25);
        }

        .btn-success, .btn-primary {
            border-radius: 50px;
            font-size: 16px;
            padding: 12px;
            width: 100%;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2e59d9;
        }

        .custom-card {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border-color: #ffeeba;
        }

        .alert-warning a {
            color: #856404;
            text-decoration: none;
        }

        .alert-warning a:hover {
            text-decoration: underline;
        }

        .btn-icon {
            font-size: 18px;
            padding: 0 10px;
        }

        .btn-back {
            width: auto;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            border-radius: 50px;
        }

        .btn-back:hover {
            background-color: #0069d9;
            color: #fff;
        }

        .form-control {
            border-radius: 20px;
            padding: 12px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.25rem rgba(79, 123, 255, 0.25);
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Customer Details</h1>

        <!-- Display Customer Details -->
        <c:if test="${not empty customer}">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Customer: ${customer.name}</h5>
                    <p><strong>Gender:</strong> ${customer.gender}</p>
                    <p><strong>Date of Birth:</strong> ${customer.dob}</p>
                    <p><strong>Address:</strong> ${customer.address}</p>
                    <p><strong>Net Worth:</strong> ${customer.networth}</p>
                    <p><strong>Phone Number:</strong> ${customer.phoneNumber}</p>
                    <p><strong>Email:</strong> ${customer.email}</p>
                </div>
            </div>

            <!-- Update Customer Form -->
            <div class="custom-card">
                <h2>Update Customer</h2>

                <form action="api/customers/update/${customer.id}" method="post">
                    <!-- Customer Name -->
                    <div class="input-group">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" id="name" name="name" class="form-control" value="${customer.name}" required />
                    </div>

                    <!-- Gender -->
                    <div class="input-group">
                        <label for="gender" class="form-label">Gender</label>
                        <input type="text" id="gender" name="gender" class="form-control" value="${customer.gender}" required />
                    </div>

                    <!-- Date of Birth -->
                    <div class="input-group">
                        <label for="dob" class="form-label">Date of Birth</label>
                        <input type="date" id="dob" name="dob" class="form-control" value="${customer.dob}" required />
                    </div>

                    <!-- Address -->
                    <div class="input-group">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" id="address" name="address" class="form-control" value="${customer.address}" required />
                    </div>

                    <!-- Net Worth -->
                    <div class="input-group">
                        <label for="networth" class="form-label">Net Worth</label>
                        <input type="number" id="networth" name="networth" class="form-control" value="${customer.networth}" required />
                    </div>

                    <!-- Phone Number -->
                    <div class="input-group">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" value="${customer.phoneNumber}" required />
                    </div>

                    <!-- Email -->
                    <div class="input-group">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" name="email" class="form-control" value="${customer.email}" required />
                    </div>

                    <button type="submit" class="btn btn-success">Update Customer</button>
                </form>
            </div>
        </c:if>

        <!-- In case no customer details were found -->
        <c:if test="${empty customer}">
            <div class="alert alert-warning mt-3" role="alert">
                No customer details found.
            </div>
        </c:if>

        <hr>

        <!-- Back to Customer List Button -->
        <a href="/home" class="btn btn-primary btn-back">Back to Customer List</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
