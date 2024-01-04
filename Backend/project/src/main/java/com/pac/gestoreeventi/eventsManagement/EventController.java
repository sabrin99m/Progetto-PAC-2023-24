package com.pac.gestoreeventi.eventsManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventController {
    private EventsManagementIF eventService;
    
    @Autowired
	public EventController(EventService eventService) {
		this.eventService = eventService;
	}

    @GetMapping(path = "/events")
	public List<EventDTO> getEvents() {
		return eventService.getEvents();
	}
}
