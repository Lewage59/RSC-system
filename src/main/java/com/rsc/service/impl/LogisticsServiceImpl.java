package com.rsc.service.impl;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Logistics;
import com.rsc.dataobject.mapper.Postman;
import com.rsc.dataobject.mapper.workCondition;
import com.rsc.repository.AddressRepository;
import com.rsc.repository.LogisticsRepository;
import com.rsc.repository.PostmanRepository;
import com.rsc.repository.workConditionRepository;
import com.rsc.service.DistributionService;
import com.rsc.service.LogisticsService;
import com.rsc.utils.KeyUtil;
import com.rsc.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class LogisticsServiceImpl implements LogisticsService {

    @Autowired
    LogisticsRepository logisticsRepository;

    @Autowired
    workConditionRepository workConditionRepository;

    @Autowired
    AddressRepository addressRepository;

    @Autowired
    PostmanRepository postmanRepository;

    @Autowired
    DistributionService distributionService;

    @Transactional
    @Override
    public Logistics submit(Integer userId,Integer saddressId,Integer gaddressId) {
        Logistics logistics = new Logistics();
        logistics.setUserId(userId);
        logistics.setGaddressId(gaddressId);
        logistics.setSaddressId(saddressId);
        logistics.setNo(KeyUtil.genUniqueKey());
        Logistics logistics1 = logisticsRepository.save(logistics);

        //1,收件子系统自动分配
        Optional<Address> address;
        address = addressRepository.findById(gaddressId);

        List<Postman> postmanList = postmanRepository.findByEtown(address.get().getTown());
        Integer month = TimeUtil.getMonth();
        Postman postman2 = new Postman();
        postman2.setId(0);
        for (Postman postman1:postmanList){
            workCondition workCondition = workConditionRepository.findMonthByPostmansId(postman1.getId(),month);
            if (workCondition == null){
                postman2.setId(postman1.getId());
            }
        }
        if (postman2.getId() == 0){
            Postman postman = distributionService.DistributionSystem(address.get().getTown());
            address.get().setApostman(postman);
            addressRepository.save(address.get());
        }else {
            workCondition workCondition = new workCondition();
            workCondition.setPostmans(postman2);
            workCondition.setDeliver(0);
            workCondition.setWorkday(1);
            workCondition.setLeaveday(0);
            workCondition.setOvertimeday(0);
            workCondition.setReceipt(1);
            workCondition.setDate(new Date());
            workConditionRepository.save(workCondition);
            address.get().setApostman(postman2);
            addressRepository.save(address.get());
        }
        return logistics1;
    }
}
