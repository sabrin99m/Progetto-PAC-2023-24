package com.pac.gestoreeventi.profileManagement;


import java.util.List;

import javax.validation.Valid;

import com.pac.gestoreeventi.reservationManagement.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProfileController {

    private ProfileManagementIF profileService;

    @Autowired
    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    @GetMapping(path = "/login")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public ProfileDTO login() {
		return profileService.login(
				(UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
	}

	@GetMapping(path = "/profiles")
	public List<ProfileDTO> getProfiles() {
		return profileService.getProfiles();
	}

	@GetMapping(path = "/profiles/{idProfile}")
	public ProfileDTO getProfile(@PathVariable Integer idProfile) {
		return profileService.getProfileDTO(idProfile);
	}

	@DeleteMapping(path = "/profiles/{idProfile}")
	public void deleteProfile(@PathVariable Integer idProfile) {
		profileService.deleteProfile(idProfile);
	}

	@PutMapping(path = "/profiles")
	public ProfileDTO modifyProfile(@Valid @RequestBody ProfileDTO profileDto) {
		return profileService.modifyProfile(profileDto);
	}

	@PostMapping(path = "/profiles")
	@ResponseStatus(HttpStatus.CREATED)
	public ProfileDTO addProfile(@Valid @RequestBody ProfileDTO profileDto) {
		return profileService.addProfile(profileDto);
	}

	@GetMapping(path ="profiles/{idProfile}/reservations")
	public List<Reservation> getReservations(@PathVariable Integer idProfile){
		return profileService.profileReservations(idProfile);
	}

	@GetMapping(path = "/profiles/level/{idProfile}")
	public Integer getProfileLevel(@PathVariable Integer idProfile) {
		return profileService.profileLevel(idProfile);
	}
}
