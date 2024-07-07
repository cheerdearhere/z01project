# ajax 페이지 호출
```javascript
	$("#intro").click(function(event){
		event.preventDefault();// 기본 기능 멈춤
		$.ajax({
			url:$("#intro").attr("href"),
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);//페이지 호출
				$("#skillTitle").text("Introduction Character");//text 변경
				$("#skillDetails").text("캐릭터에대한 설명을 저장하고 볼 수 있는 페이지 입니다."); 
			},
			error:function(){
				$("#errorMessage").text("서버접속 실패");
				$("#mbody").text("서버 오류");
				$("#modal").trigger("click");
			}
		});
	});
```

# List
```html
<!-- top -->
<h1 class="display-1 text-center mb-5 titleText">Introduce</h1>	
<div class="card shadow-lg mx-auto" style="width:70%">
	<img src="image/mio.png" alt="logo" class="card-img-left"/>
	<div class="card-body">
		<h1 class="card-title">Welcome to the Mio World!!</h1>
		<p class="card-text">환영인사</p>
		<a href="mailto:dream-ik89@naver.com?subject=[웹개발 구직중(신입)]조익 입니다.&&body=Java, HTML, CSS, Javascript, SPRING Framework, MyBatis, MySQL..." class="btn btn-outline-danger">Send E-mail</a>
		<a href="https://github.com/cheerdearhere" class="btn btn-outline-secondary">Visit GitHub</a>
		<a href="https://drive.google.com/drive/folders/1_u3TrhhxDfS89NH5k8XnWs-cRzUH1M46?usp=share_link" class="btn btn-outline-success">Visit GoogleNote</a> 
	</div>
</div>
<!-- mid -->
<div class="container">
    <!-- input button -->
	<a id="introWriteView" class="btn btn-success" href="introWriteView">등록</a>
    <!-- information -->
    <h3 class="text-center text-info">List</h3>
	<hr/>
	<div class="row mb-3">
<!-- list -->
<c:if test="${allListCnt != 0}">
<c:forEach items="${allList}" var="dto">
    <!--  c:forEach items="el_requestAttributeKey" var="list_item" -->
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="upimage/${dto.introPhoto}" alt="${dto.introPhoto}" style="max-width:280px;width:100%;height:280px;"/>
                <div class="card-body">
                    <h5 class="card-title">종류: ${dto.introClass} </h5>
                    <h5 class="card-text">이름: ${dto.introName}</h5>
                    <!-- 이동을 처리할 경우 -->
                    <a href="introDetails?introId=${dto.introId}" class="pClick stretched-link text-dark" style="text-decoration:none">자세히 보기</a>
                </div>
            </div>
        </div>
</c:forEach>
</c:if>
<c:if test="${allListCnt == 0}">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h2>등록된 게시물이 없습니다.</h2>
                </div>
            </div>
        </div>
</c:if>
    </div>
</div>
```

# jQuery DOM 접근
`$("QuerySelector")`
## 1. 기본 query selector
- `*` : 모든요소
- `element` : 지정된 요소 이름을 가진 모든 요소
- `#id`: 지정된 id 특성값을 가진 element
- `.class`: 지정된 class특성값을 가진 모든 요소들
- `selector1, selector2` : 하나이상의 셀렉터와 일치하는 모든 요소들
## 2. 계층 탐색 
- `ancestor(공백)descendant` : 다른요소 하위요소들 탐색
  - `$("ul a")`
-  parent > child : 다른 요소의 직접적인 자식 요소들 탐색
  - `$("li > a")`
- `previous + next` : 이전 요소 이후에서 가장 가까이 있는 이웃 요소
  - `$("h1 + span")`
- `previous ~ sibling` :이전 요소 이후 모든 이웃 요소들
  - `$("a ~ h3")`
## 3. element attribute/properties 탐색
- `elemment:[속성='속성값']`: 해당 속성의 값 체크
  - ex) `$("input:checkbox[name='seq'"]).prop("checked",true);`

## 4. DOM traversing
- 형태: `$("#targetElement").함수();`
- chaining으로 처리 가능
- 함수
  - `parent()`: 바로 위 조상(부모) 태그
    - `document.getElementById('elId').parentElement;`
  - `parents()`: 부모부터 모든 조상 태그
  - `parentUntil('멈출 태그')`: 부모로부터 선택한 태그 이전까지의 모든 조상 태그 
  - `closest('검색할 쿼리셀렉터')`: 조상 태그 중 쿼리셀렉터로 검색
  - `children()`: 모든 자식 태그
    - `document.querySelector('#elId').children;`
  - `first()`: 여러 태그를 선택한 경우 중 첫 태그
    - ex) `$('div#elId').children().first();`
    - `document.querySelector('#elId').firstChild;`
  - `last()`: 여러 태그를 선택한 경우 중 마지막 태그
    - ex) `$('div#elId').children().last();`
    - `ducument.getElementById('elId').lastChild;`
  - `eq(index_numeric)`: 여러 태그를 선택한 경우 
    - ex) `$('div#elId').children().el(3);`
    - index 3의 태그 = 4번째 태그
    - `document.querySelector('#elId').children()[3];`
  - `find('대상 태그')`: 후손 태그 검색
    - ex) `$('div#elId').find('span')`
    - `document.querySelector('#elId').getElementsByTagName('span');`
  - `next()`: 이웃(형제) 태그 중 다음 태그
    - `document.getElementById('elId').nextElementSibling;`
  - `nextAll()`: 형제 태그 중 현재 태그 뒤로 나오는 모든 태그들
  - `nextUntil('검색할 쿼리셀렉터')`: 형제 태그 중 현재 태그 뒤부터 검색한 쿼리의 태그 까지 모든 태그
  - `prev()`: 형제 태그 중 이전 태그
    - `document.querySelector('#elId').prevElementSibling
  - `prevAll()`: 형제 태그 중 현재 태그 앞으로 나오는 모든 태그들
  - `prevUntil('검색할 쿼리셀렉터')`: 형제 태그 중 현재 태그 전부터 검색한 쿼리의 태그 까지 모든 태그
  - `siblings()`: 모든 형제 태그
  - `filter('검색할 쿼리셀랙터')`: 여러 태그를 선택한 경우 그중 셀렉터에 맞는 대상
    - ex) `$("input:text").filter("#elId");`
## 5. tag 사용하기
- get: jquery 객체를 javascript 객체로 변환
  - `$('#elId').get(0); // <div id="elId"></div>`
