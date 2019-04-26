<%--
  Created by IntelliJ IDEA.
  User: mbrond
  Date: 2019-04-26
  Time: 10:29
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:each in="${res}" var="agency">
    <li id="${agency.id}" onclick="callAjax2(this.id)">
    <a href="#"> ID: ${agency.id} -
            Distance: ${agency.distance} -
            ID: ${agency.id_agency} -
            Payment Method: ${agency.payment_method_id} -
            Site id: ${agency.site_id}
        </a></li>
</g:each>




</body>
</html>