<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Brewery</title>
        <jsp:useBean id ="now" class="java.util.Date"></jsp:useBean>    
    </head>
  
        <h3>Add the Brewery Details</h3>
        
        <form:form method="POST" action="/A1CrudV1/main/addBrewery" modelAttribute="brewery">

            <table>
                <span style="color:blueviolet">
                <form:errors path="*"/>
                </span>
                <tr>
                    <td><form:input path="id" readonly="true" type="hidden" value="1"/></td>
                </tr>              
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name"/></td>                  
                </tr>
                <tr>
                    <td><form:label path="address1">Address1</form:label></td>
                    <td><form:input path="address1"/></td>
                   
                </tr>
                <tr>
                    <td><form:label path="address2">Address2</form:label></td>
                    <td><form:input path="address2"/></td>                
                </tr>
                <tr>
                    <td><form:label path="city">City</form:label></td>
                    <td><form:input path="city"/></td>     
                </tr>
                 <tr>
                    <td><form:label path="state">State</form:label></td>
                    <td><form:input path="state"/></td>           
                </tr>
                 <tr>
                    <td><form:label path="code">Code</form:label></td>
                    <td><form:input path="code"/></td> 
                </tr>
                 <tr>
                    <td><form:label path="country">Country</form:label></td>
                    <td><form:input path="country"/></td>                
                </tr>
                      <tr>
                    <td><form:label path="phone">Phone</form:label></td>
                    <td><form:input path="phone"/></td>      
                </tr>
                      <tr>
                    <td><form:label path="website">Website</form:label></td>
                    <td><form:input path="website"/></td>
              </tr>
                      <tr>
                    <td><form:label path= "image">Image</form:label>
                    <td><form:input path="image" value="no_image.jpg"/></td>
                                        
                </tr>
                      <tr>
                    <td><form:label path="description">Description</form:label></td>
                    <td><form:input path="description"/></td>        
                </tr>
                      <tr>
                    <td><form:label path="addUser">Add User</form:label></td>
                    <td><form:input path="addUser"/></td>               
                </tr>
                     <tr>
                         <c:set var="now" value="${now}"/>
                      <td><form:input path="lastMod" readonly="true" type="hidden" value="${now}"/></td>  
                    </tr>
                     <tr>
                    <td><form:label path="creditLimit">Credit Limit</form:label></td>
                    <td><form:input path="creditLimit"/></td>
            
                </tr>
                     <tr>
                    <td><form:label path="email">Email</form:label></td>
                    <td><form:input path="email"/></td>          
                </tr>
                
                </tr>
                <tr>
                    <td><form:label path="latitude">Latitude</form:label></td>
                    <td><form:input path="latitude"/></td>       
                </tr>
                
                </tr>
                     <tr>
                    <td><form:label path="longitude">Longitude</form:label></td>
                    <td><form:input path="longitude"/></td>
                </tr>
                
                
                
               
                <tr>
                    <td><input type="submit" value="Submit!"/></td>
                </tr>
            </table>
        </form:form>
    
	
</html>