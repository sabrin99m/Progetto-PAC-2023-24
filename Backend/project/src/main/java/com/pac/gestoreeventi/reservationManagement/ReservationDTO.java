package com.pac.gestoreeventi.reservationManagement;

import javax.sound.midi.MidiDevice;
import java.util.Date;

public class ReservationDTO {
    private Long idReservation;
    private Long idProfile;
    private Long idEvent;
    private Date datetime;
    private Boolean confirmation;

    public ReservationDTO(Long idReservation,Long idProfile,Long idEvent, Date datetime,Boolean confirmation){
        this.idReservation = idReservation;
        this.idProfile = idProfile;
        this.idEvent = idEvent;
        this.datetime = datetime;
        this.confirmation = confirmation;
    }

    public ReservationDTO(Reservation r){
        this.idReservation = r.getId();
        this.idProfile = r.getProfile().getId();
        this.idEvent = r.getEvent().getId();
        this.datetime = r.getDatetime();
        this.confirmation = r.getConfirmation();

    }

    public ReservationDTO(){

    }

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
