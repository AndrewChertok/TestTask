package com.project.service;


import com.project.model.User;

import java.util.List;

/**
 * Created by Andrey on 5/26/2017.
 */
public interface UserService {
    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(int id);
    public User getUserById(int id);
    public List<User> listUsers();
}
