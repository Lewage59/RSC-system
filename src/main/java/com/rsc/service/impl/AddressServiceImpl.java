package com.rsc.service.impl;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Users;
import com.rsc.repository.AddressRepository;
import com.rsc.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressRepository addressRepository;

    @Transactional
    @Override
    public Address createAddress(Address address, Users users) {
        Users user = new Users();
        user.setId(users.getId());
        address.setUsers(user);
        address.setCreateTime(new Date());
        addressRepository.save(address);
        return address;
    }
}
