package com.pac.gestoreeventi.profileManagement;

public interface ProfileManagementIF {
    /**
     * Funzione che restituisce tutti gli eventi a cui l'utente è iscritto.
     */
    public void getSignupEvents();

    /**
     * Funzione che restituisce tutti i dettagli del profilo.
     */
    public void getProfileDetails();

    /**
     * Funzione per l'iscrizione ad un evento.
     */
    public void insertEventSignup();

    /**
     * Funzione per annullare l'iscrizione ad un evento.
     */
    public void deleteEventSignup();

}