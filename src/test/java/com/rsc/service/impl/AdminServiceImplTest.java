package com.rsc.service.impl;

import com.rsc.service.AdminService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
class AdminServiceImplTest {

    @Autowired
    AdminService adminService;

    @Test
    void findMonthPostmansByDate() {
        adminService.findMonthPostmansByDate();

    }
}