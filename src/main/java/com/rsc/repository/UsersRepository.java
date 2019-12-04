package com.rsc.repository;

import com.rsc.dataobject.mapper.Users;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UsersRepository extends JpaRepository<Users,Integer> {
    Users findByUsername(String loginName);

}
