package it.project.eventsManagement;

public interface EventsManagementIF {
    /**
	* Funzione che restituisce tutti gli eventi.
	*/
	public void get_events();

	/**
	* Funzione che restituisce tutti gli eventi consigliati.
	*/
	public void get_reccomendedEvents();

	/**
	* Funzione che restituisce tutti i dettagli dell'evento.
	*/
	public void get_eventDetails();

	/**
	* Funzione che restituisce tutti i dettagli dell'evento.
	*/
	public void get_eventWeather();

    /**
	* Funzione per l'inserimento di un nuovo evento.
	*/
	public void insert_event();
}
