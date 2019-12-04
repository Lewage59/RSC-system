package com.rsc.controller;

import com.demo.Form.UserForm;
import com.rsc.dataobject.mapper.Users;
import com.rsc.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

    //用户注册页面
    @RequestMapping("/tool/toRegister")
    public String toRegister(){
        return "user/register";
    }

    //用户首页
    @RequestMapping("/user/toIndex")
    public String toIndex(Authentication authentication, HttpSession session){
        String username = authentication.getName();
        session.setAttribute("username", username);
        return "user/index";
    }

    //用户邮寄地址页面
    @RequestMapping("/user/toSendAddress")
    public String toSendAddress(Authentication authentication, HttpSession session) {
        String username = authentication.getName();
        session.setAttribute("username", username);
        return "user/send_address";
    }

    //邮差首页
    @RequestMapping("/postman/toIndex")
    public String toPostIndex(Authentication authentication, HttpSession session){
        Users user = userService.findByUsername(authentication.getName());
        session.setAttribute("PostmanInfo",user);
        String username = authentication.getName();
        session.setAttribute("username", username);
        return "postman/index";
    }

    @RequestMapping("/user/error")
    public String error(){
        return "tool/error";
    }

    //注册跳转页面
    @Transactional
    @RequestMapping("/tool/register")
    public String register(@Valid UserForm userForm, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            System.out.println("error");
            return "tool/error";
        }
        try{
            Users user = new Users();
            userForm.setUpassword(new BCryptPasswordEncoder().encode(userForm.getUpassword()));
            BeanUtils.copyProperties(userForm,user);
            userService.save(user);
        }catch (Exception e){
            log.error("【注册失败】"+e.getMessage());
            return "/user/error";
        }
        log.info("【注册成功】");
        System.out.println("success");
        return "redirect:/login";
    }

    //登陆成功跳转页面
    @RequestMapping("/")
    public String login(Authentication authentication, HttpSession session){
        Users user = userService.findByUsername(authentication.getName());
        session.setAttribute("UserInfo",user);
        String username = authentication.getName();
        session.setAttribute("username", username);
        for (GrantedAuthority ga :authentication.getAuthorities()){
            if ("ROLE_POSTMAN".equals(ga.getAuthority().trim())) {
                return "redirect:postman/index";
            } else if ("ROLE_VIPUSER".equals(ga.getAuthority().trim())) {
                return "user/index";
            } else if ("ROLE_ADMIN".equals(ga.getAuthority().trim())) {
                return "redirect:admin/index";
            }
        }
        return "tool/error";
    }

    @RequestMapping("/toLogout")
    public String toLogout(Authentication authentication){
        return "tool/logout";
    }

}
