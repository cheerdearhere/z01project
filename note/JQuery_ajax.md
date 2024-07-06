
# I. 시작하며
- [ajax 공식](https://api.jquery.com/jquery.ajax/)
- ajax() method는 get과 post를 지정할 수 있는 method로 많이 사용된다. 
- 비동기적으로 request를 처리하며 one page 방식을 사용할때 유용하다.
```javascript
    $.ajax({
        key:value, 
        name:value, 
        ... 
    });
```
- 파라메터는 객체형으로 표시하며 여러 속성들을 사용

# II. 속성 정보
- `asnyc`: request의 동기/비동기를 정한다. default는 true이며 asynchronous
- `beforeSend`(xhr): request가 전송되기 전에 수행할 함수.
  - `return false;` 또는 `jqXHR.abort();`인 경우 진행 정지
- `cache`: 브러우저에서 캐시를 만들것인지를 boolean으로 표시. default는 true이며 캐시 생성생성
- `complete`(xhr/status): success, error 함수 끝나고 실행할 함수. 요청의 성공과 실패에 관계없이 작동한다.
- `contentType`: 서버에서 데이터를 보낼때 사용할 타입(argumentType). 
  - default: application/x-www-form-urlencoded;charset=UTF-8
  - 텍스트인 경우) application/타입; charset=사용할 set
- `default`: "application/x-www-form-urlencoded"
- `content`:
- `data`: client에서 보낼 데이터를 입력
  - text로 전환해 전달
  - type: Object, String, Array
    - Object: `{key:value,...}` 
    - Array: `[]`
    - String
  - image는 여러 라이브러리를 사용해 String으로 변환해 전달(ByteStream)
- `dataFilter`(data,type):
- `dataType`: 서버에서 오는 데이터의 타입(returnType)
  - xml, html, json, script, json, text
  - default: 헤더의 MIME 타입
- `error`(xhr,status,error): request가 실패했을때 기능하는 함수
  - cross-domain 요청이나 cross-domain jsonp 요청에는 작동하지 않음
- `global`:
- `ifModified`:
- `jsonp`:
- `jsonpCallback`:
- `processData`:default인 true는 보내지는 데이터를 query string으로 바꿔서 보냄
- `scriptCharset`:
- `success`(result,status,xhr): request가 성공했을때 실행될 함수
  - 함수의 인자(parameter)에 전달되는 content(returned data) 확인
  - `error`, `complete`와 유사 
  - ex)
    ```javascript
    $.ajax({
        //...
        success: function(data) {
            if(data.responseCode==="200"){
                //...
            }else{
                //...
            }
        },
        error: function(err) {
            console.log(err)
        },
        complete: function(){
            
        }
    });
    ```
- `timeout`(milliseconds): ajax 호출 시점부터 지정한 시간(밀리초)이 지나면 에러로 상태 전환
  - `$ajaxSetup()`의 global timeout으로 오버라이드
- `traditional`: 전송되는 데이터 값이 변경될 수 있다.

    |               true               |          false                          |
    |------------------------------|-------------------------------------|
    | `arr=val1&arr=val2&arr=val3` | 	`arr[]=val1&arr[]=val2&arr[]=val3` |
- `type`: request method(get/post). 
  - delete, put: 브라우저에 따라 지원여부가 달라짐
  - default: get
