package com.rsc.service.impl;

import com.rsc.dataobject.mapper.Users;
import com.rsc.repository.UsersRepository;
import com.rsc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    UsersRepository usersRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users user = usersRepository.findByUsername(username);
        if (user == null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        list.add(new SimpleGrantedAuthority(user.getRole()));
        return new User(user.getUsername(),user.getUpassword(),list);
    }

    @Override
    public Users save(Users users) {
        users.setRole("ROLE_VIPUSER");
        Users users1 = usersRepository.save(users);
        return users1;
    }

    @Override
    public Users findByUsername(String username) {
        Users user = usersRepository.findByUsername(username);
        return user;
    }
}
