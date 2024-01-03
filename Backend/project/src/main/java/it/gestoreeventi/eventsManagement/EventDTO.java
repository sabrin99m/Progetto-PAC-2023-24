package it.gestoreeventi.eventsManagement;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EventDTO {
    private long idEvent;
    private String name;
    @CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern="dd-MM-yyyy HH:mm")
	private Date date;
    private Double lat;
    private Double lng;
    private Integer maxPeople;
    private String description;

    public EventDTO(){

    }

    public EventDTO(Event e){
        this.idEvent = e.getId();
        this.name = e.getName();
        this.date = e.getDate();
        this.lat = e.getLat();
        this.lng = e.getLng();
        this.maxPeople = e.getMaxPeople();
        this.description = e.getDescription();
    }

    public EventDTO(long idEvent, String name, Date date, Double lat, Double lng, Integer maxPeople,
            String description) {
        this.idEvent = idEvent;
        this.name = name;
        this.date = date;
        this.lat = lat;
        this.lng = lng;
        this.maxPeople = maxPeople;
        this.description = description;
    }

    public long getIdEvent() {
        return idEvent;
    }

    public void setIdEvent(long idEvent) {
        this.idEvent = idEvent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
