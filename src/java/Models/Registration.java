/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Registration {
    String rgistrationid,registrationdate,motorcycleid,statusid;

    public Registration() {
    }

    public Registration(String rgistrationid, String registrationdate, String motorcycleid, String statusid) {
        this.rgistrationid = rgistrationid;
        this.registrationdate = registrationdate;
        this.motorcycleid = motorcycleid;
        this.statusid = statusid;
    }

    public String getRgistrationid() {
        return rgistrationid;
    }

    public void setRgistrationid(String rgistrationid) {
        this.rgistrationid = rgistrationid;
    }

    public String getRegistration() {
        return registrationdate;
    }

    public void setRegistration(String registration) {
        this.registrationdate = registration;
    }

    public String getMotorcycleid() {
        return motorcycleid;
    }

    public void setMotorcycleid(String motorcycleid) {
        this.motorcycleid = motorcycleid;
    }

    public String getStatusid() {
        return statusid;
    }

    public void setStatusid(String statusid) {
        this.statusid = statusid;
    }
    
}
