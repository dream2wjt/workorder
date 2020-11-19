package com.yzh.workorder.utils;

import java.util.UUID;

/**
 * @description: UUIDUtils
 * @author: jingtian.wang
 * @time: 2020/11/6 15:59
 */
public class UUIDUtils {
    /**
     * 获取UUID
     *
     * @return
     */
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-", "");
    }

    /**
     * 获取UUID
     *
     * @return
     */
    public static String[] getUUID(int number) {
        String[] result = null;
        if (number > 0) {
            result = new String[number];
            for (int i = 0; i < number; i++) {
                result[i] = getUUID();
            }
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(getUUID());
    }
}
