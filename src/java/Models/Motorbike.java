/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Motorbike {
    String motorcycleid, licenseplate , type , color,ownerid;

    public Motorbike() {
    }

    public Motorbike(String motorcycleid, String licenseplate, String type, String color, String ownerid) {
        this.motorcycleid = motorcycleid;
        this.licenseplate = licenseplate;
        this.type = type;
        this.color = color;
        this.ownerid = ownerid;
    }

    public String getMotorcycleid() {
        return motorcycleid;
    }

    public void setMotorcycleid(String motorcycleid) {
        this.motorcycleid = motorcycleid;
    }

    public String getLicenseplate() {
        return licenseplate;
    }

    public void setLicenseplate(String licenseplate) {
        this.licenseplate = licenseplate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }


    public String getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(String ownerid) {
        this.ownerid = ownerid;
    }
    
    
}
