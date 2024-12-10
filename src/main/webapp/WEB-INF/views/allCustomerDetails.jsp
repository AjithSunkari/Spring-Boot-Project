<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Customers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
</head>

<body>

    <div class="container mt-5">
        <h1>All Customer Details</h1>

        <!-- Check if the customer list is not empty -->
        <c:if test="${not empty customers}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Date of Birth</th>
                        <th scope="col">Address</th>
                        <th scope="col">Net Worth</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Email</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Iterate through the list of customers -->
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.name}</td>
                            <td>${customer.gender}</td>
                            <td>${customer.dob}</td>
                            <td>${customer.address}</td>
                            <td>${customer.networth}</td>
                            <td>${customer.phoneNumber}</td> <!-- Added phone number column -->
                            <td>${customer.email}</td> <!-- Added email column -->
                            <td>
                                <!-- View Customer Details Button -->
                                <a href="/api/customers/${customer.id}" class="btn btn-info btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- In case no customers are found -->
        <c:if test="${empty customers}">
            <div class="alert alert-info" role="alert">
                No customers found.
            </div>
        </c:if>

        <hr>
        
        <!-- Back to Search page or Home -->
        <a href="/home" class="btn btn-primary">Back to Home</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
