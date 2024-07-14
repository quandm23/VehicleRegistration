<%-- 
    Document   : thaydoithongtin
    Created on : Mar 5, 2024, 10:23:13 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thay Đổi Thông Tin</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .required{
                color: red;
            }
            .er{
                color: red;
            }
        </style>
    </head>
    <body>
        <%
   String error_ownerid = request.getAttribute("error_ownerid")+ "";
   error_ownerid = (error_ownerid.equals("null"))?"":error_ownerid;
            
   String error_phonenumber = request.getAttribute("error_phonenumber")+"";
   error_phonenumber = (error_phonenumber.equals("null"))?"":error_phonenumber;
            
   String error_email = request.getAttribute("error_email")+"";
   error_email = (error_email.equals("null"))?"":error_email;
   Owner o = (Owner) session.getAttribute("o");
           if(o==null){
           request.getRequestDispatcher("dangnhap.jsp").forward(request, response);      
            }  
        %>
        <div class="container">
            <form action="update" method="Post">
                <!-- Nvarbar -->
                <div class="container">
                    <nav class="navbar navbar-expand-lg bg-body-tertiary">
                        <div class="container">
                            <a href="trangchu.jsp"><img src="img/logo.png" alt="alt" width="600px"/></a>
                        </div>
                    </nav> 

                    <nav class="navbar bg-body-tertiary">
                        <div class="container">
                            <a class="navbar-brand" href="trangchu.jsp">HOME</a>
                            <a class="navbar-brand" href="gioithieu.jsp">Giới Thiệu</a>
                            <a class="navbar-brand" href="cacbuocthuchien.jsp">Các Bước Thực Hiện</a>
                            <%if(o.getRole().equals("0")){%>
                            <a class="navbar-brand" href="nophoso">Nộp Hồ Sơ</a>
                            <%}%>
                            <a class="navbar-brand" href="yeucau">Yêu  cầu đăng kí</a>
                        </div>
                    </nav>
                    <br/>
                    <!--End Nvarbar -->

                    <div>
                        <h3 style="text-align: center">Thông Tin Khách Hàng</h3>
                        <div class="mb-3">
                            <label for="ownername" class="form-label">Họ Và Tên:</label>
                            <input type="text" class="form-control" id="ownername" name="ownername"  value="${o.getOwnername()}" required>
                        </div>

                        <div class="mb-3">
                            <label for="ownerid" class="form-label">Số CMND:</label>
                            <input type="text" class="form-control" id="ownerid" name="ownerid"  value="${o.getOwnerid()}" required>
                            <div class="er" name="error_ownerid" id="error_ownerid"><%=error_ownerid%></div>
                        </div>
                        <div class="mb-3">Địa chỉ:
                            <select class="form-control" name="provincename">
                                <c:forEach items="${data}" var="r">
                                    <c:choose>
                                        <c:when test="${r.getProvincecode()== o.getProvinceCode()}">
                                            <option value="${r.getProvincecode()}" selected>${r. getProvincename()}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${r. getProvincecode()}">${r. getProvincename()}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select></div>

                        <div class="mb-3">
                            <label for="gender" class="form-label">Giới tính:</label>
                            <input class="form-check-input" type="radio" name="gender" value="nam" ${o.getGender()=='nam'?'checked':''}/>NAM
                            <input class="form-check-input" type="radio" name="gender" value="nu" ${o.getGender()=='nu'?'checked':''}/>Nữ
                        </div>

                        <div class="mb-3">
                            <label for="birthdate" class="form-label">Ngày Sinh</label>
                            <input type="date" class="form-control" id="birthdate" name="birthdate"  value="${o.getBirthdate()}">
                        </div>
                        <div class="mb-3">
                            <label for="phonenumber" class="form-label">Số Điện Thoại</label>
                            <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${o. getPhonenumber()}" required>
                            <div class="er" name="error_phonenumber" id="error_phonenumber"><%=error_phonenumber%></div>

                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="abc@gmail.com" value="${o.getEmail()}">
                            <div class="er" name="error_email" id="error_email"><%=error_email%></div>
                        </div>
                    </div>
                    <input  class="form-control" type="submit" id="button_submit" name="update"  value="Thay Đổi Thông Tin Khách Hàng" style="background: lightblue"/>
            </form>
        </div>
    </body>
</html>
