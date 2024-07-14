/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Motorbike;
import Models.Owner;
import Models.Provinces;
import Models.Registration;
import Models.Statuses;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class RegistrationDAO extends DBContext {

    public RegistrationDAO() {
        connectDB();
    }
    Connection cnn;// Kết nối DB
    PreparedStatement stm; // Thực hiện các câu lệnh sql
    ResultSet rs;

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Not success");
        }
    }

    public void insertRegistration(Registration registration) {
        try {
            String sql = "Insert into Registration([RegistrationDate],[Motorcycle_id])\n"
                    + "Values(?,?)";
            stm = cnn.prepareStatement(sql);
            stm.setDate(1, Date.valueOf(registration.getRegistration()));
            stm.setString(2, registration.getMotorcycleid());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Registration> selectAllRegiByID(String ownerid) {
        ArrayList<Registration> data = new ArrayList();
        try {
            String sql = "Select * from [dbo].[Motorbike] m join [dbo].[Registration] r on r.[Motorcycle_id] = m.[Motorcycle_id]\n"
                    + "Where m.[OwnerID]= ? order by RegistrationID ";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ownerid);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(6));
                String date = String.valueOf(rs.getDate(7));
                String motorcyle_id = rs.getString(8);
                String status_id = String.valueOf(rs.getInt(9));
                Registration r = new Registration(id, date, motorcyle_id, status_id);
                data.add(r);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Registration> selectAllRegi() {
        ArrayList<Registration> data = new ArrayList();
        try {
            String sql = "Select * from Registration";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String date = String.valueOf(rs.getDate(2));
                String motorcyle_id = rs.getString(3);
                String status_id = String.valueOf(rs.getInt(4));
                Registration r = new Registration(id, date, motorcyle_id, status_id);
                data.add(r);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Statuses> selectAllStatus() {
        ArrayList<Statuses> data = new ArrayList();
        try {
            String sql = "Select * from Statuses";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while(rs.next()){
                String status_id = String.valueOf((rs.getInt(1)));
                String status_name = rs.getString(2);
                Statuses statuses = new Statuses(status_id, status_name);
                data.add(statuses);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public void updateStatus(String status_id,String registrationID) {
        try {
            String sql = "Update Registration Set status_id= ? Where RegistrationID = ?";
            stm = cnn.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(status_id));
            stm.setInt(2, Integer.parseInt(registrationID));
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkRigiAgain(String motorcycleid) {
        try {
            String sql = "Select * from Registration where Motorcycle_id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, motorcycleid);
            rs = stm.executeQuery();
            while(rs.next()){
                if(rs.getInt(4) != -1){
                    return true;
                }
            }
            
        } catch (Exception e) {
        }
        return false;
    }

    public void deleteRegi(String motorcycleid) {
        try {
            String sql  = "Delete from Registration where  Motorcycle_id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, motorcycleid);
            stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void deleteMoTo(String motorcycleid) {
        try {
            String sql  = "Delete from Motorbike where Motorcycle_id = ?";
            stm = cnn.prepareStatement(sql);
             stm.setString(1, motorcycleid);
            stm.executeQuery();
        } catch (Exception e) {
        }
    }


}
