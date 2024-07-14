<%-- 
    Document   : yeucau
    Created on : Mar 7, 2024, 10:35:11 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Owner" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yêu Cầu</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%
           Owner o = (Owner) session.getAttribute("o");
           if(o==null){
           request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
        %>
        <div class="container">
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

                <table class="table">
                    <tr>
                        <td><h4>Yêu Cầu</h4></td>
                        <td><h4>Ngày Đăng Kí</h4></td>
                        <td><h4>CCCD</h4></td>
                        <td><h4>Họ Tên</h4></td>
                        <td><h4>Mã xe</h4></td>
                        <td><h4>Biển</h4></td>
                        <td><h4>Loại xe</h4></td>
                        <td><h4>Màu</h4></td>
                        <td><h4>Trạng Thái</h4></td>
                        <%if(o.getRole().equals("1")){%>
                        <td><h4>Phê Duyệt</h4></td>
                        <%}else{%>
                        <td><h4>Lý do Huỷ</h4></td>
                        <%}%>
                    </tr>
                    <c:forEach items="${data}" var="r">
                        <c:set var="found" value="false"/>
                        <tr>
                            <td>${r.getRgistrationid()}</td>
                            <td>${r.getRegistration()}</td>
                            <c:forEach items="${list2}" var="m">
                                    <c:if test="${r.getMotorcycleid().equals(m.getMotorcycleid()) and !found}">
                                        <c:set var="found" value="true"/>
                                        <td>${m.getOwnerid()}</td>
                                        <c:forEach items="${list3}" var="o_new">
                                            <c:if test="${m.getOwnerid().equals(o_new.getOwnerid())}">
                                                <td>${o_new.getOwnername()}</td>
                                            </c:if>
                                        </c:forEach>
                                        <td>${m. getMotorcycleid()}</td>
                                        <td>${m. getLicenseplate()}</td>
                                        <td>${m. getType()}</td>
                                        <td>${m. getColor()}</td>
                                    </c:if>
                            </c:forEach>
                            <c:forEach items="${list}" var="s">
                                <c:if test="${s.getStatusid().equals(r.getStatusid())}">
                                    <td>${s. getStatusname()}</td>
                                </c:if>
                            </c:forEach>
                            <%if(o.getRole().equals("0")){%>
                            <c:if test="${r.getStatusid() eq -1}">
                                <td>Thiếu tiền</td>
                            </c:if>
                            <%}%>
                            <td>
                                <%if(o.getRole().equals("1")){%>
                                <c:if test="${r.getStatusid() eq 0}">
                                    <a href="yeucau?huy&id=${r. getRgistrationid()}&id_m=${r.getMotorcycleid()}&error='Thiếu tiền'">
                                        <input class="btn btn-danger" type="submit" value="Huỷ"/>
                                    </a>

                                    <a href="yeucau?duyet&id=${r. getRgistrationid()}&id_m=${r.getMotorcycleid()}">
                                        <input class="btn btn-primary" type="submit" value="Duyệt"/></a>
                                    </c:if>
                                    <%}%>


                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <form>
                    </body>
                    </html>
