package com.pac.gestoreeventi.profileManagement;

public interface ProfileManagementIF {
    /**
     * Funzione che restituisce tutti gli eventi a cui l'utente è iscritto.
     */
    public void get_signupEvents();

    /**
     * Funzione che restituisce tutti i dettagli del profilo.
     */
    public void get_profileDetails();

    /**
     * Funzione per l'iscrizione ad un evento.
     */
    public void insert_eventSignup();

    /**
     * Funzione per annullare l'iscrizione ad un evento.
     */
    public void delete_eventSignup();

}