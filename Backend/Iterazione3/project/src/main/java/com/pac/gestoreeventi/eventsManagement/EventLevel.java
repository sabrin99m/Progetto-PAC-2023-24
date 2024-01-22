package com.pac.gestoreeventi.eventsManagement;

public enum EventLevel {
    EASY(1), MEDIUM(2), HARD(3);

    private int id;
    private EventLevel(int id){
        this.id = id;
    }

    public int getLevel(){
        return id;
    }
}
