/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Motorbike;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class MotorbikeDAO extends DBContext {

    public MotorbikeDAO() {
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

    public boolean checkMotorcycleId(String motorcycleid) {
        try {
            String sql = "Select * from Motorbike where Motorcycle_id = ? ";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, motorcycleid);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void insert(Motorbike m) {
        try {
            String sql = "Insert into Motorbike([Motorcycle_id],[Type],[Color],[OwnerID])\n"
                    + "Values(?,?,?,?) ";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, m.getMotorcycleid());
            stm.setString(2, m.getType());
            stm.setString(3, m.getColor());
            stm.setString(4, m.getOwnerid());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Motorbike> selectAllMotoByID(String ownerid) {
         ArrayList<Motorbike> data = new ArrayList();
        try {
            String sql = "Select * from [dbo].[Motorbike] m join [dbo].[Registration] r on r.[Motorcycle_id] = m.[Motorcycle_id]\n"
                    + "Where m.[OwnerID]= ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ownerid);
            rs = stm.executeQuery();
            while (rs.next()) {
                String motorbikeid = rs.getString(1);
                String licenseolate = rs.getString(2);
                String type = rs.getString(3);
                String color = rs.getString(4);
                Motorbike m = new Motorbike(motorbikeid, licenseolate, type, color, ownerid);
                data.add(m);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Motorbike> selectAllMoto() {
         ArrayList<Motorbike> data = new ArrayList();
          try {
            String sql = "Select * from [dbo].[Motorbike]";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String motorbikeid = rs.getString(1);
                String licenseolate = rs.getString(2);
                String type = rs.getString(3);
                String color = rs.getString(4);
                String ownerid = rs.getString(5);
                Motorbike m = new Motorbike(motorbikeid, licenseolate, type, color, ownerid);
                data.add(m);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public void updateLicensePlate(String string , String id) {
        try {
            String sql = "Update Motorbike Set LicensePlate = ? where Motorcycle_id = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, string);
            stm.setString(2, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public String selectOwnerID(String parameter) {
        String ownerid= "";
        try {
            String sql = "Select OwnerID from Motorbike where Motorcycle_id = ? ";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, parameter);
            rs = stm.executeQuery();
            while(rs.next()){
                ownerid = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return ownerid;
    }

   
}
