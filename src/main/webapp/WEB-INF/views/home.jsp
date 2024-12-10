<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    <!-- Bootstrap 5.1.3 for responsive and modern design -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #495057;
            padding-top: 50px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        h1, h2, h5 {
            color: #4e73df;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 20px;
        }

        h1, h2 {
            font-size: 30px;
        }

        h5 {
            font-size: 22px;
        }

        .btn-primary, .btn-secondary, .btn-success, .btn-warning {
            font-size: 16px;
            border-radius: 50px;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2e59d9;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            background-color: #fff;
        }

        .card:hover {
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }

        .table {
            border-radius: 12px;
            overflow: hidden;
        }

        .table thead {
            background-color: #f1f3f7;
            color: #4e73df;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fc;
        }

        .alert-info {
            background-color: #e7f1ff;
            border-color: #b3d8ff;
            color: #4e73df;
        }

        .form-label {
            font-weight: 500;
            color: #5a5a5a;
        }

        .input-group {
            margin-bottom: 1rem;
        }

        .mt-3 {
            margin-top: 2rem;
        }

        .mt-5 {
            margin-top: 3rem;
        }

        .custom-card {
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 25px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.25rem rgba(79, 123, 255, 0.25);
        }

        .card-body {
            padding: 25px;
        }

        .btn-icon {
            font-size: 18px;
            padding: 0 10px;
        }

        .search-form {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }
    </style>
</head>

<body>

    <div class="container">

        <!-- Show All Customers Section -->
        <h2 class="text-center mb-4">All Customers</h2>
        <form action="api/customers/all" method="get" class="mb-4">
            <button type="submit" class="btn btn-primary btn-lg btn-block w-100">Show All Customers</button>
        </form>

        <c:if test="${not empty allCustomers}">
            <div class="mt-4">
                <h5>All Customers:</h5>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Date of Birth</th>
                                <th>Address</th>
                                <th>Net Worth</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="customer" items="${allCustomers}">
                                <tr>
                                    <td>${customer.id}</td>
                                    <td>${customer.name}</td>
                                    <td>${customer.gender}</td>
                                    <td>${customer.dob}</td>
                                    <td>${customer.address}</td>
                                    <td>${customer.networth}</td>
                                    <td>${customer.phoneNumber}</td>
                                    <td>${customer.email}</td>
                                    <td>
                                        <a href="api/customers/${customer.id}" class="btn btn-info btn-sm btn-icon"><i class="fas fa-eye"></i> View</a>
                                        <a href="api/customers/update/${customer.id}" class="btn btn-warning btn-sm btn-icon"><i class="fas fa-edit"></i> Update</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
        
        <hr>

        <!-- Create New Customer Section -->
        <div class="custom-card">
            <h2 class="text-center">Create New Customer</h2>

            <form action="api/customers/create" method="post">
                <!-- Customer Name -->
                <div class="input-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Enter Name" required />
                </div>

                <!-- Gender (Dropdown) -->
				<div class="input-group">
				    <label for="gender" class="form-label">Gender</label>
				    <select id="gender" name="gender" class="form-control" required>
				        <option value="" disabled selected>Select Gender</option>
				        <option value="Male">Male</option>
				        <option value="Female">Female</option>
				    </select>
				</div>

                <!-- Date of Birth -->
                <div class="input-group">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" id="dob" name="dob" class="form-control" required />
                </div>

                <!-- Address -->
                <div class="input-group">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" id="address" name="address" class="form-control" placeholder="Enter Address" required />
                </div>

                <!-- Net Worth -->
                <div class="input-group">
                    <label for="networth" class="form-label">Net Worth</label>
                    <input type="number" id="networth" name="networth" class="form-control" placeholder="Enter Net Worth" required />
                </div>

                <!-- Phone Number -->
                <div class="input-group">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Enter Phone Number" required />
                </div>

                <!-- Email -->
                <div class="input-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email" required />
                </div>

                <button type="submit" class="btn btn-success w-100">Create Customer</button>
            </form>
        </div>

        <hr>

        <!-- Search Customers Section -->
        <h1 class="text-center mt-4">Search Customers</h1>

        <!-- Search by Name Form -->
<div class="search-form">
    <form action="api/customers/searchByName" method="get">
        <div class="input-group mb-3">
            <label for="name" class="form-label">Search by Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter Name" />
        </div>
        <button type="submit" class="btn btn-primary w-100">Search by Name</button>
    </form>
</div>


<!-- Search by Customer ID Form -->
<div class="search-form">
    <form action="api/customers/searchById" method="get">
        <div class="input-group mb-3">
            <label for="id" class="form-label">Search by Customer ID</label>
            <input type="number" id="id" name="id" class="form-control" placeholder="Enter Customer ID" />
        </div>
        <button type="submit" class="btn btn-primary w-100">Search by ID</button>
    </form>
</div>


<!-- Search by Email Form -->
<div class="search-form">
    <form action="api/customers/searchByEmail" method="get">
        <div class="input-group mb-3">
            <label for="email" class="form-label">Search by Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email" />
        </div>
        <button type="submit" class="btn btn-primary w-100">Search by Email</button>
    </form>
</div>


        <hr>

        <!-- Displaying search results -->
        <c:if test="${not empty result}">
            <div class="mt-4">
                <h5>Search Results:</h5>
                <ul class="list-group">
                    <c:forEach var="customer" items="${result}">
                        <li class="list-group-item">
                            <strong>Name:</strong> ${customer.name}<br>
                            <strong>Gender:</strong> ${customer.gender}<br>
                            <strong>Date of Birth:</strong> ${customer.dob}<br>
                            <strong>Address:</strong> ${customer.address}<br>
                            <strong>Net Worth:</strong> ${customer.networth}
                            <form action="api/customers/{customer.id}/edit" method="get">
                                <button type="submit" class="btn btn-warning mt-2 btn-sm">Update</button>
                            </form>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
