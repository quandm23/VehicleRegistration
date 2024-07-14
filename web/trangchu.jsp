<%-- 
    Document   : trangchu
    Created on : Mar 4, 2024, 9:07:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Chủ</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .align-right{
                float: right;
            }
            .ml-30{
                margin-left: 30px;
            }
        </style>
    </head>
    <body>
        <!-- Nvarbar -->
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container">
                    <a href="trangchu.jsp"><img src="img/logo.png" alt="alt" width="600px"/></a>
                    <div style="text-align: end">
                        <% Owner o = (Owner) session.getAttribute("o");
                        if(o==null){
                        %>
                        <a class="btn btn-primary" style="margin-left: 5px" href="dangki">Đăng Kí</a>
                        <a class="btn btn-primary" style="margin-left: 5px" href="dangnhap.jsp">Đăng Nhập</a>
                        <%}else{%>
                        <div class="dropdown">
                            <button  type="button" style="border-radius: 30% ;border: 0" data-bs-toggle="dropdown" >
                                <img src="img//anhdaidien.webp" style="width: 70px" />
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item"><b><%=o.getOwnername()%></b></a></li>
                                <hr/>
                                <li><a class="dropdown-item" href="update">Thay Đổi Thông Tin</a></li>
                                <li><a class="dropdown-item" href="changeAvatar">Thay Đổi Avartar</a></li>
                                <li><a class="dropdown-item" href="doimatkhau.jsp">Thay Đổi Mật Khẩu</a></li>
                                <hr/>
                                <li><a class="dropdown-item" href="dangnhap">Đăng Xuất</a></li>
                            </ul>
                        </div>
                        <%}%>
                    </div>
                </div>
            </nav> 

            <nav class="navbar bg-body-tertiary">
                <div class="container">
                    <a class="navbar-brand" href="trangchu.jsp">HOME</a>
                    <a class="navbar-brand" href="gioithieu.jsp">Giới Thiệu</a>
                    <a class="navbar-brand" href="cacbuocthuchien.jsp">Các Bước Thực Hiện</a>
                    <%if( o == null || o.getRole().equals("0")){%>
                    <a class="navbar-brand" href="nophoso">Nộp Hồ Sơ</a>
                    <%}%>
                    <a class="navbar-brand" href="yeucau">Yêu  cầu đăng kí</a>
                </div>
            </nav>
            <br/>
            <h3><b>Đăng ký, cấp biển số xe mô tô, xe gắn máy (kể cả xe máy điện) lần đầu tại Công an cấp xã được phân cấp đăng ký xe</b></h3>
            <%if(o == null || o.getRole().equals("0")){%>
            <button class="btn btn-primary align-right"><a href="nophoso" style="color: white;font-size: 20px">Nộp Hồ Sơ</a></button><br/><br/><hr/>
            <%}%>
            <h4><b>Lĩnh vực</b></h4>
            <div>Đăng ký, Quản lý phương tiện giao thông</div><hr/>

            <h4><b>Cơ quan thực hiện</b></h4>
            <div>Bộ công an</div><hr/>

            <h4><b>Mức độ cung cấp dịch vụ công trực tuyến</b></h4>
            <div>Dịch vụ công trực tuyến </div><hr/>

            <h4><b>Cách thức thực hiện</b></h4>
            <div>Đăng ký và cấp biển số xe trực tuyến</div><hr/>
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/1.jpg" width="400px" height="600px" class="d-block w-100" alt="WebSite">
                    </div>
                    <div class="carousel-item">
                        <img src="img/2.png" width="400px" height="600px" class="d-block w-100"    height="250px"  alt="WebSite">
                    </div>
                    <div class="carousel-item">
                        <img src="img/3.jpg.webp"  width="400px" height="600px" class="d-block w-100" alt="WebSite">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Footer -->
            <footer class="py-3 my-4">
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="trangchu.jsp"
                                            class="nav-link px-2 text-muted">HOME</a></li>
                    <li class="nav-item"><a href="gioithieu.jsp"
                                            class="nav-link px-2 text-muted">Giới Thiệu</a></li>
                    <li class="nav-item"><a href="cacbuocthuchien.jsp"
                                            class="nav-link px-2 text-muted">Các Bước Thực Hiện</a></li>
                </ul>
                <h3 style="text-align: center">Liên hệ:</h3>
                <ul  class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item ml-30 " >Cơ quan chủ quản: Văn phòng Chính phủ</li>
                    <li class="nav-item ml-30 " >www.dichvucong.gov.vn</li>
                    <li class="nav-item ml-30 " >Tổng đài hỗ trợ: 18001096</li>
                    <li class="nav-item ml-30 ">Email: dichvucong@chinhphu.vn</li>
                </ul>
            </footer>
            <!-- End footer -->
        </div>

    </body>
</html>
