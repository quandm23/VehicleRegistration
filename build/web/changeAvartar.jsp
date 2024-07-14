<%-- 
    Document   : changeAvartar
    Created on : May 18, 2024, 10:50:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avatar</title>
    </head>
    <body>
        <%
            Owner o = (Owner)session.getAttribute("o");
            if(o == null){
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
        %>
        <form action="changeAvartar" method="Post" enctype="multipart/form-data">
            <%
                String image = request.getAttribute("url")+"";
            image = (image.equals("null"))?"":image;
            if(image.equals("")){
            %>
            <img src="img/anhdaidien.webp" alt="Ảnh đại diện" style="width: 100px; height: auto;object-fit: contain"/>
            <%
                }else{
            %>
            <img src="./img/avartar/${image}" alt="Ảnh đại diện" style="width: 100px; height: auto;object-fit: contain"/>
            <%}%>
        <input type="file" name="inputfile" id="inputfile"/>
        <button>Change</button>
        </form>
       
    </body>
</html>
