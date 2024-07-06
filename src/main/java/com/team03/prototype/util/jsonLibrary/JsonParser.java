package com.team03.prototype.util.jsonLibrary;
import java.io.IOException;
import java.util.*;
import java.util.regex.*;

/*====================================================================================
java 1.7 이하
====================================================================================*/
public class JsonParser {
    private static final Pattern TOKEN_PATTERN = Pattern.compile("\\s*(\\{|\\}|\\[|\\]|:|,|\"(?:\\\\.|[^\"\\\\])*\"|true|false|null|-?\\d+(?:\\.\\d+)?(?:[eE][+-]?\\d+)?|\\s+)");

    private Queue<String> tokens;

    public Object parse(String json) throws IOException {
        tokens = new LinkedList<String>(tokenize(json));
        return parseValue();
    }

    private List<String> tokenize(String json) {
        List<String> tokenList = new ArrayList<String>();
        Matcher matcher = TOKEN_PATTERN.matcher(json);
        while (matcher.find()) {
            String token = matcher.group().trim();
            if (!token.isEmpty()) {
                tokenList.add(token);
            }
        }
        return tokenList;
    }

    private Object parseValue() throws IOException {
        String token = tokens.poll();
        if ("{".equals(token)) {
            Map<String, Object> map = new HashMap<String, Object>();
            while (!"}".equals(tokens.peek())) {
                String key = (String) parseValue();
                tokens.poll(); // colon
                Object value = parseValue();
                map.put(key, value);
                if (",".equals(tokens.peek())) {
                    tokens.poll();
                }
            }
            tokens.poll(); // closing brace
            return map;
        } else if ("[".equals(token)) {
            List<Object> list = new ArrayList<Object>();
            while (!"]".equals(tokens.peek())) {
                list.add(parseValue());
                if (",".equals(tokens.peek())) {
                    tokens.poll();
                }
            }
            tokens.poll(); // closing bracket
            return list;
        } else if (token.startsWith("\"")) {
            return token.substring(1, token.length() - 1);
        } else if ("true".equals(token)) {
            return true;
        } else if ("false".equals(token)) {
            return false;
        } else if ("null".equals(token)) {
            return null;
        } else {
            return Double.valueOf(token);
        }
    }
    //ex
//    public static void main(String[] args) throws IOException {
//        JsonParser parser = new JsonParser();
//        String jsonString = "{\"name\":\"John\",\"age\":30,\"isStudent\":false,\"courses\":[\"Math\",\"Science\"],\"address\":{\"city\":\"New York\",\"zip\":\"10001\"}}";
//        Object result = parser.parse(jsonString);
//        System.out.println(result);
//    }
}
