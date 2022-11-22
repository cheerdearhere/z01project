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
<title>Insert</title>
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

<h1>Home/Main 화면관리</h1>
<div class="container border">
	<h3 class="text-center text-danger">입력시 주의사항</h3>
	<p>1. 파일 이름을 꼭 확인해주세요. </p>
	<p>2. 용량(5Mb)과 크기를 확인해주세요. <br/>
	&emsp;- 슬라이드에 사용할 이미지는 한번에 3개의 파일을 등록합니다.
	&emsp;- 슬라이드에 사용할 이미지의 사이즈는 너비 2560px, 높이 1105px을 권장합니다.
	&emsp;- 홈 화면의 main 이미지의 사이즈는 너비 1200px, 높이 1530px을 권장합니다.
	</p>
	<p>3. 저장 버튼을 누르면 바로 홈페이지에 적용됩니다. 누르기 전에 한번 더 확인해주세요!!</p>
	<p>4. 인스타그램과 유튜브 주소는 이전에 등록했던 정보입니다. 변경된것이 없다면 그대로 저장하시면 됩니다.(삭제하면 링크가 사라짐)</p>
	<p>이전 변경일자: ${homeDto.hmDate}</p>
</div>
<br/><br/>
<div class="container mb-5">
	<form id="mainpageWrite" action="mainPageWrite?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<!-- 캐로절 파일: 링크로 할지 고민 필요 -->
		<div class="form-group">
			<label for="hmCRFile">슬라이드 사진 파일(3개씩 등록)</label>
			<input type="file" class="form-control" id="hmCRFile" name="hmSlide" multiple="multiple"/>
		</div>
		<!-- image slider-->	
		<div id="hmCRFileTest" class="carousel slide p-0" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#hmCRFileTest" data-slide-to="0" class="active"></li>
				<li data-target="#hmCRFileTest" data-slide-to="1"></li>
				<li data-target="#hmCRFileTest" data-slide-to="2"></li>
			</ul>
 			<div class="carousel-inner">
				<div class="carousel-item active" id="carouselPV1">
					<div class="carousel-caption">
						<h3 id="crname1" style="color:#000000;background:lightgray">파일1</h3>
					</div>   	
				</div>
				<div class="carousel-item" id="carouselPV2">
					<div class="carousel-caption">
						<h3 id="crname2" style="color:#000000;background:lightgray">파일2</h3>
					</div>   	
				</div>
				<div class="carousel-item" id="carouselPV3">
					<div class="carousel-caption">
						<h3 id="crname3" style="color:#000000;background:lightgray">파일3</h3>
					</div>   	
				</div>
			</div>
			<!-- 좌,우 콘트롤은 a를 사용하고 앞전으로 뒤로 가기를 처리 -->
			<a class="carousel-control-prev" href="#hmCRFileTest" data-slide="prev"> <!-- 앞전 -->
				<span class="carousel-control-prev-icon"></span> <!-- 아이콘처리 -->
			</a>
			<a class="carousel-control-next" href="#hmCRFileTest" data-slide="next"> <!-- 뒤 -->
				<span class="carousel-control-next-icon"></span> <!-- 아이콘처리 -->
			</a>
		</div><hr/>
		
		<!-- 이미지 사진 -->
		<div class="form-group">
			<label for="hmMain">화면 main 사진</label>
			<input type="file" class="form-control" id="hmMain" name="hmMain"/>
		</div>
		<div id="hmMainPV">
		</div><hr/>

		<!-- social URL -->
		<div class="form-group">
			<label for="hmInstar">인스타그램 주소</label>
			<input type="text" class="form-control" id="hmInstar" name="hmInstar" value="${homeDto.hmInstar}"/>
		</div>
		<div class="form-group">
			<label for="hmYoutube">유튜브 주소</label>
			<input type="text" class="form-control" id="hmYoutube" name="hmYoutube" value="${homeDto.hmYoutube}"/>
		</div>
		<button type="submit" class="btn btn-success">확인 후 저장</button>
	</form>
</div>

<script>
//슬라이드 파일 미리보기
function carouselPreview(input){
	const carouselpv1 = document.getElementById('carouselPV1');	
	const carouselpv2 = document.getElementById('carouselPV2');
	const carouselpv3 = document.getElementById('carouselPV3');
	if(input.files){
		const carouselArr = Array.from(input.files);
		if(carouselArr.length !== 3){
			alert("슬라이드는 3개씩 올려주세요.");
			return false;
		}
		carouselArr.forEach(function(file, index){
			const reader = new FileReader();
			const $img = document.createElement('img');
			let crCaption = (index+1)+': ' + file.name;
			let crNum = index+1;
			reader.onload = e =>{
				$img.src=e.target.result;
				$img.alt="file" + crNum;
	            $img.style.width = 100+"%";
	            $img.style.height = 100+"%";
			};
			console.log(crCaption);
			if(index==0){
				carouselpv1.appendChild($img);
				document.getElementById('crname1').innerHTML=crCaption;
			}
			else if(index==1){
				carouselpv2.appendChild($img);
				document.getElementById('crname2').textContent=crCaption;
			}
			else if(index==2){
				carouselpv3.appendChild($img);
				document.getElementById('crname3').textContent=crCaption;
			}
			reader.readAsDataURL(file);
		});
	}
}
function mainPreview(input){
	const hmMainpv = document.getElementById('hmMainPV');
	if(input.files){
		const filesArr = Array.from(input.files);		
		filesArr.forEach(function(file, index){
			const reader = new FileReader();
			const $img = document.createElement('img');
			reader.onload = e =>{
				$img.src=e.target.result;
			};
			hmMainpv.appendChild($img);
			reader.readAsDataURL(file);
		});
	}
}
//슬라이드 파일 미리보기 이벤트 리스너
document.getElementById('hmCRFile').addEventListener('change', function(e){
	carouselPreview(e.target);
});
//main 사진 미리보기 이벤트 리스너
document.getElementById('hmMain').addEventListener('change', function(e){
	mainPreview(e.target);
});
</script>
<script>
$(document).ready(function(){
	$("#mainpageWrite").submit(function(event){
		let con = confirm("확인을 누르시면 바로 적용됩니다. 적용하시겠습니까?");
		if(con==false){
			return false;
		}
	});
});
</script>
</body>
</html>