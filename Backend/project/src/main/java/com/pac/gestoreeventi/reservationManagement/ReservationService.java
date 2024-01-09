package com.pac.gestoreeventi.reservationManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService implements ReservationManagementIF{

    @Autowired
    private ReservationRepository reservationRepository;

}
