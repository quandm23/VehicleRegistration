<%-- 
    Document   : cacbuocthuchien
    Created on : Mar 5, 2024, 9:02:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Các Bước Thực Hiện</title>
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
            <h1>Đăng ký, cấp biển số xe lần đầu</h1>
            <h2>Trình tự thực hiện</h2>
            <div>
                <p>Bước 1: Chủ xe đăng nhập cổng dịch vụ công kê khai các thông tin vào Giấy khai đăng ký xe điện tử (theo mẫu số 01A/58) và nhận mã số thứ tự, lịch hẹn giải quyết hồ sơ qua địa chỉ thư điện tử hoặc qua tin nhắn điện thoại để làm thủ tục đăng ký xe tại cơ quan đăng ký xe. <br>
                    Bước 2: Đến Phòng Cảnh sát giao thông và cán bộ đăng ký xe tiếp nhận và nhập mã hồ sơ đăng ký trực tuyến của chủ xe trên hệ thống đăng ký, quản lý xe để kiểm tra thông tin khai báo đăng ký trực tuyến của chủ xe; in Giấy khai đăng ký xe điện tử trên hệ thống. <br>Trực tiếp nộp hồ sơ đăng ký xe tại cơ quan đăng ký xe thì khai giấy khai đăng ký xe (mẫu 01) theo quy định. <br>
                    Bước 3: Hướng dẫn chủ xe ký và ghi rõ họ tên vào Giấy khai đăng ký xe và dán bản chà số máy, số khung của xe vào Giấy khai đăng ký xe điện tử. <br>
                    Bước 4: Kiểm tra thông tin của chủ xe: <br>Nhập số căn cước công dân, họ tên của chủ xe (đối với cá nhân), đổ dữ liệu căn cước công dân truyền sang cơ sở dữ liệu đăng ký xe; kiểm tra, đối chiếu thông tin cá nhân của chủ xe: tên, địa chỉ chủ xe với nội dung thông tin về căn cước công dân trong Giấy khai đăng ký xe điện tử với giấy tờ của xe. <br>Kiểm tra, đối chiếu giấy tờ của người đến làm thủ tục đăng ký xe (đối với cơ quan, tổ chức). <br>
                    Bước 5: Hóa đơn điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, nhập mã xác thực hóa đơn điện tử ghi tại Giấy khai đăng ký xe điện tử để kiểm tra thông tin hóa đơn điện tử, in hóa đơn điện tử và kiểm tra, đối chiếu thông tin, nội dung hóa đơn điện tử: Doanh nghiệp bán xe, địa chỉ, người mua xe và đặc điểm, thông số của xe với hồ sơ xe. Trường hợp chưa kết nối, chia sẻ dữ liệu hóa đơn điện tử thì yêu cầu chủ xe nộp hóa đơn bán xe theo quy định. <br> 
                    Bước 6: Chứng từ lệ phí trước bạ điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, tìm kiếm mã hồ sơ lệ phí trước bạ điện tử ghi tại Giấy khai đăng ký xe điện tử; tải và in dữ liệu điện tử lệ phí trước bạ và kiểm tra, đối chiếu nội dung hoàn thành nghĩa vụ nộp lệ phí trước bạ điện tử: thông tin của chủ xe (tên, địa chỉ), thông tin của xe (nhãn hiệu, số loại, số máy, số khung, loại xe), biển số xe (nếu có), giá trị tài sản tính lệ phí trước bạ, số tiền lệ phí trước bạ, ngày nộp lệ phí trước bạ với hồ sơ xe. <br>
                    Bước 7: Chứng từ nguồn gốc điện tử: <br>Truy cập hệ thống đăng ký, quản lý xe, tìm kiếm chứng từ nguồn gốc của xe ghi tại Giấy khai đăng ký xe điện tử, tải và in dữ liệu điện tử về chứng từ nguồn gốc của xe. Kiểm tra, đối chiếu nội dung thông tin dữ liệu tờ khai hải quan điện tử, thông tin dữ liệu xe sản xuất lắp ráp trong nước với nội dung ghi tại Giấy khai đăng ký xe điện tử và hồ sơ xe. <br>
                    Bước 8: Trường hợp hồ sơ không đảm bảo thủ tục theo quy định, thông tin dữ liệu điện tử không đầy đủ, không đúng so với hồ sơ xe hoặc không có thông tin dữ liệu điện tử: cán bộ đăng ký phải hướng dẫn cụ thể, đầy đủ một lần và ghi nội dung bổ sung vào Phiếu hướng dẫn bổ sung thủ tục đăng ký xe; ký, ghi rõ họ tên và chịu trách nhiệm về hướng dẫn đó. <br>
                    Bước 9: <br>a) Trực tiếp đối chiếu nội dung trong giấy khai đăng ký xe với thực tế xe, gồm: Nhãn hiệu, loại xe, số máy, số khung, màu sơn, số chỗ ngồi, số chỗ đứng, số chỗ nằm, năm sản xuất, tải trọng và các thông số kỹ thuật khác; kiểm tra toàn bộ, chi tiết hình dáng kích thước, tổng thành khung, tổng thành máy của xe; <br>Trường hợp cơ quan Hải quan xác nhận xe chỉ có số VIN, không có số máy, số khung thì lấy số VIN thay thế cho số khung (chụp ảnh số VIN thay thế cho bản chà số khung), đóng số máy theo biển số. <br>
                    Bước 10: Nhập thông tin chủ xe, thông tin xe vào hệ thống đăng ký, quản lý xe; cập nhật trạng thái: xe tạm nhập tái xuất, xe miễn thuế, xe được cơ quan đăng ký giải quyết đóng lại số khung, số máy (nếu có), xe thế chấp ngân hàng. <br>
                    Bước 11: Hướng dẫn chủ xe kiểm tra thông tin: Chủ xe và xe, cấp biển số ngẫu nhiên trên hệ thống đăng ký, quản lý xe theo quy định; ghi biển số vào giấy khai đăng ký xe. <br>
                    Bước 12: Cấp giấy hẹn cho chủ xe; trường hợp chủ xe có yêu cầu chuyển chứng nhận đăng ký xe qua Bưu điện thì hướng dẫn chủ xe làm thủ tục đăng ký sử dụng dịch vụ chuyển phát chứng nhận đăng ký xe. <br>
                    Bước 13: Thu lệ phí đăng ký xe theo quy định. <br>
                    Bước 14: Trả biển số xe (hướng dẫn chủ xe lắp biển số vào vị trí theo thiết kế của xe); trường hợp xe ô tô chỉ lắp được 2 biển số dài hoặc 1 biển ngắn và 1 biển dài thì cho đổi biển số xe, kinh phí chủ xe chi trả theo quy định. <br>Bước 15: Hướng dẫn chủ xe kẻ, ghi biển số, khối lượng chuyên chở, khối lượng bản thân, tên chủ xe đối với các loại xe ô tô theo quy định.</p>
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