- attr: 대상의 attribute 조회, 변경
  - `$('#elId').attr("name");//대상 태그 name의 값`
  - `$('#elId').attr("name","변경할값");//대상 태그의 name 변경`
  - `document.getElementById('elId').name = '변경할값';`
- val: 대상 태그의 값(value 속성)
  - `$('#elId').val();//대상 태그 value의 값`
  - `$('#elId').val("변경할값");//대상 태그의 value 변경`
  - `document.getElementById('elId').value = '변경할값';`
- prop: attr과 유사. 속성 중 true/false 값을 가지는 속성(properties) 처리
  - hidden, readonly, checked 등
  - `disabled`는 한번 true 되면 인식 안됨
  - `$('#elId').prop("checked");//대상 태그 프로퍼티의 값`
  - `$('#elId').prop("checked", boolean);//대상 태그의 프로퍼티 변경`
  - `document.getElementById('elId').checked = boolean;`
- addClass: class 추가
    - `$('#elId').addClass("selected");//대상 태그에 클래스 추가`
    - `document.getElementById('elId').classList.add("selected");`
- removeClass: class 제거
    - `$('#elId').removeClass("selected");//대상 태그에 클래스 추가`
    - `document.getElementById('elId').classList.remove("selected");`
- toggleClass: class 토글
    - `$('#elId').toggleClass("selected");//대상 태그에 클래스 추가`
    - `document.getElementById('elId').classList.toggle("selected");`
- html: innerHTML
    - `$('#elId').html();//대상 태그 content`
    - `$('#elId').html("input content");//대상 태그 content 변경`
    - `document.getElementById('elId').innerHTML="input content";`
- text: text content 입력. 태그는 그냥 문자열로 전달됨
    - `$('#elId').text();//대상 태그 content`
    - `$('#elId').text("input content only text <br/>?");//대상 태그 content 문자열로 입력`
- css: 스타일 속성 조회/변경
  - `$('#elId').css('width'); // 465px`
  - `$('#elId').css('width', 300); // 300px로 변경`
  - `$('#elId').css({ width: 300, height: 300 }); // 여러 스타일 동시 변경`
  - `document.getElementById('elId').style.width = '300px';`
- height: 태그의 높이
  - `$('#elId').height();`
  - `document.getElementById('elId').style.height;`
- width: 태그의 너비
  - `$('#elId').width();`
  - `document.getElementById('elId').style.width;`
- position: 태그의 상대적인 위치
  - `$('#elId').position(); // { left: 값, top: 값 }`
  - `var el = document.getElementById('elId');//{ left: el.offsetLeft, top: el.offsetTop }`
- data: 태그에 데이터를 조회하거나 저장. 
  - html5에서는 태그에 데이터를 저장 가능. 
  - data-age, data-name, data-value...
    - `$('#elId').data('useyn'); // 값 조회`
    - `$('#elId').data('useyn', 0); // data-useyn을 0으로 변경`
    - `document.getElementById('elId')['data-useyn'] = 1;`

## 6. utils
- $.each(`array/object`,`(key,value)=>...`): ES5의 forEach이나 for ~ in문과 같음
  - `array/object`.forEach(`(key,value)=>...`);
- $.extend(`targetObj`,`resourceObj`);: targetObj에 resourceObj의 속성 복사. Object.assign과 유사
  - Object.assign(`targetObj`,`resourceObj`); 
- $.trim(`       st  rin  g   `): 문자열의 공백 제거
  - `       st  rin  g   `.trim(); // ==> `string`
- $.inArray: `array.indexOf()`
- $.proxy(`targetObj`,`bindedObj`): 타겟의 this를 bind 대상으로 변경. ES5에서의 bind와 유사
    -  `targetObj.bind(bindedObj);
- $.type(`obj`): typeof 보완. 
  - typeof는 null, Date 등 javascript의 다양한 클래스들을 Object로 처리
  - new 생성자를 통해 만든 리터럴도 Object로 처리
  - 정규식도 object
```javascript
$.type(new Date); // date
$.type(null); // null
$.type(new Number(12)); // number
$.type([1, 2, 3]); // array
$.type(/s/); // regexp
```


