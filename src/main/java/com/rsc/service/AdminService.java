package com.rsc.service;

import com.rsc.View.*;
import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.workCondition;

import java.util.List;

public interface AdminService {
    Address distributeOrder(Address address);

    workCondition findMonthByPostmanId(Integer postmanId, Integer month);

    List<workConditionView> findAllByMonthAndPostmanId(String town, Integer month);

    Integer findMaxByMonthAndPostmanId(List<workConditionView> workConditionViewList);

    Integer findMinByMonthAndPostmanId(List<workConditionView> workConditionViewList);

    PostmanView findBasesalary(Integer postmanId,Integer month);

    List<MonthView> findSixMonth();

    List<DayView> findAweek();

    List<PostmanView> findAllPostman();

    List<AddressView> findAddressAll();

    Integer findMonthworksByDate();

    List<workCondition> findMonthPostmansByDate();

    PostmanSumView findMaxandminworker();
}
