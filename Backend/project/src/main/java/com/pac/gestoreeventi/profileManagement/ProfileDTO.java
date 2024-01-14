package com.pac.gestoreeventi.profileManagement;

import java.util.ArrayList;
import java.util.List;

import com.pac.gestoreeventi.eventsManagement.Event;
import com.pac.gestoreeventi.reservationManagement.Reservation;

public class ProfileDTO {

    private int id;
    private String firstName;
    private String lastName;
    private ProfileLevel profileLevel;
    private String email;
    private String phone;
    private String password;
    private ProfileRole profileRole;
    private List<Event> events = new ArrayList<>();
    private List<Reservation> reservations = new ArrayList<>();

    public ProfileDTO(String firstName, String lastName, ProfileLevel profileLevel, String email, String phone,
            String password, ProfileRole profileRole, List<Event> events, List<Reservation> reservations) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.profileLevel = profileLevel;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.profileRole = profileRole;
        this.events = events;
        this.reservations = reservations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public ProfileLevel getProfileLevel() {
        return profileLevel;
    }

    public void setProfileLevel(ProfileLevel profileLevel) {
        this.profileLevel = profileLevel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public ProfileRole getProfileRole() {
        return profileRole;
    }
    
    public void setProfileRole(ProfileRole profileRole) {
        this.profileRole = profileRole;
    }
    
    public List<Event> getEvents() {
        return events;
    }
    
    public void setEvents(List<Event> events) {
        this.events = events;
    }
    
    public List<Reservation> getReservations() {
        return reservations;
    }
    
    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }
   
}
