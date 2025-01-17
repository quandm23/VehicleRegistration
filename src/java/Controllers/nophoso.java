/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.MotorbikeDAO;
import DAO.OwnerDAO;
import DAO.RegistrationDAO;
import Models.Motorbike;
import Models.Owner;
import Models.Provinces;
import Models.Registration;
import Models.Statuses;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class nophoso extends HttpServlet {

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
            out.println("<title>Servlet nophoso</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet nophoso at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("data", data);
        request.getRequestDispatcher("nophoso.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Owner o = (Owner) session.getAttribute("o");
        String motorcycleid = request.getParameter("motorcycleid");
        String type = request.getParameter("type");
        String color = request.getParameter("color");

        MotorbikeDAO md = new MotorbikeDAO();
        RegistrationDAO rd = new RegistrationDAO();
        boolean check = rd.checkRigiAgain(motorcycleid);
        boolean error = false;
        boolean again = false;
        String error_motorcycleid = "";
        if (md.checkMotorcycleId(motorcycleid)) {
            if (check) {
                error_motorcycleid = "Mã số xe đã tồn tại";
                error = true;
            } else {
                again = true;
            }
        }

        if (error) {
            request.setAttribute("motorcycleid", motorcycleid);
            request.setAttribute("type", type);
            request.setAttribute("color", color);
            request.setAttribute("error_motorcycleid", error_motorcycleid);
            ArrayList<Provinces> data = od.selectALLProvinces();
            request.setAttribute("data", data);
            request.getRequestDispatcher("nophoso.jsp").forward(request, response);
        } else {
            if (!again) {
                Motorbike m = new Motorbike(motorcycleid, "", type, color, o.getOwnerid());
                md.insert(m);
            }
            Date rigistrationdate = new Date(System.currentTimeMillis());
            Registration registration = new Registration("", String.valueOf(rigistrationdate), motorcycleid, "");
            rd.insertRegistration(registration);

            // chuyeenr data sang yeucau.jsp
            ArrayList<Registration> data;
            ArrayList<Motorbike> list2;
            if (o.getRole().equals("0")) {
                data = rd.selectAllRegiByID(o.getOwnerid());
                list2 = md.selectAllMotoByID(o.getOwnerid());
            } else {
                data = rd.selectAllRegi();
                list2 = md.selectAllMoto();
            }
            ArrayList<Owner> list3 = od.selectAllIDName();
            request.setAttribute("data", data);
            ArrayList<Statuses> list = rd.selectAllStatus();
            request.setAttribute("list", list);
            request.setAttribute("list2", list2);
            request.setAttribute("list3", list3);
            request.getRequestDispatcher("yeucau.jsp").forward(request, response);
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
