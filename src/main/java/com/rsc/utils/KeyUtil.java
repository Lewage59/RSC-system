package com.rsc.utils;

import java.util.Random;

public class KeyUtil {

    public static synchronized Integer genUniqueKey(){
        Random random = new Random();

        Integer number = random.nextInt(900000)+100000;

        return number;
    }
}
