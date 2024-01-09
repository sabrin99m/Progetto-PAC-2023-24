package com.pac.gestoreeventi.profileManagement;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileService implements ProfileManagementIF{


    @Autowired
    private ProfileRepository profileRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public void get_signupEvents() {

    }

    @Override
    public void get_profileDetails() {

    }

    @Override
    public void insert_eventSignup() {

    }

    @Override
    public void delete_eventSignup() {

    }
}
