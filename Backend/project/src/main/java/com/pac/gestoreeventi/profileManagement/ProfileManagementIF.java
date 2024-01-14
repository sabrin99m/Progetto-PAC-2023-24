package com.pac.gestoreeventi.profileManagement;

import java.util.List;

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

    Profile getProfile(Integer idProfile);

	public ProfileDTO login(UserDetailsImpl profileInfo);

	public List<ProfileDTO> getProfiles();
	
    public ProfileDTO getProfile(int idProfile);
	
    public ProfileDTO addProfile(ProfileDTO profileDto);
	
    public ProfileDTO modifyProfile(ProfileDTO profileDto);
	
    public void deleteProfile(int idProfile);
}