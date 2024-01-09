package com.pac.gestoreeventi.profileManagement;

import javax.persistence.*;

public class ProfileDTO {

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private UserRole userRole;


    public ProfileDTO(ProfileDTO p){
        this.id = p.getId();
        this.firstName = p.getFirstName();
        this.lastName = p.getFirstName();
        this.email = p.getEmail();
        this.userRole = p.getUserRole();
    }

    public ProfileDTO(long id,String firstName,String lastName,String email,UserRole userRole){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userRole = userRole;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    public long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public UserRole getUserRole() {
        return userRole;
    }
}
