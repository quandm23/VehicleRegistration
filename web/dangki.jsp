<%-- 
    Document   : dangki
    Created on : Mar 4, 2024, 10:37:28 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
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
    String error_username = request.getAttribute("error_username")+ "";
    error_username = (error_username.equals("null"))?"":error_username;
    
    String error_ownerid = request.getAttribute("error_ownerid")+ "";
    error_ownerid = (error_ownerid.equals("null"))?"":error_ownerid;
            
    String error_phonenumber = request.getAttribute("error_phonenumber")+"";
    error_phonenumber = (error_phonenumber.equals("null"))?"":error_phonenumber;
            
    String error_email = request.getAttribute("error_email")+"";
    error_email = (error_email.equals("null"))?"":error_email;
        %>
        <div class="container">
            <form action="dangki" method="Post">
                <div class="row">
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
                                <a class="navbar-brand" href="nophoso">Nộp Hồ Sơ</a>
                            </div>
                        </nav>
                        <br/>
                        <!--End Nvarbar -->
                        <h2 style="text-align: center">Đăng Kí Tài Khoản</h2>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h3>Tải Khoản</h3>
                            <div class="mb-3">
                                <label for="username" class="form-label">Tên đăng nhập:<span class="required">*</span></label>
                                <input type="text" class="form-control" id="username" name="username" value="${username}" required>
                                <div class="er" name="error_username" id="error_username"><%=error_username%></div>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Mật Khẩu:<span class="required">*</span></label>
                                <input type="password" class="form-control" id="password" name="password" value="${password}" required>
                            </div>
                        </div>



                        <div class="col">
                            <h3>Thông Tin Khách Hàng</h3>
                            <div class="mb-3">
                                <label for="ownername" class="form-label">Họ Và Tên:<span class="required">*</span></label>
                                <input type="text" class="form-control" id="ownername" name="ownername"  value="${ownername}" required>
                            </div>

                            <div class="mb-3">
                                <label for="ownerid" class="form-label">Số CMND:<span class="required">*</span></label>
                                <input type="text" class="form-control" id="ownerid" name="ownerid"  value="${ownerid}" required>
                                <div class="er" name="error_ownerid" id="error_ownerid"><%=error_ownerid%></div>
                            </div>
                            <div class="mb-3">Địa chỉ:<span class="required">*</span>
                                <select class="form-control" name="provincename">
                                    <c:forEach items="${data}" var="r">
                                        <c:choose>
                                            <c:when test="${r.getProvincecode()== provincename}">
                                                <option value="${r.getProvincecode()}" selected>${r. getProvincename()}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${r. getProvincecode()}">${r. getProvincename()}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select></div>

                            <div class="mb-3">
                                <label for="gender" class="form-label">Giới tính:<span class="required">*</span></label>
                                <input class="form-check-input" type="radio" name="gender" value="nam" ${gender=='nam'?'checked':''} required/>NAM
                                <input class="form-check-input" type="radio" name="gender" value="nu" ${gender=='nu'?'checked':''} required/>Nữ
                            </div>

                            <div class="mb-3">
                                <label for="birthdate" class="form-label">Ngày Sinh<span class="required">*</span></label>
                                <input type="date" class="form-control" id="birthdate" name="birthdate"  value="${birthdate}" required >
                            </div>
                            <div class="mb-3">
                                <label for="phonenumber" class="form-label">Số Điện Thoại <span class="required">*</span></label>
                                <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${phonenumber}" required>
                                <div class="er" name="error_phonenumber" id="error_phonenumber"><%=error_phonenumber%></div>

                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email<span class="required">*</span></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="abc@gmail.com" value="${email}" required>
                                <div class="er" name="error_email" id="error_email"><%=error_email%></div>
                            </div>

                        </div>
                    </div>

                    <input class="form-control" style="background: lightblue" type="submit" name="dangki" value="Đăng Kí"/>
                </div>

            </form>
        </div>
    </body>
</html>
