<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> 
<title>product PM View</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
html, body{
	height: 100%;
	margin : 0;
	padding: 0;
}
</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="container">
	<h1>내용 확인 및 수정</h1>
	<form id="productModi-form" action="productModify?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pId" value="${pmDto.pId}"/>
		<p>제품 분류</p>
		<input type="hidden" id="typeV" value="${pmDto.pType}"/>
		<div class="form-check-inline">
			<label for="ptype1" class="form-check-label">
				<input type="radio" class="form-check-input" id="ptype1" name="pType" value="top"/>
				상의(top)
			</label>
		</div>
		<div class="form-check-inline">
			<label for="ptype2" class="form-check-label">
				<input type="radio" class="form-check-input" id="ptype2" name="pType" value="pant"/>
				바지(pant)
			</label>
		</div>
		<div class="form-check-inline">
			<label for="ptype3" class="form-check-label">
				<input type="radio" class="form-check-input" id="ptype3" name="pType" value="skirt"/>
				치마(skirt)
			</label>
		</div>
		<div class="form-check-inline">
			<label for="ptype4" class="form-check-label">
				<input type="radio" class="form-check-input" id="ptype4" name="pType" value="outer"/>
				외투(outer)
			</label>
		</div>
		<div class="form-check-inline">
			<label for="ptype5" class="form-check-label">
				<input type="radio" class="form-check-input" id="ptype5" name="pType" value="etc"/>
				기타(etc)
			</label>
		</div>
		<hr/>
		<h5 class="text-center">상세 정보</h5>
		<div class="form-group">
			<label for="pName">상품명</label>
			<input type="text" class="form-control" id="pName" name="pName" value="${pmDto.pName}" required/>
		</div>
		<div class="form-group">
			<label for="price">가격</label>
			<input type="text" class="form-control" id="price" name="pPrice" value="${pmDto.pPrice}" required/>
		</div>
		<div class="form-group">
			<label for="quanty">수량</label>
			<input type="text" class="form-control" id="quanty" name="pQuanty" value="${pmDto.pQuanty}" required/>
		</div>
		<div class="form-group d-none"> 
			<label for="content">상세설명</label>
			<textarea class="form-control ck-content" id="content" name="pContent" rows="10" required></textarea>
		</div>
		<hr/>
		<p>게시판 선택(제품 분류 외 추가로 보여줄 게시판을 선택합니다.)</p>
		<input type="hidden" id="boardV" value="${pmDto.pBoard}"/>
		<div class="form-check-inline">
			<label for="board1" class="form-check-label">
				<input type="checkbox" class="form-check-input" id="board1" name="pBoard" value="new"/>
				new 게시판
			</label>
		</div>
		<div class="form-check-inline">
			<label for="board2" class="form-check-label">
				<input type="checkbox" class="form-check-input" id="board2" name="pBoard" value="best"/>
				best 게시판
			</label>
		</div><br/><br/>
		<div class="form-group">
			<label for="pColor">색상</label>
			<input type="color" class="form-control" id="pColor" name="pColor" style="width:50%;" value="${pmDto.pColor}"/>
		</div><br/>			
		<p>사이즈 선택(상품 설명에 사이즈 설명을 적어주세요)</p>
		<input type="hidden" id="sizeV" value="${pmDto.pSize}"/>
		<div class="form-check-inline">
			<label for="pSizef" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSizef" name="pSize" value="free"/>
				free
			</label>
		</div>
		<div class="form-check-inline">
			<label for="pSizes" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSizes" name="pSize" value="s"/>
				S
			</label>
		</div>
		<div class="form-check-inline">
			<label for="pSizem" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSizem" name="pSize" value="m"/>
				M
			</label>
		</div>
		<div class="form-check-inline">
			<label for="pSizel" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSizel" name="pSize" value="l"/>
				L
			</label>
		</div>
		<div class="form-check-inline">
			<label for="pSizexl" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSizexl" name="pSize" value="xl"/>
				XL
			</label>
		</div>
		<div class="form-check-inline">
			<label for="pSize" class="form-check-label">
				<input type="radio" class="form-check-input" id="pSize" name="pSize" value="etc"/>
				기타(그 외 사이즈는 상세설명란에 적어주세요)
			</label>
		</div><br/><br/>
		<p>판매 상태</p>
		<input type="hidden" id="stateV" value="${pmDto.pState}"/>
		<div class="form-check-inline">
			<label for="able" class="form-check-label">
				<input type="radio" class="form-check-input" id="able" name="pState" value="true"/>
				바로 판매 시작
			</label>
		</div>
		<div class="form-check-inline">
			<label for="disable" class="form-check-label">
				<input type="radio" class="form-check-input" id="disable" name="pState" value="false"/>
				추가 수정 예정(판매x)
			</label>
		</div>
		<hr/>
		<div class="form-group">
			<label for="pImage">대표 이미지</label>
			<input type="file" class="form-control" name="pPhoto" id="pImge" required/>
		</div>
		<input type="text" style="visibility:hidden;" id="originPhoto" name="originPhoto" value="${pmDto.pPhoto}"/>
		<div class="preview" id="mContainer1">
			<img id="defaultImg" class="mb-3" style="width:300px;" src="image/${pmDto.pPhoto}"/>
		</div>
		<hr/>
		<p>상세설명</p>
		<div id="toolbar-container" style="max-width:100%;"></div>
		<div id="ckeditor" class="ck-content" style="max-width:100%;min-height:400px;border:1px solid grey;line-height:0.8rem;"></div>
		<hr/>
		<button onclick="pmModi()" class="btn btn-primary" type="button">수정</button>&emsp; 
		<a id="productDelete" class="btn btn-danger" href="productDelete?pId=${pmDto.pId}">삭제</a>&emsp;
		<a class="productList btn btn-dark" href="productList">목록 보기</a>
		<button id="edmodi" type="submit" style="visibility:hidden;">form save</button> 
	</form>
