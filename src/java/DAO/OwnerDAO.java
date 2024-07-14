/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Owner;
import Models.Provinces;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Random;
import java.sql.Types;

/**
 *
 * @author Admin
 */
public class OwnerDAO extends DBContext {

    public OwnerDAO() {
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

    public ArrayList<Provinces> selectALLProvinces() {
        ArrayList<Provinces> data = new ArrayList<>();
        try {
            String sql = "Select * from Provinces";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String provincecode = String.valueOf(rs.getInt(1));
                String provincename = rs.getString(2);
                Provinces p = new Provinces(provincecode, provincename);
                data.add(p);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Owner> selectAllIDName() {
        ArrayList<Owner> data = new ArrayList<>();
        try {
            String sql = "Select * from Owner";
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(4);
                Owner o = new Owner();
                o.setOwnerid(id);
                o.setOwnername(name);
                data.add(o);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public boolean checkOwnerID(String ownerid) {
        try {
            String sql = "Select * from Owner where ownerid = ? ";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ownerid);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void insert(Owner o) {
        try {
            String sql = "Insert into Owner(ownerid,username,password,ownername,phonenumber,email,provincecode,birthdate,gender)\n"
                    + "Values (?,?,?,?,?,?,?,?,?)";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, o.getOwnerid());
            stm.setString(2, o.getUsername());
            stm.setString(3, o.getPassword());
            stm.setString(4, o.getOwnername());
            stm.setString(5, o.getPhonenumber());
            stm.setString(6, o.getEmail());
            stm.setInt(7, Integer.parseInt(o.getProvinceCode()));
            stm.setDate(8, Date.valueOf(o.getBirthdate()));
            stm.setBoolean(9, ((o.getGender().equals("nam")) ? true : false));
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Owner selectOwner(String username, String password) {
        Owner o = null;
        try {
            String sql = "Select * from Owner where  username = ? and password = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                String ownerid = rs.getString(1);
                String ownername = rs.getString(4);
                String phonenumber = rs.getString(5);
                String email = rs.getString(6);
                String provincecode = String.valueOf(rs.getInt(7));
                String role = String.valueOf(rs.getString(8));
                String birthdate = String.valueOf(rs.getDate(9));
                String gender = rs.getBoolean(10) == true ? "nam" : "nu";
                o = new Owner(ownerid, username, password, ownername, phonenumber, email, provincecode, role, birthdate, gender);
            }
        } catch (Exception e) {
        }
        return o;
    }

    public void updatepassword(String passwordNew, String usename) {
        try {
            String sql = "Update Owner Set password = ? where username = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, passwordNew);
            stm.setString(2, usename);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void update(Owner o) {
        try {
            String sql = "update [dbo].[Owner] Set [ownerid] = ? , [ownername] = ?,[phonenumber] = ?,[email]=?,[provincecode] = ?,[birthdate] = ?,[gender]=?\n"
                    + "where [username] = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, o.getOwnerid());
            stm.setString(2, o.getOwnername());
            stm.setString(3, o.getPhonenumber());
            stm.setString(4, o.getEmail());
            stm.setInt(5, Integer.parseInt(o.getProvinceCode()));
            stm.setDate(6, Date.valueOf(o.getBirthdate()));
            stm.setBoolean(7, o.getGender().equals("nam") ? true : false);
            stm.setString(8, o.getUsername());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkUserNameOwner(String username) {
        try {
            String sql = "select * from Owner where username = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String selectProvin(String ownerid) {
        String pro = "";
        try {
            String sql = "select ProvinceCode from Owner where OwnerID = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ownerid);
            rs = stm.executeQuery();
            while (rs.next()) {
                pro = String.valueOf(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return pro;

    }

    public String randomLicensePlate() {
        Random random = new Random();
        String raw = "";
        for (int i = 0; i < 5; i++) {
            int number = random.nextInt(10);
            raw += String.valueOf(number);
        }
        return raw;
    }
    
     public String selectimage(String ownerid) {
        String image = "";
        try {
            String sql = "select image from Owner where OwnerID = ?";
            stm = cnn.prepareStatement(sql);
            stm.setString(1, ownerid);
            rs = stm.executeQuery();
            while (rs.next()) {
                image = String.valueOf(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return image;

    }
}


