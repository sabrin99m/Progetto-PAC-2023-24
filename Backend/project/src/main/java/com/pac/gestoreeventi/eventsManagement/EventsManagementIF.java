package com.pac.gestoreeventi.eventsManagement;

import java.util.List;

public interface EventsManagementIF {
    /**
	* Funzione che restituisce tutti gli eventi.
	*/
	public List<EventDTO> getEvents();

	/**
	* Funzione che restituisce tutti gli eventi consigliati.
	*/
	public void getReccomendedEvents();

	/**
	* Funzione che restituisce tutti i dettagli dell'evento.
	*/
	public void getEventDetails();

	/**
	* Funzione che restituisce tutti i dettagli dell'evento.
	*/
	public void getEventWeather();

    /**
	* Funzione per l'inserimento di un nuovo evento.
	*/
	public void insertEvent(EventDTO eventDTO);

}
