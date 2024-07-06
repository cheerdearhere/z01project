/*==================================================================
 * JSON 문자열 관련 라이브러리를 사용할 수 없는 환경인 경우 사용
 * @see
 * @version es5 이상
 * @author dreamIk
 * @date 2018.01.01
=====================================================================*/


/**
 * jsonParse
 * @param jsonString JSON 문자열
 * @return {{}|*[]|*|boolean|number} javascript data
 */
function parse(jsonString) {
    function parseValue() {
        const value = tokenList.shift();

        if (value === '{') {
            const result = {};
            while (tokenList[0] !== '}') {
                const key = parseValue();
                tokenList.shift(); // colon
                const value = parseValue();
                result[key] = value;
                if (tokenList[0] === ',') {
                    tokenList.shift();
                }
            }
            tokenList.shift(); // closing brace
            return result;
        } else if (value === '[') {
            const result = [];
            while (tokenList[0] !== ']') {
                result.push(parseValue());
                if (tokenList[0] === ',') {
                    tokenList.shift();
                }
            }
            tokenList.shift(); // closing bracket
            return result;
        } else if (value[0] === '"' && value[value.length - 1] === '"') {
            return value.slice(1, -1);
        } else if (value === 'true') {
            return true;
        } else if (value === 'false') {
            return false;
        } else if (value === 'null') {
            return null;
        } else {
            return Number(value);
        }
    }

    function tokenize(jsonString) {
        const regex = /({|}|\[|\]|:|,|\s+|"(?:\\.|[^"\\])*"|true|false|null|-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/g;
        return jsonString.match(regex).filter(token => !/^\s+$/.test(token));
    }

    const tokenList = tokenize(jsonString);
    return parseValue();
}

/**
 * json stringify
 * @param value javascript data
 * @return {string} stringified data
 */
function stringify(value) {
    if (typeof value === 'string') {
        return `"${value}"`;
    } else if (typeof value === 'number' || typeof value === 'boolean') {
        return String(value);
    } else if (value === null) {
        return 'null';
    } else if (Array.isArray(value)) {
        const elements = value.map(element => stringify(element));
        return `[${elements.join(',')}]`;
    } else if (typeof value === 'object') {
        const properties = Object.keys(value).map(key => `"${key}":${stringify(value[key])}`);
        return `{${properties.join(',')}}`;
    }
}

// Usage
const jsObject = { name: "John", age: 30, isStudent: false, courses: ["Math", "Science"], address: { city: "New York", zip: "10001" } };
const jsonString = stringify(jsObject);
console.log(jsonString);
const parsedObject = parse(jsonString);
console.log(parsedObject);
