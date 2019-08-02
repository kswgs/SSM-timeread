package kswgs.utils;

import java.util.UUID;

public class UUIDUtils {
    /**
     * 带-的UUID
     *
     * @return 36位的字符串
     */
    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * 去掉-的UUID
     *
     * @return 32位的字符串
     */
    public static String getUUIDReplace() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
