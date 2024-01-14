package com.pac.gestoreeventi.profileManagement;

public enum ProfileLevel {
    uno(1), due(2), tre(3), quattro(4), cinque(5);

    private int id;

    ProfileLevel(int id){
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
