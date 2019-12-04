package com.rsc.service.impl;

import com.rsc.dataobject.mapper.Postman;
import com.rsc.dataobject.mapper.workCondition;
import com.rsc.repository.PostmanRepository;
import com.rsc.repository.workConditionRepository;
import com.rsc.service.DistributionService;
import com.rsc.utils.SortUtil;
import com.rsc.utils.TimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class DistributionServiceImpl implements DistributionService {

    @Autowired
    PostmanRepository postmanRepository;

    @Autowired
    workConditionRepository workConditionRepository;

    @Override
    public Postman DistributionSystem(String town) {
        int i=0,j=0;
        int month = TimeUtil.getMonth();
        List<Postman> postmanList = postmanRepository.findByEtown(town);
        int[] PostmanNumber = new int[postmanList.size()];
        int[] PostmanId = new int[PostmanNumber.length+1];
        for (Postman postman:postmanList){
            workCondition workCondition = workConditionRepository.findByPostmanId(postman.getId(),month);
            PostmanId[i] = postman.getId();
            PostmanNumber[i] = workCondition.getReceipt()+workCondition.getDeliver();
            i++;
        }
        SortUtil.findMinPostman(PostmanNumber,PostmanId);
        Optional<Postman> postman = postmanRepository.findById(PostmanId[0]);
        return postman.get();
    }

}
