package com.rsc.service.impl;

import com.rsc.View.*;
import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Logistics;
import com.rsc.dataobject.mapper.Postman;
import com.rsc.dataobject.mapper.workCondition;
import com.rsc.enums.ExpressEnum;
import com.rsc.repository.AddressRepository;
import com.rsc.repository.LogisticsRepository;
import com.rsc.repository.PostmanRepository;
import com.rsc.repository.workConditionRepository;
import com.rsc.service.AdminService;
import com.rsc.utils.SortUtil;
import com.rsc.utils.TimeUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    workConditionRepository workConditionRepository;

    @Autowired
    PostmanRepository postmanRepository;

    @Autowired
    AddressRepository addressRepository;

    @Autowired
    LogisticsRepository logisticsRepository;

    @Override
    public Address distributeOrder(Address address) {
        return null;
    }

    @Override
    public workCondition findMonthByPostmanId(Integer postmanId, Integer month) {
        workCondition workCondition = workConditionRepository.findMonthByPostmansId(postmanId,month);
        return workCondition;
    }

    @Override
    public List<workConditionView> findAllByMonthAndPostmanId(String town, Integer month) {
        List<Postman> postmanList = postmanRepository.findAllByEtown(town);
        List<workConditionView> workConditionViewList = new ArrayList<>();
        for (Postman postman:postmanList){
            workCondition workCondition = workConditionRepository.findMonthByPostmansId(postman.getId(),month);
            workConditionView workConditionView = new workConditionView();
            if (workCondition!=null){
                BeanUtils.copyProperties(workCondition,workConditionView);
                workConditionView.setEname(postman.getEname());
                workConditionViewList.add(workConditionView);
            }
        }
        return workConditionViewList;
    }

    @Override
    public Integer findMaxByMonthAndPostmanId(List<workConditionView> workConditionViewList) {
        int i=0;
        int postnumLen;
        int[] PostmanNumber = new int[workConditionViewList.size()];
        int[] PostmanId = new int[PostmanNumber.length+1];
        for (workConditionView workConditionView:workConditionViewList){
            PostmanNumber[i] = workConditionView.getReceipt()+workConditionView.getDeliver();
            i++;
        }
        SortUtil.findMinPostman(PostmanNumber,PostmanId);
        if (PostmanNumber.length == 0){
            postnumLen = 0;
        }else {
            postnumLen = PostmanNumber.length-1;
        }
        return PostmanNumber[postnumLen];
    }

    @Override
    public Integer findMinByMonthAndPostmanId(List<workConditionView> workConditionViewList) {
        int i=0;
        int[] PostmanNumber = new int[workConditionViewList.size()];
        int[] PostmanId = new int[PostmanNumber.length+1];
        for (workConditionView workConditionView:workConditionViewList){
            PostmanNumber[i] = workConditionView.getReceipt()+workConditionView.getDeliver();
            i++;
        }
        SortUtil.findMinPostman(PostmanNumber,PostmanId);
        return PostmanNumber[0];
    }

    @Override
    public PostmanView findBasesalary(Integer postmanId,Integer month) {
        Optional<Postman> postman = postmanRepository.findById(postmanId);
        workCondition workCondition = workConditionRepository.findMonthByPostmansId(postmanId,month);
        Double basesalary = postman.get().getBasesalary();
        Integer number = workCondition.getDeliver()+workCondition.getReceipt();
        Double total = basesalary + number * 10;
        PostmanView postmanView = new PostmanView();
        BeanUtils.copyProperties(postman.get(),postmanView);
        postmanView.setSumnumber(number);
        postmanView.setSumbasesalary(total);
        postmanView.setWorkday(workCondition.getWorkday());
        postmanView.setLeaveday(workCondition.getLeaveday());
        postmanView.setOvertimeday(workCondition.getOvertimeday());
        return postmanView;
    }

    @Override
    public List<MonthView> findSixMonth() {
        List<Map<String,Object>> monthViewListReceipt = addressRepository.findSixMonthReceipt();
        List<Map<String,Object>> monthViewListDeliver = addressRepository.findSixMonthDeliver();
        List<Map<String,Object>> monthViewListFault = addressRepository.findSixMonthFault();
        List<MonthView> monthViewList = new ArrayList<>();

        int ReceiptNumber = monthViewListReceipt.size();
        int DeliverNumber = monthViewListDeliver.size();
        int FaultNumber = monthViewListFault.size();
        int max;

        if (ReceiptNumber>=DeliverNumber&&ReceiptNumber>=FaultNumber){
            max = ReceiptNumber;

        }else if (DeliverNumber>=ReceiptNumber&&DeliverNumber>=FaultNumber){
            max = DeliverNumber;
        }else {
            max = FaultNumber;
        }

        for (int i = 0; i < max;i++){
            MonthView monthView = new MonthView();
            if (ReceiptNumber>=DeliverNumber&&ReceiptNumber>=FaultNumber){
                monthView.setMonth(Integer.parseInt(monthViewListReceipt.get(i).get("month").toString()));
            }else if (DeliverNumber>=ReceiptNumber&&DeliverNumber>=FaultNumber){
                monthView.setMonth(Integer.parseInt(monthViewListDeliver.get(i).get("month").toString()));
            }else {
                monthView.setMonth(Integer.parseInt(monthViewListFault.get(i).get("month").toString()));
            }
            for (int j = 0; j < monthViewListDeliver.size();j++){
                if (monthView.getMonth() == monthViewListReceipt.get(j).get("month")){
                    int month = Integer.parseInt(monthViewListReceipt.get(j).get("number").toString());
                    monthView.setReceiptnumber(month);
                }
            }
            for (int j = 0;j < monthViewListDeliver.size();j++){
                if (monthView.getMonth() == monthViewListDeliver.get(j).get("month")){
                    int month = Integer.parseInt(monthViewListDeliver.get(j).get("number").toString());
                    monthView.setDelivernumber(month);
                }
            }
            for (int j = 0;j < monthViewListFault.size();j++){
                if (monthView.getMonth() == monthViewListFault.get(j).get("month")){
                    int month = Integer.parseInt(monthViewListFault.get(j).get("number").toString());
                    monthView.setFaultnumber(month);
                }
            }
            monthViewList.add(monthView);
        }
        return monthViewList;
    }

    @Override
    public List<DayView> findAweek() {
        List<Map<String,Object>> DayViewListReceipt = addressRepository.findAweekReceipt();
        List<Map<String,Object>> DayViewListDeliver = addressRepository.findAweekDeliver();
        List<Map<String,Object>> DayViewListFault = addressRepository.findAweekFault();
        List<DayView> dayViewList = new ArrayList<>();

        int ReceiptNumber = DayViewListReceipt.size();
        int DeliverNumber = DayViewListDeliver.size();
        int FaultNumber = DayViewListFault.size();
        int max;

        if (ReceiptNumber>=DeliverNumber&&ReceiptNumber>=FaultNumber){
            max = ReceiptNumber;

        }else if (DeliverNumber>=ReceiptNumber&&DeliverNumber>=FaultNumber){
            max = DeliverNumber;
        }else {
            max = FaultNumber;
        }

        for (int i = 0; i < max;i++){
            DayView dayView = new DayView();
            if (ReceiptNumber>=DeliverNumber&&ReceiptNumber>=FaultNumber){
                dayView.setDay(Integer.parseInt(DayViewListReceipt.get(i).get("day").toString()));
            }else if (DeliverNumber>=ReceiptNumber&&DeliverNumber>=FaultNumber){
                dayView.setDay(Integer.parseInt(DayViewListDeliver.get(i).get("day").toString()));
            }else {
                dayView.setDay(Integer.parseInt(DayViewListFault.get(i).get("day").toString()));
            }

            for (int j = 0; j < DayViewListReceipt.size();j++){
                if (dayView.getDay() == DayViewListReceipt.get(j).get("day")){
                    int number = Integer.parseInt(DayViewListReceipt.get(j).get("number").toString());
                    dayView.setReceiptnumber(number);
                }
            }
            for (int j = 0;j < DayViewListDeliver.size();j++){
                if (dayView.getDay() == DayViewListDeliver.get(j).get("day")){
                    int number = Integer.parseInt(DayViewListDeliver.get(j).get("number").toString());
                    dayView.setDelivernumber(number);
                }
            }
            for (int j = 0;j < DayViewListFault.size();j++){
                if (dayView.getDay() == DayViewListFault.get(j).get("day")){
                    int number = Integer.parseInt(DayViewListFault.get(j).get("number").toString());
                    dayView.setFaultnumber(number);
                }
            }
            dayViewList.add(dayView);
        }
        return dayViewList;
    }

    @Override
    public List<PostmanView> findAllPostman(){
        List<Postman> postmanList = postmanRepository.findAll();
        List<PostmanView> postmanViewList = new ArrayList<>();
        for (Postman postman : postmanList){
            PostmanView postmanView = new PostmanView();
            BeanUtils.copyProperties(postman,postmanView);
            postmanViewList.add(postmanView);
        }
        return postmanViewList;
    }

    @Override
    public List<AddressView> findAddressAll(){
        List<AddressView> addressViewList = new ArrayList<>();
        List<Logistics> logisticsList = logisticsRepository.findAll();
        for (Logistics logistics:logisticsList){
            AddressView addressView = new AddressView();
            Optional<Address> saddress = addressRepository.findById(logistics.getSaddressId());
            if (saddress.get().getType() == ExpressEnum.PIE_PREPARE.getCode()){
                Optional<Address> gaddress = addressRepository.findById(logistics.getGaddressId());
                BeanUtils.copyProperties(gaddress.get(),addressView);
            }else {
                BeanUtils.copyProperties(saddress.get(),addressView);
            }
            addressView.setNo(logistics.getNo());
            addressViewList.add(addressView);
        }
        return addressViewList;
    }

    @Override
    public Integer findMonthworksByDate() {
        int month = TimeUtil.getMonth();
        List<Map<String, Object>> monthworksList = workConditionRepository.findMonthworksByDate(month);
        Integer monthsum = Integer.parseInt(monthworksList.get(0).get("rsum").toString()) + Integer.parseInt(monthworksList.get(0).get("dsum").toString());
        return monthsum;
    }

    @Override
    public List<workCondition> findMonthPostmansByDate() {
        int month = TimeUtil.getMonth();
        List<workCondition> monthPostmans = workConditionRepository.findMonthPostmansByDate(month);
        return monthPostmans;
    }

    @Override
    public PostmanSumView findMaxandminworker() {
        int month = TimeUtil.getMonth();
        String maxPost="",minPost="";
        int Max=0,Min=99999999;
        List<workCondition> monthPostmansList = workConditionRepository.findMonthPostmansByDate(month);
        for (workCondition monthPostman: monthPostmansList) {
            int sum = monthPostman.getDeliver() + monthPostman.getReceipt();
            if (sum > Max){
                maxPost = monthPostman.getPostmans().getEname();
                Max = sum;
            }
            if (sum < Min){
                minPost = monthPostman.getPostmans().getEname();
                Min = sum;
            }
        }
        PostmanSumView postmanSum = new PostmanSumView();
        postmanSum.setMaxpostname(maxPost);
        postmanSum.setMaxsum(Max);
        postmanSum.setMinpostname(minPost);
        postmanSum.setMinsum(Min);
        return postmanSum;
    }

}
