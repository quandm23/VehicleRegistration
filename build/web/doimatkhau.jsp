<%-- 
    Document   : doimatkhau
    Created on : Mar 2, 2024, 10:49:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi Mật Khẩu</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .required {
                color: red;
            }
        </style>
    </head>
    <body>
        <%
           String error_password = request.getAttribute("error_password")+"";
            error_password = (error_password.equals("null"))?"":error_password;
           Owner o = (Owner) session.getAttribute("o");
           if(o==null){
           request.getRequestDispatcher("dangnhap.jsp").forward(request, response);      
            }      
        %>
        <div class="container">
            <form id="frm" action="update"  method="Post" onsubmit="return checkmknew()">
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
                    <h2 style="text-align: center">Thay Đổi Mật Khẩu</h2>


                    <div class="mb-3">
                        <div class="required" name="error_password"><%=error_password%></div>
                        <label for="password" class="form-label">Mật Khẩu Hiện Tại:<span class="required">*</span></label>
                        <input type="password" class="form-control" id="password" name="password" value="${password}" placeholder="Mật Khẩu Hiện Tại" required>
                    </div>

                    <div class="mb-3">
                        <label for="passwordNew" class="form-label">Mật Khẩu Mới:<span class="required">*</span></label>
                        <input type="password" class="form-control" id="passwordNew" name="passwordNew" value="${passwordNew}" placeholder="Mật Khẩu Mới" required>
                    </div>

                    <div class="mb-3">
                        <label for="passwordNew2" class="form-label">Nhập Lại Mật Khẩu Mới:<span class="required">*</span></label>
                        <input type="password" class="form-control" id="passwordNew2" name="passwordNew2" value="${passwordNew2}" onkeyup="checkmknew()" placeholder="Nhập Lại Mật Khẩu Mới" required>
                        <div class="required" name="error_passwordNew2" id="error_passwordNew2"></div>
                    </div>
                    <input  class="form-control" type="submit" id="button_submit" name="mk"  value="Đổi Mật Khẩu" style="background: lightblue"/>
            </form>
        </div>

        <script>
            function checkmknew() {
                var passwordNew = document.getElementById("passwordNew").value;
                var passwordNew2 = document.getElementById("passwordNew2").value;
                if (passwordNew != passwordNew2) {
                    document.getElementById("error_passwordNew2").innerHTML = "Mật Khẩu chưa trùng";
                    return false;
                } else {
                    document.getElementById("error_passwordNew2").innerHTML = "";
                    return true;
                }
            }

        </script>
    </body>
</html>
