<%-- 
    Document   : gioithieu
    Created on : Mar 5, 2024, 9:11:18 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giới Thiệu</title>
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
        <div class="container">
            <!-- Nvarbar -->
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
            <!-- End Nvarbar -->    
            <hr/>
            <h1>Cách thức thực hiện</h1><br/>
            <table class="table-result-tthc table-result">  
                <tr>
                    <th>Hình thức nộp</th>
                    <th>Thời hạn giải quyết</th>
                    <th>Phí, lệ phí</th>
                    <th>Mô tả</th>
                </tr>

                <tr>
                    <td>Trực tiếp</td>
                    <td >02 Ngày làm việc</td>
                    <td >Phí: Xem chi tiết</td>
                    <td >+ Trực tiếp tại trụ sở trụ sở Phòng Cảnh sát giao thông Công an tỉnh, thành phố trực thuộc Trung ương hoặc các điểm đăng ký xe của Phòng. Thời gian: Từ thứ 2 đến thứ 7 (theo quy định của Thủ tướng Chính phủ). <br> <br>Thời hạn giải quyết: Cấp ngay biển số sau khi tiếp nhận hồ sơ đăng ký xe hợp lệ; cấp giấy chứng nhận đăng ký xe thì thời hạn hoàn thành thủ tục không quá 2 ngày làm việc, kể từ ngày nhận đủ hồ sơ hợp lệ. <br> <br>Cấp ngay biển số sau khi tiếp nhận hồ sơ đăng ký xe hợp lệ; cấp giấy chứng nhận đăng ký xe thì thời hạn hoàn thành thủ tục không quá 2 ngày làm việc, kể từ ngày nhận hồ sơ hợp lệ.</td>
                </tr>
                <tr>
                    <td>Trực tiếp</td>
                    <td >02 Ngày làm việc</td>
                    <td >Phí: Xem chi tiết</td>
                    <td>+ Nộp Giấy khai đăng ký xe điện tử trên Cổng Dịch vụ công quốc gia hoặc Cổng dịch vụ công Bộ Công an.</td>
                </tr>
                <tr>
                    <td>Trực tiếp</td>
                    <td >02 Ngày làm việc</td>
                    <td >Phí: Xem chi tiết</td>
                    <td>+ Trả kết quả qua dịch vụ bưu chính.</td>
                </tr>
            </table> 


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
