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
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class dangki extends HttpServlet {

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
            out.println("<title>Servlet dangki</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dangki at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        OwnerDAO od = new OwnerDAO();
        ArrayList<Provinces> data = od.selectALLProvinces();
        request.setAttribute("data", data);

        if (request.getParameter("dangki") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String ownername = request.getParameter("ownername");
            String ownerid = request.getParameter("ownerid");
            String provincename = request.getParameter("provincename");
            String gender = request.getParameter("gender");
            String birthdate = request.getParameter("birthdate");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");

            String error_username = "";
            String error_ownerid = "";
            String error_email = "";
            boolean check1 = od.checkUserNameOwner(username);
            boolean error = false;
            if (check1) {
                error_username = "Tên đăng nhập tồn tại";
                error = true;
            }

            if (od.checkOwnerID(ownerid)) {
                error_ownerid = "CCCD nhập đã tồn tại";
                error = true;
            }

            //                                          \\w+@\\w+(\\.\\w+)+(\\.\\w+)*
            Pattern regax_email = Pattern.compile("\\w+@\\w+(\\.\\w+)+(\\.\\w)*");
            Matcher matcher_email = regax_email.matcher(email);
            if (!matcher_email.matches()) {
                error_email = "abc@abc.com.vn";
                error = true;
            }
            if (error) {
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.setAttribute("ownername", ownername);
                request.setAttribute("ownerid", ownerid);
                request.setAttribute("provincename", provincename);
                request.setAttribute("gender", gender);
                request.setAttribute("birthdate", birthdate);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("email", email);
                request.setAttribute("error_username", error_username);
                request.setAttribute("error_ownerid", error_ownerid);
                request.setAttribute("error_email", error_email);
                request.getRequestDispatcher("dangki.jsp").forward(request, response);
            } else {
                Owner o = new Owner(ownerid, username, password, ownername, phonenumber, email, provincename, "", birthdate, gender);
                od.insert(o);
                new SendMail().send(email, "Đây là mail đăng kí của hoà", "Hoà chăm chỉ:))");
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
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
