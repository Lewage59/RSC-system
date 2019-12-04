package com.rsc.controller;

import com.rsc.View.*;
import com.rsc.dataobject.mapper.workCondition;
import com.rsc.service.AdminService;
import com.rsc.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/index")
    public String toIndex(HttpSession session) {
        int month = TimeUtil.getMonth();
        List<MonthView> monthViewList = adminService.findSixMonth();
        List<DayView> dayViewList = adminService.findAweek();
        Integer monthSum = adminService.findMonthworksByDate();
        List<workCondition> monthPostmans = adminService.findMonthPostmansByDate();
        PostmanSumView postmansum = adminService.findMaxandminworker();
        session.setAttribute("postmansum",postmansum);
        session.setAttribute("monthPostmans",monthPostmans);
        session.setAttribute("monthSum",monthSum);
        session.setAttribute("month",month);
        session.setAttribute("dayViewList", dayViewList);
        session.setAttribute("monthViewList", monthViewList);
        return "admin/index";
    }

    @RequestMapping("/findAllPostmanWorks")
    public String findAllPostman(@RequestParam(value = "town", defaultValue = "太平镇") String town, @RequestParam(value = "month", defaultValue = "0") Integer month, HttpSession session) {
        if (month == 0) {
            month = TimeUtil.getMonth();
        }
        List<workConditionView> workConditionViewList = adminService.findAllByMonthAndPostmanId(town, month);
        session.setAttribute("workConditionViewList", workConditionViewList);
        session.setAttribute("month", month);
        session.setAttribute("town", town);
        return "admin/all-work";
    }

    @RequestMapping("/findPostmanInfo")
    public String findPostmanById(Integer postmanId, @RequestParam(value = "month", defaultValue = "0") Integer month, HttpSession session) {
        if (month == 0) {
            month = TimeUtil.getMonth();
        }
        PostmanView postmanView = adminService.findBasesalary(postmanId, month);
        session.setAttribute("postmanView", postmanView);
        session.setAttribute("month",month);
        return "admin/postman-info";
    }

    @RequestMapping("/findAllPostmans")
    public String findAllPostmanInfo(HttpSession session) {
        List<PostmanView> postmanViewList = adminService.findAllPostman();
        session.setAttribute("postmanViewList", postmanViewList);
        return "admin/postman";
    }

    @RequestMapping("/findAddressAll")
    public String findAddressAll(HttpSession session) {
        List<AddressView> addressViewList = adminService.findAddressAll();
        session.setAttribute("addressViewList", addressViewList);
        return "admin/logistics";
    }
}



