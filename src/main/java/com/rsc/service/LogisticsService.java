package com.rsc.service;

import com.rsc.dataobject.mapper.Logistics;

public interface LogisticsService {
    Logistics submit(Integer userId,Integer saddressId,Integer gaddressId);
}
