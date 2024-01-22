package com.pac.gestoreeventi.eventsManagement;

import com.pac.gestoreeventi.profileManagement.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface EventRepository extends JpaRepository<Event, Integer> {
    Optional<Event> findById(Integer id);
    List<Event> findByProfile(Integer IdProfile);
}