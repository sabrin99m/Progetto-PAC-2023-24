package com.pac.gestoreeventi.eventsManagement;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventService implements EventsManagementIF{

    @Autowired
	private EventRepository eventRepository;

	@Autowired
	private ModelMapper modelMapper;

    @Override
    public List<EventDTO> getEvents() {
        return eventRepository.findAll().stream()
        .map(event -> modelMapper.map(event, EventDTO.class)).collect(Collectors.toList());
    }

    @Override
    public void getReccomendedEvents() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get_reccomendedEvents'");
    }

    @Override
    public void getEventDetails() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get_eventDetails'");
    }

    @Override
    public void getEventWeather() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get_eventWeather'");
    }

    @Override
    public void insertEvent() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'insert_event'");
    }
    
}
