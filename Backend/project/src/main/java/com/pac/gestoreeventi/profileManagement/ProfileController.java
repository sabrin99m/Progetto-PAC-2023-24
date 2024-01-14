package com.pac.gestoreeventi.profileManagement;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProfileController {

    private ProfileManagementIF profileService;

    @Autowired
    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    @GetMapping(path = "/login")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Profile login() {
		return profileService.login(
				(UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
	}

	@GetMapping(path = "/profiles")
	public List<ProfileDTO> getProfiles() {
		return profileService.getProfiles();
	}

	@GetMapping(path = "/profiles/{idProfile}")
	public ProfileDTO getProfile(@PathVariable Integer idProfile) {
		return profileService.getProfile(idProfile);
	}

	@DeleteMapping(path = "/profiles/{idProfile}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void deleteProfile(@PathVariable Integer idProfile) {
		profileService.deleteProfile(idProfile);
	}

	@PutMapping(path = "/profiles")
	public ProfileDTO modifyProfile(@RequestBody ProfileDTO profileDto) {
		return profileService.modifyProfile(profileDto);
	}

	@PostMapping(path = "/profiles")
	@ResponseStatus(HttpStatus.CREATED)
	public ProfileDTO addProfile(@RequestBody ProfileDTO profileDto) {
		return profileService.addProfile(profileDto);
	}
}
