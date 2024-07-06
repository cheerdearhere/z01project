package com.team03.prototype.util.jsonLibrary;

import java.util.*;

/*====================================================================================
java 1.7 이하
====================================================================================*/
public class JsonStringifier {
    public String stringify(Object obj) {
        if (obj instanceof String) {
            return "\"" + obj + "\"";
        } else if (obj instanceof Number || obj instanceof Boolean) {
            return obj.toString();
        } else if (obj == null) {
            return "null";
        } else if (obj instanceof List) {
            List<?> list = (List<?>) obj;
            StringBuilder sb = new StringBuilder("[");
            for (int i = 0; i < list.size(); i++) {
                if (i > 0) sb.append(",");
                sb.append(stringify(list.get(i)));
            }
            sb.append("]");
            return sb.toString();
        } else if (obj instanceof Map) {
            Map<?, ?> map = (Map<?, ?>) obj;
            StringBuilder sb = new StringBuilder("{");
            int i = 0;
            for (Map.Entry<?, ?> entry : map.entrySet()) {
                if (i > 0) sb.append(",");
                sb.append(stringify(entry.getKey()));
                sb.append(":");
                sb.append(stringify(entry.getValue()));
                i++;
            }
            sb.append("}");
            return sb.toString();
        }
        throw new IllegalArgumentException("Unsupported data type: " + obj.getClass().getName());
    }

    //ex
//    public static void main(String[] args) {
//        JsonStringifier stringifier = new JsonStringifier();
//        Map<String, Object> jsObject = new HashMap<String, Object>();
//        jsObject.put("name", "John");
//        jsObject.put("age", 30);
//        jsObject.put("isStudent", false);
//        jsObject.put("courses", Arrays.asList("Math", "Science"));
//        Map<String, String> address = new HashMap<String, String>();
//        address.put("city", "New York");
//        address.put("zip", "10001");
//        jsObject.put("address", address);
//
//        String jsonString = stringifier.stringify(jsObject);
//        System.out.println(jsonString);
//    }
}
