<%-- 
    Document   : DisplayAll
    Created on : 3 Mar 2020, 09:09:58
    Author     : hyoku
--%>


<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"></script>
            <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
           
        <title>Display All Breweries</title>
    </head>
    <body>
        <table id="example" class="table table-striped table-bordered" style="width:100%" >
            <thead>
            <tr>
            <th align="left">ID</th>
            <th align="left">Name</th>
            <th align="left">Address1</th>
            <th align="left">Address2</th>
            <th align="left">city</th>
            <th align="left">State</th>
            <th align="left">Code</th>
            <th align="left">Country</th>
            <th align="left">Phone</th>
            <th align="left">Email</th>
            <th align="left">Image</th>
            <th align="left">Website</th>
            <th align="left">Last_Mod</th>
            <th align="left">Credit Limit</th>
            <th align="left">Actions</th>
            </tr>
            </thead>
            
            <tbody>
            <c:forEach items="${brewList}" var="brew"> 
                <tr>
                    <td>${brew.id}</td>
                    <td>${brew.name}</td>
                    <td>${brew.address1}</td>
                    <td>${brew.address2}</td>
                    <td>${brew.city}</td>
                    <td>${brew.state}</td>
                    <td>${brew.code}</td>
                    <td>${brew.country}</td>
                    <td>${brew.phone}</td>
                    <td>${brew.email}</td>
                    <td><img src="/A1CrudV1/assets/${brew.image}" width="50" height="50" > </td>

                   <td>${brew.website}</td>
                    <td>${brew.lastMod}</td>
                    <td><fmt:formatNumber value="${brew.creditLimit}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                    
                    <td><a href="/A1CrudV1/main/add">Add<a>
                        <a href="/A1CrudV1/main/edit?id=${brew.id}">edit<a>
                        <a href="/A1CrudV1/main/delete?id=${brew.id}" class="button-link" onclick="return confirm('Are you sure you want to delete this?')">Delete</a>  
                    </td>

                                
                </tr>
            </c:forEach>
            </tbody>    
            <tfoot>
            <tr>
                <th align="left">ID</th>
                <th align="left">Name</th>
                <th align="left">Address1</th>
                <th align="left">Address2</th>
                <th align="left">City</th
                <th align="left">State</th>>
                <th align="left">Code</th>
                <th align="left">Country</th>
                <th align="left">Phone</th>
                <th align="left">Phone</th>
                <th align="left">Email</th>
                <th align="left">Image</th>
                <th align="left">Website</th>
                <th align="left">Last_Mod</th>
                <th align="left">Credit Limit</th>
                <th align="left">Actions</th>
            </tr>
             </tfoot>
        </table>
    </body>

</html>



    
<script type="text/javascript">        
    $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>    