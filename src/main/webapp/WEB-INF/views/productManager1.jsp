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
<title>product manager</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- external style sheet -->
<link href="style/productManager.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<nav class="row justify-content-center text-center">
	<div class="container-fluid">
		<a class="navbar-brand" href="main"><img src="media/logo.png" alt="회사 로고"></a>
	</div>
</nav>
<nav class="manageTab navbar navbar-expand-md nnavbar-dark bg-dark text-center">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggle">
		<span class="fas fa-bars" style="color:white;"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarToggle">
		<ul class="navbar-nav nav nav-tabs mx-auto" style="width:100%;" role="tablist">
			<li class="nav-item">
				<a href="#managerHome" class="nav-link active" data-toggle="tab">
					<i class="fas fa-home"></i> Home
				</a>
			</li>
			<li class="nav-item">
				<a href="#productRegi" class="nav-link productRegi" data-toggle="tab">
					<i class="fas fa-hand-holding-heart"></i> 상품 등록
				</a>
			</li>
			<li class="nav-item">
				<a href="#productList" class="nav-link productList" data-toggle="tab">
					<i class="fas fa-grip-horizontal"></i> 상품 목록
				</a>
			</li>
			<li class="nav-item">
				<a href="#orderList" class="nav-link orderList" data-toggle="tab">
					<i class="fas fa-list-ul"></i> 주문 목록
				</a>
			</li>
			<li class="nav-item">
				<a href="#clientHelp" class="nav-link clientHelp" data-toggle="tab">
					<i class="fas fa-eraser"></i> 도움말 관리
				</a>
			</li>
			<li class="nav-item">
				<a href="#clientRequest" class="nav-link clientRequest" data-toggle="tab">
					<i class="fas fa-eraser"></i> 교환/반품/환불
				</a>
			</li>
			<li class="nav-item">
				<a href="#userReview" class="nav-link userReview" data-toggle="tab">
					<i class="fas fa-grin-alt"></i> 고객 리뷰
				</a>
			</li>
			<li class="nav-item">
				<a href="#recruit" class="nav-link recruit" data-toggle="tab">
					<i class="fas fa-laugh"></i> 채용 관리
				</a>
			</li>
			<li class="nav-item">
				<a href="#managerHelp" class="nav-link managerHelp" data-toggle="tab">
					<i class="fas fa-question-cicle">
				</i> 판매자 문의</a>
			</li>
			<li class="nav-item">
				<a href="logoutView" class="nav-link"><i class="fas fa-lock-open">
				</i> logout</a>
			</li>
		</ul>
	</div>
