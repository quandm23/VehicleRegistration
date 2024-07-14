<%-- 
    Document   : dangnhap
    Created on : Mar 4, 2024, 7:40:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .required {
                color: red;
            }
            .er{
                color: red;
            }
        </style>
    </head>
    <body>
        <%
            String error_DangNhap = request.getAttribute("error_DangNhap")+"";
            error_DangNhap = (error_DangNhap.equals("null"))?"":error_DangNhap;
        %>
        <div class="container">
            <form action="dangnhap" method="Post">
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
                        <h2 style="text-align: center">Đăng Nhập</h2>
                    </div>

                    <div class="mb-3">
                        <div name="error_DangNhap" id="error_DangNhap" class="er"><%=error_DangNhap%></div>
                        <label for="username" class="form-label">Tên đăng nhập:<span class="required">*</span></label>
                        <input type="text" class="form-control" id="username" name="username" value="${username}" placeholder="Tên Đăng Nhập" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Mật Khẩu:<span class="required">*</span></label>
                        <input type="password" class="form-control" id="password" name="password" value="${password}" placeholder="Mật Khẩu" required>
                    </div>
                    <div class="checkbox mb-3">
                        <label> <input type="checkbox" value="remember-me">
                            Ghi nhớ tài khoản này
                        </label>
                    </div>
                    <input class="form-control" type="submit" style="background-color: lightblue" value="Đăng Nhập"/>
                    <h4 style="text-align: center"><a href="dangki" style="color: blue ;">Đăng Kí Tài Khoản</a></h4>
                </div>
            </form>
        </div>
    </body>
    <script>
        
    </script>
</html>
