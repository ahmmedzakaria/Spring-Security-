package com.javaknowledge.springmvcsecurityhibernate.service;

import com.javaknowledge.springmvcsecurityhibernate.model.UserProfile;
import java.util.List;

public interface UserProfileService {

    UserProfile findById(int id);

    UserProfile findByType(String type);

    List<UserProfile> findAll();

}
