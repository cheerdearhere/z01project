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