</nav>
<section class="mb-5">
	<div class="tab-content">
		<div id="managerHome" class="container tab-pane bg-white active">
			<h1>관리자 홈</h1>
			<div class="row">
				<div class="card-columns mb-5">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black; position:-webkit-sticky; ">
						<div class="card-body text-center">
							<h4>상품 등록</h4>
							<p class="card-text">상품 정보를 등록하는 페이지입니다.</p>
							<a href="#productRegi" class="card-link stretched-link text-dark productRegi" data-toggle="tab">click</a> 
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">	
						<div class="card-body text-center">
							<h4>상품 목록</h4>
							<p class="card-text">등록한 상품의 목록이 있는 페이지입니다.</p>
							<a href="#productList" class="card-link stretched-link text-dark productList" >click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>주문 목록</h4>
							<p class="card-text mb-1">주문이 들어온 상품에 대한 페이지입니다.</p>
							<a href="#orderList" class="card-link stretched-link text-dark orderList" data-toggle="tab">click</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="card-columns mb-5">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>고객 안내</h4>
							<p class="card-text">이용약관, 구매 가이드 등 도움말을 관리합니다.</p>
							<a href="#clientHelp" class="card-link stretched-link text-dark clientHelp" data-toggle="tab">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h5>교환/반품/환불 관리</h5>
							<p class="card-text">제품에대한 고객의 요청(교환, 반품, 환불)을 관리합니다.</p>
							<a href="#clientRequest" class="card-link stretched-link text-dark clientRequest" data-toggle="tab">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>고객 리뷰 관리</h4>
							<p class="card-text">고객이 구입한 상품에 남긴 리뷰를 관리합니다.</p>
							<a href="#userReview" class="card-link stretched-link text-dark userReview" data-toggle="tab">click</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="card-columns mb-5">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>채용관리</h4>
							<p class="card-text">구인정보를 관리하는 페이지입니다.</p>
							<a href="#recruit" class="card-link stretched-link text-dark recruit" data-toggle="tab">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>판매자 문의</h4>
							<p class="card-text">페이지를 운영하실때 도움이 필요하시면 연락주세요.</p>
							<a href="#managerHelp" class="card-link stretched-link text-dark managerHelp" data-toggle="tab">click</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="productRegi" class="container tab-pane fade">
           <h1>상품등록페이지</h1>
           <form id="productRegi-form" action="#" method="post">
               <div class="form-group">
                   <label for="pName">상품명</label>
                   <input type="text" class="form-control" id="pName" name="pName" required/>
               </div>
               <div class="form-group">
                   <label for="pNum">등록번호</label>
                   <input type="text" class="form-control" id="pNum" name="pNum" required/>
               </div>
               <div class="form-group">
                   <label for="pDetail">상세설명</label>
                   <textarea class="form-control" id="pDetail" name="pDetail" rows="10" required></textarea>
               </div>
               이미지 업로드<br/>
               <div class="row">
                   <div class="preview" id="mContainer1"></div>
                   <div class="preview" id="mContainer2"></div>
               </div>
               <input style="display:block;" type="file" name="productImges" id="pImges" multiple/><br/>
               <hr/>
               <div class="form-check">
                   할인/쿠폰
                   <label>
						<input class="form-check..." type="checkbox" name="coupon" value="coupon1"/>
                   		첫 구매 할인
                   </label>
                   <label>
 	                  <input class="form-check..." type="checkbox" name="coupon" value="coupon3"/>
              			회원 특가
              		</label>
              		<label>
	                   <input class="form-check..." type="checkbox" name="coupon" value="coupon2"/>
						...
					</label>
               </div>
               <hr/>
               <button class="btn btn-success" type="submit">제품 등록</button> &emsp; <button class="btn btn-danger" type="reset">다시 작성</button> &emsp;
               <a type="button" class="btn btn-warning" href="#managerHome" data-toggle="tab">취소</a>
           </form>
        </div>
		<div id="productList" class="container tab-pane fade">
			<h1>상품 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th>등록번호</th>
						<th>표시이름</th>
						<th>등록날짜</th>
						<th>가격</th>
						<th>수량</th>
						<th>종류</th>
						<th>new/best</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="productDto">
						<tr>
							<td>${productDto.pId}</td>
							<td>
								<a href="MproductView?pId=${productDto.pId}" class="managePclick btn btn-primary stretched-link">
									${productDto.pName}
								</a>							
							</td>
							<td>${productDto.pDate}</td>
							<td>${productDto.pPrice}</td>
							<td>${productDto.pNum}</td>
							<td>${productDto.pType}</td>
							<td>${productDto.pBoard}</td>
							<td>${productDto.pState}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
			//productMView
			$(document).ready(function(){
				$(".productList").click(function(e){
					e.preventDefault();
					$.ajax({
						url:"#productList",
						type:"get",
						data: "",
						success: function(data){
							$("#productList").html(data);
						},
						error: function(){
							alert("product List: 서버 접속 실패");
						}
					});
				});
				$(".managePclick").click(function(e){
					e.preventDefault();
					let evo = $(e.target);
					$.ajax({
						url: evo.attr("href"),
						type: "get",
						data: "",
						success: function(data){
							$("#productList").html(data);
						},
						error: function(){
							alert("product details: 서버 접속 실패");
						}
					});
				});
			});
			</script>
		</div>
		<div id="orderList" class="container tab-pane fade">
			<h1>주문 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th>...</th>
						<th>...</th>
						<th>등...</th>
						<th>수..</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderlist}" var="order">
						<tr>
							<td>${order.pId}</td>
							<td>
								<a href="orderView?pId=${order.pId}">
									${order.pObject}
								</a>
							</td>
							<td>${order.pDate}</td>
							<td>${order.pSellNum}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="clientHelp" class="container tab-pane fade">
			<h1>도움말 관리</h1>
		</div>
		<div id="clientRequest" class="container tab-pane fade">
			<h1>교환/반품/환불</h1>
		</div>
		<div id="userReview" class="container tab-pane fade">
			<h1>고객 리뷰 게시판</h1>
				<table class="table">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>고객명</th>
						<th>등록날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviewlist}" var="review">
						<tr>
							<td>${review.rId}</td>
							<td>
								<a href="reviewContent?rId=${review.rId}">
									${review.rTitle}
								</a>
							</td>
							<td>${review.uId}</td>
							<td>${review.rDate}</td>
							<td>${review.rHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="recruit" class="container tab-pane fade">
			<h1>채용정보</h1>
		</div>
		<div id="managerHelp" class="container tab-pane fade">
			<h1>관리자 문의 정보</h1>
			<hr/>
			<div class="card border border-secondary">
				<img class="card-img" src="https://cdn.pixabay.com/photo/2022/06/19/04/25/cat-7271017_960_720.jpg" alt="callcenter"/>
				<div class="card-body">
					<h2 class="card-title">전화 상담</h2>
					<p class="card-text">
						<p>
							<i class="fas fa-phone"></i> 
							000-0000-0000<br/>
							111-1111-1111
						<p>
					</p>
				</div>
			</div>
			<hr/>
			<div class="card border border-secondary">
				<img class="card-img" src="https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849825_960_720.jpg" alt="callcenter"/>
				<div class="card-body">
					<h2 class="card-title">온라인 상담</h2>
					<p class="card-text">
						<a class="text-dark" href="#chat">
							<i class="fas fa-keyboard"></i> QnA 게시판
						</a> &emsp;
						<a class="text-success" href="#mail">
							<i class="fas fa-mail-bulk"></i> 메일 보내기
						</a>&emsp;
						<a class="text-warning" href="#kakao">
							<i class="fas fa-comments"></i> 카카오톡
						</a>
					</p>
				</div>
			</div>			
			<hr/>
			<div class="card border border-secondary">
				<img class="card-img" src="https://cdn.pixabay.com/photo/2017/10/17/10/03/contact-2860030_960_720.jpg" alt="visiting"/>
				<div class="card-body">
					<h2 class="card-title">방문상담</h2>
					<p class="card-text">
						<p>
							<i class="fas fa-city"></i> 오시는 길: 서울특별시 광진구...
						</p>
						<a class="btn btn-outline-warning" href="https://map.kakao.com/">방문 경로 알아보기</a>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
//product img upload
function readMultipleImage(input){
   const multipleContainer1 = document.getElementById('mContainer1');
   const multipleContainer2 = document.getElementById('mContainer2');
   //미리보기 공간
   if(input.files){
       //여러파일이 등록되었을때 배열로 받음
       console.log(input.files);
       const fileArr = Array.from(input.files);
       //받은 이미지를 표시할 임시 div
       const $colDiv1 = document.createElement('div');
       const $colDiv2 = document.createElement('div');
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
 
           $label.textContent = (index+1) + '. ' + file.name;
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
           if(index%2 == 0) {
               $colDiv1.appendChild($imgDiv);
           }
           else{
               $colDiv2.appendChild($imgDiv);
           }
           reader.readAsDataURL(file);
       });
       //container에 입력
       multipleContainer1.appendChild($colDiv1);
       multipleContainer2.appendChild($colDiv2);
   }
}
//이벤트 리스너
document.getElementById('pImges').addEventListener('change', function(e){
   readMultipleImage(e.target);
});
</script>
</body>
</html>