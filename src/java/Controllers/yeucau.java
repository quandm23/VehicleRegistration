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
import Models.Registration;
import Models.Statuses;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Admin
 */
public class yeucau extends HttpServlet {

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
            out.println("<title>Servlet yeucau</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet yeucau at " + request.getContextPath() + "</h1>");
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
        Owner o = (Owner) request.getSession().getAttribute("o");
        if (o == null) {
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        }
        RegistrationDAO rd = new RegistrationDAO();
        OwnerDAO od = new OwnerDAO();
        MotorbikeDAO md = new MotorbikeDAO();
        ArrayList<Registration> data;
        ArrayList<Motorbike> list2;
        if (request.getParameter("huy") != null) {
            rd.updateStatus("-1", request.getParameter("id"));
            md.updateLicensePlate("Huỷ Bỏ", request.getParameter("id_m"));
        }else if(request.getParameter("duyet")!= null){
            rd.updateStatus("1", request.getParameter("id"));
            String ownerid = md.selectOwnerID(request.getParameter("id_m"));
            String provinces = od.selectProvin(ownerid);
            String row =  od.randomLicensePlate();
            String LicensePlate = provinces + "-AA" + row;
            md.updateLicensePlate(LicensePlate, request.getParameter("id_m"));
        }
        ArrayList<Owner> list3 = od.selectAllIDName();
        ArrayList<Statuses> list = rd.selectAllStatus();
        if (o.getRole().equals("0")) {
            data = rd.selectAllRegiByID(o.getOwnerid());
            list2 = md.selectAllMotoByID(o.getOwnerid());
        } else {
            data = rd.selectAllRegi();
            list2 = md.selectAllMoto();
        }
        request.setAttribute("data", data);
        request.setAttribute("list", list);
        request.setAttribute("list2", list2);
        request.setAttribute("list3", list3);
        request.getRequestDispatcher("yeucau.jsp").forward(request, response);
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
        doGet(request, response);
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
