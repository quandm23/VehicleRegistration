/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Owner {

    String ownerid, username, password, ownername, phonenumber, email, provinceCode,role, birthdate,gender, avartar;

    public Owner() {
    }

    public Owner(String ownerid, String username, String password, String ownername, String phonenumber, String email, String provinceCode, String role, String birthdate, String gender) {
        this.ownerid = ownerid;
        this.username = username;
        this.password = password;
        this.ownername = ownername;
        this.phonenumber = phonenumber;
        this.email = email;
        this.provinceCode = provinceCode;
        this.role = role;
        this.birthdate = birthdate;
        this.gender = gender;
    }

    public String getAvartar() {
        return avartar;
    }

    public void setAvartar(String avartar) {
        this.avartar = avartar;
    }

    public Owner(String ownerid, String username, String password, String ownername, String phonenumber, String email, String provinceCode, String role, String birthdate, String gender, String avartar) {
        this.ownerid = ownerid;
        this.username = username;
        this.password = password;
        this.ownername = ownername;
        this.phonenumber = phonenumber;
        this.email = email;
        this.provinceCode = provinceCode;
        this.role = role;
        this.birthdate = birthdate;
        this.gender = gender;
        this.avartar = avartar;
    }
    

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

   

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(String ownerid) {
        this.ownerid = ownerid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOwnername() {
        return ownername;
    }

    public void setOwnername(String ownername) {
        this.ownername = ownername;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

}
