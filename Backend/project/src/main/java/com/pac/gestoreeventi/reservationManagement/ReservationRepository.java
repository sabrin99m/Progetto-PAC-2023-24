package com.pac.gestoreeventi.reservationManagement;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation,Long> {
    List<Reservation> findByEventId(Long idEvent);
    List<Reservation> findByProfileId(Long idProfile);
}
