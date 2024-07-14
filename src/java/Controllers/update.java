/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.OwnerDAO;
import Models.Owner;
import Models.Provinces;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class update extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet update</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet update at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OwnerDAO od = new OwnerDAO();
        ArrayList<Provinces> data = od.selectALLProvinces();
        Owner o = (Owner) request.getSession().getAttribute("o");
        request.setAttribute("o", o);
        request.setAttribute("data", data);
        request.getRequestDispatcher("thaydoithongtin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("mk") != null) {
            Owner o = (Owner) request.getSession().getAttribute("o");
            String password = request.getParameter("password");
            String passwordNew = request.getParameter("passwordNew");
            String passwordNew2 = request.getParameter("passwordNew2");
            String error_password = "";
            boolean check = false;
            if (!password.equals(o.getPassword())) {
                error_password += "Mật khẩu cũ sai<br/>";
                check = true;
            }else if (password.equals(passwordNew)) {
                error_password += "Mật Khẩu mới trùng với mật khẩu cũ";
                check = true;
            }
            if (check) {
                request.setAttribute("password", password);
                request.setAttribute("passwordNew", passwordNew);
                request.setAttribute("passwordNew2", passwordNew2);
                request.setAttribute("error_password", error_password);
                request.getRequestDispatcher("doimatkhau.jsp").forward(request, response);

            } else {
                OwnerDAO od = new OwnerDAO();
                od.updatepassword(passwordNew, o.getUsername());
                HttpSession session = request.getSession();
                o.setPassword(passwordNew);
                session.setAttribute("o", o);
                request.getRequestDispatcher("trangchu.jsp").forward(request, response);
            }
        } else if (request.getParameter("update") != null) {
            Owner o_row = (Owner) request.getSession().getAttribute("o");
            OwnerDAO od = new OwnerDAO();
            String ownername = request.getParameter("ownername");
            String ownerid = request.getParameter("ownerid");
            String provincename = request.getParameter("provincename");
            String gender = request.getParameter("gender");
            String birthdate = request.getParameter("birthdate");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");

            String error_phonenumber = "";
            String error_ownerid = "";
            String error_email = "";
            boolean error = false;

            Pattern regax_phonenumber = Pattern.compile("^0\\d{9}");
            Matcher mathMatcher_phonenumber = regax_phonenumber.matcher(phonenumber);
            if (!mathMatcher_phonenumber.matches()) {
                error_phonenumber = "Số điện thoại có 10 chữ số và bắt đầu bằng số 0";
                error = true;
            }

            Pattern regax_ownerid = Pattern.compile("^0\\d{11}");
            Matcher mathMatcher_ownerid = regax_ownerid.matcher(ownerid);
            if (!mathMatcher_ownerid.matches()) {
                error_ownerid = "Căn cước công dân có 12 chữ số và bắt đầu bằng số 0";
                error = true;
            } else if (!ownerid.equals(o_row.getOwnerid()) && od.checkOwnerID(ownerid)) {
                error_ownerid = "CCCD nhập đã tồn tại";
                error = true;
            }

            Pattern regax_email = Pattern.compile("\\w+@\\w+(\\.\\w+)+(\\.\\w)*");
            Matcher matcher_email = regax_email.matcher(email);
            if (!matcher_email.matches()) {
                error_email = "abc@abc.com.vn";
                error = true;
            }

            if (error) {
                ArrayList<Provinces> data = od.selectALLProvinces();
                request.setAttribute("data", data);
                request.setAttribute("error_phonenumber", error_phonenumber);
                request.setAttribute("error_ownerid", error_ownerid);
                request.setAttribute("error_email", error_email);
                request.getRequestDispatcher("thaydoithongtin.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                Owner o = new Owner(ownerid, o_row.getUsername(), o_row.getPassword(), ownername, phonenumber, email, provincename, "", birthdate, gender);
                od.update(o);
                Owner o_new = od.selectOwner(o.getUsername(), o.getPassword());
                session.setAttribute("o", o_new);
                request.getRequestDispatcher("trangchu.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
