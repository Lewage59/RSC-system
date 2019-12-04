package com.rsc.controller;

import com.rsc.dataobject.mapper.Address;
import com.rsc.dataobject.mapper.Postman;
import com.rsc.dataobject.mapper.Users;
import com.rsc.service.PostmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/postman")
public class PostmanController {

    @Autowired
    PostmanService postmanService;

    @RequestMapping("/index")
    public String findReceiptNumber(HttpSession session){
        Users postman = (Users) session.getAttribute("UserInfo");
        List<Address> GaddressList = postmanService.findReceiptByPostmanid(postman.getUsername());
        List<Address> SaddressList = postmanService.findPieByPostmanid(postman.getUsername());
        Integer postmanState = postmanService.findpostmanStateById(postman.getPostmanId());
        session.setAttribute("postmanState",postmanState);
        session.setAttribute("SaddressList",SaddressList);
        session.setAttribute("GaddressList",GaddressList);
        return "postman/index";
    }

    @RequestMapping("/receiptFinish")
    public String receiptFinish(Integer no){
        Postman postman = postmanService.receiptFinish(no);
        return "redirect:index";
    }

    @RequestMapping("/pieFinish")
    public String pieFinish(Integer no){
        Postman postman = postmanService.pieFinish(no);
        return "redirect:index";
    }

    @RequestMapping("/receiptFault")
    public String receiptFault(Integer no){
        Postman postman = postmanService.receiptFault(no);
        return "redirect:index";
    }

    @RequestMapping("/pieFault")
    public String pieFault(Integer no){
        Postman postman = postmanService.pieFault(no);
        return "redirect:index";
    }

    @RequestMapping("/workUp")
    public String workUp(Integer no){
        postmanService.changepostmanStateById(no,0);
        return "redirect:index";
    }

    @RequestMapping("/workOut")
    public String workOut(Integer no){
        postmanService.changepostmanStateById(no,1);
        return "redirect:index";
    }
}
