package com.carl.util;

import java.util.Random;

public class RandomNum {
    public static Long getRandomNum() {
        Random random = new Random();
        long lower = 1000000;
        long upper = 9999999;
        return random.nextLong() * (upper - lower) + lower;
    }
}
