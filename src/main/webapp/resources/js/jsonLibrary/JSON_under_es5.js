/*==================================================================
 * JSON 문자열 관련 라이브러리를 사용할 수 없는 환경인 경우 사용
 * @see
 * @version es5 이하
 * @author dreamIk
 * @date 2018.01.01
=====================================================================*/


/**
 * jsonParse
 * @param jsonString JSON 문자열
 * @return {{}|*[]|*|boolean|number} javascript data
 */
function parse(jsonString) {
    var tokenList;

    function parseValue() {
        var value = tokenList.shift();

        if (value === '{') {
            var result = {};
            while (tokenList[0] !== '}') {
                var key = parseValue();
                tokenList.shift(); // colon
                var val = parseValue();
                result[key] = val;
                if (tokenList[0] === ',') {
                    tokenList.shift();
                }
            }
            tokenList.shift(); // closing brace
            return result;
        } else if (value === '[') {
            var resultArray = [];
            while (tokenList[0] !== ']') {
                resultArray.push(parseValue());
                if (tokenList[0] === ',') {
                    tokenList.shift();
                }
            }
            tokenList.shift(); // closing bracket
            return resultArray;
        } else if (value[0] === '"' && value[value.length - 1] === '"') {
            return value.slice(1, -1);
        } else if (value === 'true') {
            return true;
        } else if (value === 'false') {
            return false;
        } else if (value === 'null') {
            return null;
        } else {
            return parseFloat(value);
        }
    }

    function tokenize(jsonString) {
        var regex = /({|}|\[|\]|:|,|\s+|"(?:\\.|[^"\\])*"|true|false|null|-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/g;
        return jsonString.match(regex).filter(function(token) { return !/^\s+$/.test(token); });
    }

    tokenList = tokenize(jsonString);
    return parseValue();
}

/**
 * json stringify
 * @param value javascript data
 * @return {string} stringified data
 */
function stringify(value) {
    if (typeof value === 'string') {
        return '"' + value + '"';
    } else if (typeof value === 'number' || typeof value === 'boolean') {
        return String(value);
    } else if (value === null) {
        return 'null';
    } else if (Object.prototype.toString.call(value) === '[object Array]') {
        var elements = [];
        for (var i = 0; i < value.length; i++) {
            elements.push(stringify(value[i]));
        }
        return '[' + elements.join(',') + ']';
    } else if (typeof value === 'object') {
        var properties = [];
        for (var key in value) {
            if (value.hasOwnProperty(key)) {
                properties.push(stringify(key) + ':' + stringify(value[key]));
            }
        }
        return '{' + properties.join(',') + '}';
    }
}

// Usage
var jsObject = { name: "John", age: 30, isStudent: false, courses: ["Math", "Science"], address: { city: "New York", zip: "10001" } };
var jsonString = stringify(jsObject);
console.log(jsonString);
var parsedObject = parse(jsonString);
console.log(parsedObject);
