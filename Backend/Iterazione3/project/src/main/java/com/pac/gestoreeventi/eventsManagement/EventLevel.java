package com.pac.gestoreeventi.eventsManagement;

public enum EventLevel {
    EASY(10), MEDIUM(20), HARD(30);

    private int id;
    private EventLevel(int id){
        this.id = id;
    }

    public int getLevel(){
        return id;
    }
}
