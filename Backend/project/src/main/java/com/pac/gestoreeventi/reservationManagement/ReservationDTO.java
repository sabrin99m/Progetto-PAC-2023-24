package com.pac.gestoreeventi.reservationManagement;


import java.util.Date;

public class ReservationDTO {
    private Long idReservation;

    private Long idProfile;
    private Long idEvent;
    private Date datetime;
    private Boolean confirmation;

    public void setIdProfile(Long idProfile) {
        this.idProfile = idProfile;
    }

    public void setIdEvent(Long idEvent) {
        this.idEvent = idEvent;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public void setConfirmation(Boolean confirmation) {
        this.confirmation = confirmation;
    }

    public Long getIdReservation() {
        return idReservation;
    }

    public Long getIdProfile() {
        return idProfile;
    }

    public Long getIdEvent() {
        return idEvent;
    }

    public Date getDatetime() {
        return datetime;
    }

    public Boolean getConfirmation() {
        return confirmation;
    }
}
