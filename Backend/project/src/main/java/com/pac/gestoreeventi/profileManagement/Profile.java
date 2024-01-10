package com.pac.gestoreeventi.profileManagement;

import javax.persistence.*;
import javax.persistence.Id;

@Table(name = "profile")
@Entity
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @Column
    private String email;

    @Column
    private String password;

    @Enumerated(EnumType.STRING)
    private ProfileRole profileRole;


    public Profile(){

    }
    public Profile(long id, String firstName, String lastName, String email, String password, ProfileRole profileRole){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.profileRole = profileRole;
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

    public void setPassword(String password) {
        this.password = password;
    }

    public void setProfileRole(ProfileRole profileRole) {
        this.profileRole = profileRole;
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

    public String getPassword() {
        return password;
    }

    public ProfileRole getProfileRole() {
        return profileRole;
    }

    public long getId() {
        return id;
    }
}
