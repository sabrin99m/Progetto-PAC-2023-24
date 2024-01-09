package com.pac.gestoreeventi.profileManagement;

public class ProfileDTO {

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private ProfileRole profileRole;


    public ProfileDTO(ProfileDTO p){
        this.id = p.getId();
        this.firstName = p.getFirstName();
        this.lastName = p.getFirstName();
        this.email = p.getEmail();
        this.profileRole = p.getUserRole();
    }

    public ProfileDTO(long id, String firstName, String lastName, String email, ProfileRole profileRole){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.profileRole = profileRole;
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

    public void setUserRole(ProfileRole profileRole) {
        this.profileRole = profileRole;
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

    public ProfileRole getUserRole() {
        return profileRole;
    }
}
