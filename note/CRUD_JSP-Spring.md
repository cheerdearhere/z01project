# ajax ������ ȣ��
```javascript
	$("#intro").click(function(event){
		event.preventDefault();// �⺻ ��� ����
		$.ajax({
			url:$("#intro").attr("href"),
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);//������ ȣ��
				$("#skillTitle").text("Introduction Character");//text ����
				$("#skillDetails").text("ĳ���Ϳ����� ������ �����ϰ� �� �� �ִ� ������ �Դϴ�."); 
			},
			error:function(){
				$("#errorMessage").text("�������� ����");
				$("#mbody").text("���� ����");
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
		<p class="card-text">ȯ���λ�</p>
		<a href="mailto:dream-ik89@naver.com?subject=[������ ������(����)]���� �Դϴ�.&&body=Java, HTML, CSS, Javascript, SPRING Framework, MyBatis, MySQL..." class="btn btn-outline-danger">Send E-mail</a>
		<a href="https://github.com/cheerdearhere" class="btn btn-outline-secondary">Visit GitHub</a>
		<a href="https://drive.google.com/drive/folders/1_u3TrhhxDfS89NH5k8XnWs-cRzUH1M46?usp=share_link" class="btn btn-outline-success">Visit GoogleNote</a> 
	</div>
</div>
<!-- mid -->
<div class="container">
    <!-- input button -->
	<a id="introWriteView" class="btn btn-success" href="introWriteView">���</a>
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
                    <h5 class="card-title">����: ${dto.introClass} </h5>
                    <h5 class="card-text">�̸�: ${dto.introName}</h5>
                    <!-- �̵��� ó���� ��� -->
                    <a href="introDetails?introId=${dto.introId}" class="pClick stretched-link text-dark" style="text-decoration:none">�ڼ��� ����</a>
                </div>
            </div>
        </div>
</c:forEach>
</c:if>
<c:if test="${allListCnt == 0}">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h2>��ϵ� �Խù��� �����ϴ�.</h2>
                </div>
            </div>
        </div>
</c:if>
    </div>
</div>
```



