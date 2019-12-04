package com.rsc.controller;

import com.demo.Form.AddressForm;
import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Logistics;
import com.rsc.dataobject.mapper.Users;
import com.rsc.service.AddressService;
import com.rsc.service.LogisticsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Slf4j
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @Autowired
    private LogisticsService logisticsService;

    @RequestMapping("/createAddress")
    public String createAddress(@Valid AddressForm addressForm, BindingResult bindingResult, HttpSession session){
        Users users = (Users) session.getAttribute("UserInfo");
        Address address = new Address();
        BeanUtils.copyProperties(addressForm,address);
        session.setAttribute("username", users.getUsername());
        //收件地址为1，寄件地址为2
        if (address.getPtype()==1){
            Address address1 = addressService.createAddress(address,users);
            session.setAttribute("gaddressId",address1.getId());
            return "user/delivery_address";
        }else if (address.getPtype()==2) {
            Address address1 = addressService.createAddress(address,users);
            session.setAttribute("saddressId",address1.getId());
            return "user/submit_address";
        }
        return "tool/error";
    }

    @RequestMapping("/submit")
    public String submission(HttpSession session){
        Users user = (Users) session.getAttribute("UserInfo");
        Integer userId = user.getId();
        Integer saddressId = (Integer) session.getAttribute("saddressId");
        Integer gaddressId = (Integer) session.getAttribute("gaddressId");System.out.println(saddressId);
        Logistics logistics = logisticsService.submit(userId, saddressId, gaddressId);
        return "redirect:/user/toIndex";
    }
}
