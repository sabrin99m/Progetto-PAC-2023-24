package com.pac.gestoreeventi.profileManagement;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProfileRepository extends JpaRepository<Profile,Long> {
    Optional<Profile> findById(Long id);
    Optional<Profile> findByEmail(String email);
}
