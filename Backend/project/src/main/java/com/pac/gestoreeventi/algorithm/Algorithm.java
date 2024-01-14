package com.pac.gestoreeventi.algorithm;

import com.pac.gestoreeventi.eventsManagement.Event;
import com.pac.gestoreeventi.eventsManagement.EventService;
import com.pac.gestoreeventi.profileManagement.Profile;
import com.pac.gestoreeventi.profileManagement.ProfileService;


import java.util.ArrayList;
import java.util.List;

public class Algorithm {

    private ProfileService profileService;

    private EventService eventService;

    public List<Profile> selezionaIscritti(List<Profile> listaIscritti, Event event) {
        List<Profile> S = new ArrayList<>();
        int limiteMax = event.getMaxPeople();

        if (listaIscritti.size() <= limiteMax) {
            //se il numero di iscritti è inferiore del numero di posti, vengono tutti confermati
            S.addAll(listaIscritti);
        } else {
            int livelloTarget = event.getDifficulty().getId();
            int i = 0;  // Numero di posti occupati
            int j = 0;  // Distanza dal livello target

            while ((i != limiteMax) && (!listaIscritti.isEmpty())) {
                Profile utenteConfermato = seleziona(listaIscritti, livelloTarget, j);
                listaIscritti.remove(utenteConfermato);
                S.add(utenteConfermato);
                i++;

                //se non ci sono altri iscritti di livello target +/- j e ci sono ancora posti liberi, si passa
                //a considerare gli iscritti con livello immediatamente inferiore o superiore
                boolean foundUser = false;
                for (Profile utente : listaIscritti) {
                    if (utente.getProfileLevel().getId() == livelloTarget + j || utente.getProfileLevel().getId() == livelloTarget - j) {
                        foundUser = true;
                    }
                }
                if (!foundUser) {
                    j++;
                }
            }
        }
        return S;
    }

    private Profile seleziona(List<Profile> listaIscritti, int livello, int distanza) {
        // Restituisce un utente con un livello pari a livello + distanza o livello - distanza
        for (Profile utente : listaIscritti) {
            if (utente.getProfileLevel().getId() == livello + distanza || utente.getProfileLevel().getId() == livello - distanza) {
                return utente;
            }
        }
        return null;
    }

}
