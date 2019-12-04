package com.rsc.service;

import com.rsc.dataobject.mapper.Users;

public interface UserService {
    Users save(Users users);
    Users findByUsername(String username);
}
