package com.rsc.service.impl;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Logistics;
import com.rsc.dataobject.mapper.Postman;
import com.rsc.dataobject.mapper.workCondition;
import com.rsc.enums.ExpressEnum;
import com.rsc.repository.*;
import com.rsc.service.DistributionService;
import com.rsc.service.PostmanService;
import com.rsc.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PostmanServiceImpl implements PostmanService {

    @Autowired
    workConditionRepository workConditionRepository;

    @Autowired
    AddressRepository addressRepository;

    @Autowired
    LogisticsRepository logisticsRepository;

    @Autowired
    PostmanRepository postmanRepository;

    @Autowired
    UsersRepository usersRepository;
	
	@Autowired
    DistributionService distributionService;

    @Transactional
    @Override
    public Postman receiptFinish(Integer no) {

        //1,查询到订单号对应的收件订单修改状态
        Logistics logistics = logisticsRepository.findByNo(no);
        Optional<Address> Gaddress = addressRepository.findById(logistics.getGaddressId());
        Gaddress.get().setType(ExpressEnum.RECEIPT_SUCCESS.getCode());
        Gaddress.get().setFinallyTime(new Date());
        addressRepository.save(Gaddress.get());

        //2，修改寄件订单的状态，并分配邮递员寄件
        Optional<Address> Saddress = addressRepository.findById(logistics.getSaddressId());
        Saddress.get().setType(ExpressEnum.PIE_SENDING.getCode());
        Postman Spostman = distributionService.DistributionSystem(Saddress.get().getTown());
        Saddress.get().setApostman(Spostman);
        addressRepository.save(Saddress.get());

        //3，给邮差收件数量加1
        workCondition workCondition = workConditionRepository.findByPostmanId(Gaddress.get().getApostman().getId(),TimeUtil.getMonth());
        Integer number = workCondition.getReceipt()+1;
        workCondition.setReceipt(number);
        workConditionRepository.save(workCondition);

        return Spostman;
    }

    @Transactional
    @Override
    public Postman pieFinish(Integer no) {
        //1,修改订单状态
        Logistics logistics = logisticsRepository.findByNo(no);
        Optional<Address> Saddress = addressRepository.findById(logistics.getSaddressId());
        Saddress.get().setType(ExpressEnum.PIE_SUCCESS.getCode());
        Saddress.get().setFinallyTime(new Date());
        addressRepository.save(Saddress.get());

        //2，给邮差派件数量加1
        Postman postman = Saddress.get().getApostman();
        workCondition workCondition = workConditionRepository.findByPostmanId(postman.getId(),TimeUtil.getMonth());
        workCondition.setDeliver(workCondition.getDeliver()+1);
        workConditionRepository.save(workCondition);
        return postman;
    }

    @Override
    public Postman findById(Integer id) {
        Optional<Postman> postman = postmanRepository.findById(id);
        return postman.get();
    }

    @Override
    public List<Address> findReceiptByPostmanid(String postmanName) {
        Postman postman = postmanRepository.findByEname(postmanName);
        List<Address> addressList = addressRepository.findGAddressByPostmanId(postman.getId());
        List<Address> addressListNo = new ArrayList<>();
        for (Address address:addressList){
            Integer no = logisticsRepository.Gno(address.getId());
            address.setNo(no);
            addressListNo.add(address);
        }
        return addressListNo;
    }

    @Override
    public List<Address> findPieByPostmanid(String postmanName) {
        Postman postman = postmanRepository.findByEname(postmanName);
        List<Address> addressList = addressRepository.findSAddressByPostmanId(postman.getId());
        List<Address> addressListNo = new ArrayList<>();
        for (Address address:addressList){
            Integer no = logisticsRepository.Sno(address.getId());
            address.setNo(no);
            addressListNo.add(address);
        }
        return addressList;
    }

    @Transactional
    @Override
    public Postman receiptFault(Integer no) {
        //1,修改订单状态
        Logistics logistics = logisticsRepository.findByNo(no);
        Optional<Address> Gaddress = addressRepository.findById(logistics.getGaddressId());
        Gaddress.get().setType(ExpressEnum.RECEIPT_FAIL.getCode());
        Gaddress.get().setFinallyTime(new Date());
        addressRepository.save(Gaddress.get());
        Optional<Address> Saddress = addressRepository.findById(logistics.getSaddressId());
        Saddress.get().setType(ExpressEnum.PIE_PREPARE.getCode());
        Saddress.get().setFinallyTime(new Date());

        addressRepository.save(Gaddress.get());
        addressRepository.save(Saddress.get());
        Postman postman = Gaddress.get().getApostman();
        return postman;
    }

    @Transactional
    @Override
    public Postman pieFault(Integer no) {
        //1,修改订单状态
        Logistics logistics = logisticsRepository.findByNo(no);
        Optional<Address> Saddress = addressRepository.findById(logistics.getSaddressId());
        Saddress.get().setType(ExpressEnum.PIE_FAIL.getCode());
        Saddress.get().setFinallyTime(new Date());
        addressRepository.save(Saddress.get());

        Postman postman = Saddress.get().getApostman();
        return postman;
    }

    @Override
    public Integer findpostmanStateById(int id) {
        Integer postmanState = postmanRepository.findpostmanStateById(id);
        return postmanState;
    }

    @Override
    public void changepostmanStateById(int id,int state) {
        int month = TimeUtil.getMonth();
        Optional<Postman> postman = postmanRepository.findById(id);
        workCondition workCondition = workConditionRepository.findByPostmanId(id,month);
        if (state == 0){
            workCondition.setWorkday(workCondition.getWorkday() + 1);
        }
        postman.get().setState(state);
        postmanRepository.save(postman.get());
    }
}
