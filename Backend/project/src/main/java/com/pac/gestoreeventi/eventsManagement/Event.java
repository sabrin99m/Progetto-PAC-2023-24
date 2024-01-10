package com.pac.gestoreeventi.eventsManagement;


import javax.persistence.*;
import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;


@Table(name = "event")
@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column
    private String name;
    
    @Column
    @CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern="dd-MM-yyyy")
	private Date date;
    
    @Column
    private Double lat;

    @Column
    private Double lng;
    
    @Column
    private Integer maxPeople;

    @Column
    private String description;

    public Event() {
    }

    public Event(long id, String name, Date date, Double lat, Double lng, Integer maxPeople, String description) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.lat = lat;
        this.lng = lng;
        this.maxPeople = maxPeople;
        this.description = description;
    }

    public long getId() {
        return id;
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
