package com.rsc.utils;

import java.util.Calendar;

public class TimeUtil {

    public static Integer getMonth(){
        Calendar calendar=Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH)+1;
        return month;
    }
}
