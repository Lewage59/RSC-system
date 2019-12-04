package com.rsc.service;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Postman;

import java.util.List;

public interface PostmanService {
    Postman receiptFinish(Integer no);
    Postman pieFinish(Integer no);
    Postman findById(Integer id);
    List<Address> findReceiptByPostmanid(String postmanName);
    List<Address> findPieByPostmanid(String postmanName);
    Postman receiptFault(Integer no);
    Postman pieFault(Integer no);
    Integer findpostmanStateById(int id);
    void changepostmanStateById(int id,int state);
}