- `url`: request를 요청할 대상(따로 요청하지 않으면 지금 페이지의 callback함수로 받음
  - `form.href`, `a.href` 등의 요청 url
- `username`:
- `xhr`:
# III. 사용 예시
- [참고 게시물](https://shanepark.tistory.com/220)
## A. client >> Spring
### 1. POST/ Object
```javascript
$.ajax({
    url: '/ajax/sample.do',
    method: 'post',
    dataType : 'text',
    data : {'name' : 'ajax_value1'
            , 'age' : 'ajax_value2'
            , 'sex' : 'ajax_value3'
            , 'hp' : 'ajax_value4'
            , 'desc' : 'ajax_value5'},
    success: function (data, status, xhr) {
        console.log(data);
    }
});
```
### 2. GET/ Object
```javascript
const obj = {};
obj['name'] = 'obj_value1';
obj['age'] = 'obj_value2';
obj['sex'] = 'obj_value3';
obj['hp'] = 'obj_value4';
obj['desc'] = 'obj_value5';

//text
$.ajax({
    url: '/ajax/sample.do',
    method: 'get',
    dataType : 'text',
    data : obj,
    success: function (data, status, xhr) {
        console.log(data);
    }
});
```
### 3. GET/ Map or Array
```javascript
const map = new Map();
map.set('name', 'map_value1');
map.set('age', 'map_value2');
map.set('sex', 'map_value3');
map.set('hp', 'map_value4');
map.set('desc', 'map_value5');

map.entries();

var args = "";

var i = 0;
map.forEach((value, key)=>{
    if(i > 0){
        args += '&';
    }
    args += key + '=' + value;
    i++;
})

$.ajax({
    url: '/ajax/sample1.ajax',
    method: 'get',
    dataType : 'text',
    data : args,
    traditional : true,
    success: function (data, status, xhr) {
        console.log(data);
    }
});
```
### 4. POST/ form element
- form 자체에서 처리
```html
<!-- 
    form name   => instance
    input name  => field name
    input value => field value
-->
<form 
        name="form1" 
        action="/ajax/sample.do" 
        method="post" 
        onsubmit="doSubmit(this);return false;"
>
    <!-- form controls -->
    <label for="name"> 이름 : </label>
    <input type="text" id="name" name="name">
    <label for="age"> 나이 : </label>
    <input type="text" id="age" name="age">
    <label for="sex"> 성별 : </label>
    <input type="text" id="sex" name="sex">
    <label for="hp"> 휴대전화 : </label>
    <input type="text" id="hp" name="hp">
    <label for="desc"> 기타 : </label>
    <input type="text" id="desc" name="desc">
    <!-- submitBtn -->
    <button type="submit" id="submit">submit</button>
</form>
```
- 함수로 처리
```javascript
function doSubmit(form){
	form.submit();
}
// or
function onClickSubmitBtn(){
    //여기서 요청 정보 변경 가능
    $("#targetFormId").attr("action","/ajax/sample-url.do");
    $("#targetFormId").submit();
}
// or
function doSubmit(form){
    $.ajax({
        url: '/ajax/sample7.ajax',
        method: 'get',
        dataType : 'text',
        data : form,
        traditional : true,
        success: function (data, status, xhr) {
            console.log(data);
        }
    });
}
```
### 5. GET/ JSON.stringify
```javascript
const nameList = ['A', 'B', 'C']; //배열 데이터

const userList = []; //List<Map> 또는 List<VO> 데이터
var data1 = {
    'name' : 'first_val1'
    , 'age' : 'first_val2'
    , 'sex' : 'first_val3'
    , 'hp' : 'first_val4'
    , 'desc' : 'first_val5'
};
var data2 = {
    'name' : 'second_val1'
    , 'age' : 'second_val2'
    , 'sex' : 'second_val3'
    , 'hp' : 'second_val4'
    , 'desc' : 'second_val5'
};
userList.push(data1);
userList.push(data2);

$.ajax({
    url: '/ajax/sample.do',
    method: 'get',
    dataType : 'text',
    traditional : true,
    data : {
        nameList : nameList
        , userList : JSON.stringify(userList)
    },
    success: function (data, status, xhr) {
        console.log(data);
    }
});
```
### 6. 기본 입력 차단하고 처리 후 진행(preventDefault)
- 버튼/ anchor element/ submit 등의 기본 기능을 막는 함수: `event.preventDefault();`
```html
<script>
$(document).ready(function(){
	$("#a1").click(function(e){
	//event 객체로 기본동작(링크의 get방식 연결)을 막음
		e.preventDefault();
		$.ajax({
		//$.ajax({속성명:"value"});
			url:"data", //경로(controller에서 mapping할 경로)
			type:"POST", //method 형식(GET/POST)
			cache: false, //캐시 생성 여부
			data:"",//서버에 보낼 data(객체도 가능, 없으면 생략)
			dataType:"html",//response data type
			success: function(data){
			//위에서 보내는 data와 다름(서버에서 받는 data)
				$("#content").html(data);
			//HTTP request가 성공했을때 수행
			},
			error: function(){
			//요청 실패시 수행
				console.log("fail");
			},
			complete: function(){
			//요청 완료(성공/실패 무관)시 수행
				console.log("always");
			}
		});
	});
});
</script>
```

## B. Spring에서 받기
### 1. 기본
```java
@RequestMapping(value="/data", produces="application/text; charset=UTF8")
//body가 아닌 jsp파일로 반환할때는 @ResponseBody 없음
public String data(HttpServletRequest request, HttpServletResponse response, Model model) {
    return "data";//ajax를 통해 jsp파일을 로드하면 그 페이지의 내용(html)을 가져옴
}
```
### 2. GET: 각각 필드 받기
```java
@RequestMapping(value = "/ajax/sample.do", method = RequestMethod.GET)
@ResponseBody
public String sample1(HttpServletRequest request, ModelMap model){
    
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String sex = request.getParameter("sex");
    String hp = request.getParameter("hp");
    String desc = request.getParameter("desc");
    
    logger.info("name : {}, age : {}, sex : {}, hp : {}, desc : {}", name, age, sex, hp, desc);
    
    return "\"result\":\"ok\"";
}
```
### 3. GET: Object/Map/Array 등 데이터 세트로 받기
```java
@RequestMapping(value = "/ajax/sample3.do", method = RequestMethod.GET)
@ResponseBody
public String sample3(@RequestParam Map<String, String> param, HttpServletRequest request, ModelMap model){
    
    String name = param.get("name");
    String age = param.get("age");
    String sex = param.get("sex");
    String hp = param.get("hp");
    String desc = param.get("desc");

    logger.info("name : {}, age : {}, sex : {}, hp : {}, desc : {}", name, age, sex, hp, desc);
    
    return "\"result\":\"ok\"";//RequestBody인 경우 escape 처리
}
```
### 4. GET: 입력 필드들의 이름과 같은 VO/DTO를 미리 만들어서 한번에 받는 경우
```java
@RequestMapping(value = "/ajax/sample4.do", method = RequestMethod.GET)
@ResponseBody
public String sample4(@ModelAttribute User user, HttpServletRequest request, ModelMap model){
    String name = user.getName();
    String age = user.getAge();
    String sex = user.getSex();
    String hp = user.getHp();
    String desc = user.getDesc();

    logger.info("name : {}, age : {}, sex : {}, hp : {}, desc : {}", name, age, sex, hp, desc);
    return "\"result\":\"ok\"";
}
```
### 5. POST: Array/Map
```java
@RequestMapping(value = "/ajax/sample6.ajax", method = RequestMethod.POST)
@ResponseBody
public String sample6(
        @RequestParam(value = "nameList[]") List<String> nameList//traditional: false
        , @RequestParam(value = "nameList") String[] nameArr//traditional: true
        , @RequestParam(value = "userList") String userList //List<dataVO>인 경우 JSON(문자열)
        , HttpServletRequest request
        , ModelMap model
) throws JsonProcessingException {

    ObjectMapper mapper = new ObjectMapper();//jsonMapper
    List<User> users = mapper.readValue(users, new TypeReference<List<User>>() {});

    logger.info(nameList.toString());
    logger.info(users.toString());


    return "\"result\":\"ok\"";
```
## C. Spring >> Html
### 1. xml
- server
```java
@RequestMapping(value = "/datatype/sample1.ajax", method = RequestMethod.GET)
@ResponseBody
public String sample1(HttpServletRequest request, ModelMap model){
    Document document = getOrderListXml();

    XMLOutputter xmlOut = new XMLOutputter();

    return xmlOut.outputString(document);
}

public Document getOrderListXml(){
    List<Order> orderList = getOrderList();
    Document document = new Document();
    Element root=new Element("orderList");
    document.setRootElement(root);

    for (Order order : orderList) {
        Element orderElement = new Element("order");

        Element id = new Element("id");
        id.addContent(String.valueOf(order.getId()));
        orderElement.addContent(id);

        Element title = new Element("title");
        title.addContent(String.valueOf(order.getTitle()));
        orderElement.addContent(title);

        Element desc = new Element("desc");
        desc.addContent(String.valueOf(order.getDesc()));
        orderElement.addContent(desc);

        root.addContent(orderElement);
    }

    return document;
}
```
- client
```javascript
$.ajax({
    url: '/datatype/sample1.ajax',
    method: 'get',
    dataType : 'xml',
    success: function (data, status, xhr) {
        console.log('xml-----------------')
        console.log(data);
        var dom = xhr.responseXML;
        var order = dom.getElementsByTagName("order");
        var title = order[0].childNodes[0].nodeValue;
    },
    error: function (data, status, err) {

    },
    complete: function () {

    }
});
```
### 2. json
- JSON 관련 라이브러리를 쓸 수 없는 경우
  - java(jdk 1.7이하)
    - [JsonParser](../src/main/java/com/team03/prototype/util/jsonLibrary/JsonParser.java)
    - [JsonStringifier](../src/main/java/com/team03/prototype/util/jsonLibrary/JsonStringifier.java)
- server
  - [ES5 아래(익스플로러)](../src/main/webapp/resources/js/jsonLibrary/JSON_under_es5.js)
  - [ES5 이상](../src/main/webapp/resources/js/jsonLibrary/JSON_upper_es5.js)
```java
@RequestMapping(value = "/datatype/sample2.ajax", method = RequestMethod.GET)
@ResponseBody
public String sample2(HttpServletRequest request, HttpServletResponse response) throws IOException {

    JSONObject root = orderService.getOrderListJson();
    List<Order> or = orderService.getOrderList();
    ObjectMapper mapper = new ObjectMapper();
    String s = mapper.writeValueAsString(or);
    //
    return s;
}
```
- client
```javascript
$.ajax({
    url: '/datatype/sample2.ajax',
    method: 'GET',
    dataType : 'json',
    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    success: function (data, status, xhr) {
        console.log('json-----------------')
        console.log(data);
        for(var i = 0; i<data.length; i++){
            console.log(data[i].id);
            console.log(data[i].title);
            console.log(data[i].desc);
        }
    },
    error: function (data, status, err) {

    },
    complete: function () {

    }
});
```
### 3. html
- server
```java
@RequestMapping(value = "/datatype/sample3.ajax", method = RequestMethod.GET)
@ResponseBody
public String sample3(HttpServletRequest request, ModelMap model){
    return "thymeleaf/jbground/type_sample :: #test";
}
```
- client
```javascript
$.ajax({
    url: '/datatype/sample3.ajax',
    method: 'get',
    dataType : 'html',
    success: function (data, status, xhr) {
        console.log('html-----------------')
        console.log(data)
        $('#test').replaceAll(data)
    },
    error: function (data, status, err) {

    },
    complete: function () {

    }
});
```
### 4. script
- client
```javascript
var url = "https://code.jquery.com/color/jquery.color-2.1.2.js";
$.getScript( url, function() {
  $( "#go" ).on( "click", function() {
    $( ".block" )
      .animate({
        backgroundColor: "rgb(255, 180, 180)"
      }, 1000 )
      .delay( 500 )
      .animate({
        backgroundColor: "olive"
      }, 1000 )
      .delay( 500 )
      .animate({
        backgroundColor: "#00f"
      }, 1000 );
  });
});
```
### 5. text
- server
```java
@RequestMapping(value = "/datatype/sample6.ajax", method = RequestMethod.GET)
@ResponseBody
public String sample6(HttpServletRequest request, ModelMap model){
    List<Order> orderList = orderService.getOrderList();

    return orderList.toString();
}
```
- client
```javascript
$.ajax({
    url: '/datatype/sample6.ajax',
    method: 'get',
    dataType : 'text',
    success: function (data, status, xhr) {
        console.log('text-----------------')
        console.log(data);
    },
    error: function (data, status, err) {

    },
    complete: function () {

    }
});
```
# IV. 파일 업로드 처리하기
## A. 설정
- 파일 입출력 관련 기본 dependency
```xml
<dependency>
    <groupId>commons-fileupload</groupId>
    <artifactId>commons-fileupload</artifactId>
    <version>1.3.2</version>
</dependency> 
<dependency>
    <groupId>commons-io</groupId>
    <artifactId>commons-io</artifactId>
    <version>2.5</version>
</dependency> 
```
- servlet, jsp update
```xml
<dependency>
     <groupId>javax.servlet</groupId>
     <artifactId>javax.servlet-api</artifactId>
     <version>3.0.1</version>
     <scope>provided</scope>
</dependency>
<dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>jsp-api</artifactId>
      <version>2.2</version>
</dependency>
```
- bean에 multipart 관련
```xml
<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">        
    <!-- max upload size in bytes -->        
    <beans:property name="maxUploadSize" value="5242880" /> 
    <!-- 5MB -->        
    <!-- max size of file in memory (in bytes) -->        
    <beans:property name="maxInMemorySize" value="1048576" /> <!-- 1MB -->    
</beans:bean> 
```
- Form 관련 설정
  - https://ko.javascript.info/formdata
  - https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference
## B. 처리
### 1. controller 	
```java
@RequestMapping(value = "/", method = RequestMethod.GET)
//…
return "uploadAjax";
```

### 2. AjaxFile.class: DTO class
```java
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class AjaxFile {
  private List<MultipartFile> images;
  private String writer;
  //…generate…
}
```

### 3. upload.jsp 생성
```html
<h3>Ajax upload</h3>
<form action="file" method="post" enctype="multipart/form-data" id="frm">
	올린 사람: <input type="text" name="writer" id="writer"/><br/>
	파일 <input type="file" id="images" name="images" multiple/>
</form>
<br/>
<button id="btn1" class="btn btn-primary">file upload</button>
<h3 id="result">올린 파일 확인하기</h3>
```

### 4. script
```javascript
$(document).ready(function(){
    $("#btn1").on("click", function(){
        //form에서 전달된 data를 ajax로 전송할 객체
        //배열이므로 [0]로 표시
        let form = new FormData($("#frm")[0]);
        $.ajax({
            url: "file",//form에 표시안해도 ajax에서 입력해서 처리가능
            type: "post",
            data: form,
            //FormData 객체를 사용할때 contentType과 processType을 false로 지정
            contentType: false,//application/타입; charset=UTF8
            processData: false,//default(true)는 보내는 데이터를 quert String으로 바꿔서 보냄
            success: function(data){//list로 data에 받아 사용
                for(var i=0;i<data.length ; i++){
                    $("#result").append(data[i] + "<br/>");
                }
            },
            error: function(){
                alert("file err");
            }
        });
    });
});
```

### 5. controller
```java
@RequestMapping("/file")
@ResponseBody
public Object file(AjaxFile file) {
    List<MultipartFile> list = file.getImages();
    ArrayList<String> fileNameList = new ArrayList<String>();

    //ResposeBody로 ArrayList 반환
    try {
        for(MultipartFile mf : list) {
            fileNameList.add(mf.getOriginalFilename());
            mf.transferTo(new File("/Users/choikmacbookair/Desktop/workspace/spAjaxUpload/src/main/webapp/resources/upimage/" + mf.getOriginalFilename()));
        }
    }
    catch(Exception e) {
        e.printStackTrace();
    }
    String writer = file.getWriter();
    System.out.println("writer: " + writer);
    return fileNameList;
}
```