</div>
<script>
//product img upload
function readMultipleImage(input){
   const multipleContainer1 = document.getElementById('mContainer1');
   //미리보기 공간
   if(input.files){
       //여러파일이 등록되었을때 배열로 받음
       console.log(input.files);
       document.getElementById("defaultImg").remove();
       const fileArr = Array.from(input.files);
       //받은 이미지를 표시할 임시 div
       const $colDiv1 = document.createElement('div');
       //파일목록(배열)을 분배(forEach)할 method
       fileArr.forEach(function(file, index){
           //파일리더, 임시img Div, 임시 img
           const reader = new FileReader();
           const $imgDiv = document.createElement('div');
           const $img = document.createElement('img');
           //임시 img tag에 class입력
           $img.classList.add('productImg');
           //label 생성과 그 하위로 img사용
           const $label = document.createElement('label');
           $label.classList.add('productImg-label');
 
           $label.textContent = file.name;
           //img container에 img와 label
           $imgDiv.appendChild($img);
           $imgDiv.appendChild($label);
           //입력(load)
           reader.onload = e => {
               $img.src=e.target.result;
               $imgDiv.style.width = 300 + 'px';
               $imgDiv.classList.add('mb-3');
           }
           console.log(file.name);
           //파일 수에 따라 처리
           $colDiv1.appendChild($imgDiv);
           reader.readAsDataURL(file);
       });
       //container에 입력
       multipleContainer1.appendChild($colDiv1);
   }
}
//이벤트 리스너
document.getElementById('pImge').addEventListener('change', function(e){
   readMultipleImage(e.target);
});
</script>

<script type="module">	
 DecoupledEditor
    .create( document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: { //이미지 처리 모듈
	   		uploadUrl: 'ckedit' //요청경로	   		
	   	},//기능 버튼 선택
	   	toolbar: ['ckfinder', '|','imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','fontsize',
	   		'fontfamily','insertTable','alignment', '|', 'fontColor', 'fontBackgroundColor']			
    })       
    .then(function(editorD) {
    	//window.editorResize = editor;
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editorD.ui.view.toolbar.element );        
    });
</script>
<script>
$(document).ready(function(){
//dto의 값 출력
	//ckeditor
	$("#ckeditor").html('${pmDto.pContent}');
	//pType
	let ptype = $("#typeV").val();
	if(ptype==="top"){
		$(":radio[id='ptype1']").attr("checked", true);
	}
	else if(ptype==="pant"){
		$(":radio[id='ptype2']").attr("checked", true);
	}
	else if(ptype==="skirt"){
		$(":radio[id='ptype3']").attr("checked", true);
	}
	else if(ptype==="outer"){
		$(":radio[id='ptype4']").attr("checked", true);
	}
	else if(ptype==="etc"){
		$(":radio[id='ptype5']").attr("checked", true);
	}
	//pBoard
	let pboard = $("#boardV").val();
	if(pboard.indexOf("new")>-1){
		$(":checkbox[id='board1']").attr("checked", true);
	}
	if(pboard.indexOf("best")>-1){
		$(":checkbox[id='board2']").attr("checked", true);
	}
	//pSize
	let psize = $("#sizeV").val();
	if(psize==="free"){
		$(":radio[id='pSizef']").attr("checked", true);
	}
	else if(psize==="s"){
		$(":radio[id='pSizes']").attr("checked", true);
	}
	else if(psize==="m"){
		$(":radio[id='pSizem']").attr("checked", true);
	}
	else if(psize==="l"){
		$(":radio[id='pSizel']").attr("checked", true);
	}		
	else if(psize==="xl"){
		$(":radio[id='pSizexl']").attr("checked", true);
	}
	else if(psize==="etc"){
		$(":radio[id='pSize']").attr("checked", true);
	}
	//pState
	let pstate = $("#stateV").val();
	if(pstate==="true"){
		$(":radio[id='able']").attr("checked", true);
	}
	else if(pstate==="false"){
		$(":radio[id='disable']").attr("checked", true);
	}
	//파일을 변경한 경우 originPhoto값 제거
	let fileChange = $("#pImge").val();
	if(fileChange != "" || fileChange != null){
		$("#originPhoto").val("_Changed");
		consol.log(fileChange);
	}
	
	//제품 삭제
	$("#productDelete").click(function(e){
		e.preventDefault();
		let con = confirm("모든 내용이 삭제됩니다. 진행하시겠습니까?");
		if(!con){
			return;
		}
		$.ajax({
			url:$("#productDelete").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("등록제품 목록입니다.");
			},
			error: function(){
				alert("product List: 서버 접속 실패");
			}			
		});
	});
});
//수정사항 저장
function pmModi(){
	$("#ckeditor svg").remove();
	let content = $("#ckeditor").html();
	$("#content").html(content);
	setTimeout(function(){
		$("#edmodi").trigger("click");
	},1000);
}
</script>
</body>
</html>