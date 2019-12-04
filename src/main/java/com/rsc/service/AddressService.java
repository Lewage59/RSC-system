package com.rsc.service;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Users;

public interface AddressService {
    Address createAddress(Address address, Users users);
}
