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
<title>product detail</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<!-- Chart.js API -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<!-- CKEditor API -->
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- stylesheet -->
<link href="style/header.css" type="text/css" rel="stylesheet"/>
<link href="style/home.css" type="text/css" rel="stylesheet"/>
<link href="style/footer.css" type="text/css" rel="stylesheet"/>
<link href="style/productdetails.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="col text-center tBar">
	<button type="button" class="btn btn-dark btn-sm btn-block active ">7월 쿠폰팩 최대 2만원 지급</button>
</div>
<div class="text-center">
	<a class="container text-center" href="home">
		<img src="media/logo.png" alt="회사 로고">
	</a>
</div>

<!-- products -->
<div id="productDetailMain" class="container mt-1">
	<!-- 상품 사진(상단) -->
	<div class = "single-product">
		<div class="row">
			<div class="col-6">
				<img src="image/${pmDto.pPhoto}" alt="Main Photo" class="ProductImage"/>
			</div>
		</div>
	</div>
	<!-- 상품 설명 및 구매/장바구니 버튼 -->
	<div class="col-6 text-dark single-product">
		<p>type: ${pmDto.pType}</p>
		<h4>${pmDto.pName}</h4>
		<h6>${pmDto.pPrice} 원</h6>
		<p>- 모델 착용 color: 
			<i class="fas fa-clone" style="color:${pmDto.pColor}"></i>
			<span id="sizeV">${pmDto.pColor}</span><br/>
			- 모델 사이즈: ${pmDto.pSize}
		</p>
		<select id="sizeSelect" name="pSize">
			<option value="free">free</option>
			<option value="s">S</option>
			<option value="m">M</option>
			<option value="l">L</option>
			<option value="xl">XL</option>
			<option value="etc">etc</option>
		</select><br/>
		<input type="hidden" value="${pmDto.pSize}"/>
		<input type="hidden" name="uEmail" value="${user_id}"/>
		<input type="hidden" name="pPrice" value="${pmDto.pPrice}"/>
		<input type="hidden" id="maxQuanty" value="${pmDto.pQuanty}"/>
		<input type="number" id="orderQuanty" name="pQuarnty" value="1"/><br/><small>남은 수량: ${pmDto.pQuanty}</small><br/>
		<button class="btn1" onclick="inCart()">Add to Cart</button><br/>
		<button class="btn2" onclick="inOrder()">Buy</button>
	</div>
</div>
 <!--리뷰 등 중앙 탭-->
 <div class="tab_content col">
 	<input type="radio" name="tabmenu" id="tab01" checked="checked"/>
 	<label for="tab01">DETAILS</label>
 	<input type="radio" name="tabmenu" id="tab02"/>
 	<label for="tab02">REVIEW</label>
 	<input type="radio" name="tabmenu" id="tab03"/>
 	<label for="tab03">SIZE</label>

<!-- 컨텐츠 요소 -->
	<!--디테일탭-->
	<div class="conbox con1"> 
		<div id="pContent" class="ck-content">${pmDto.pContent}</div>
		<div id="toolbar-container" class="d-none" style="max-width:100%;"></div>
		<div id="ckeditor" class="ck-content d-none"></div>
	</div>
	<!--리뷰탭-->
	<div id="reviewContainer" class="conbox con2">
		<h3 class="text-center" id=rBoard>REVIEW BOARD</h3>	
		<table id="searchTable" class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>Title</th>
					<th>ID</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody id="reviewBody">	
				<c:forEach items="${listContent}" var="dto">
					<tr>
						<td>${dto.rbId}</td>
						<td>
							<c:forEach begin="1" end="${dto.rIndent}">-</c:forEach>
							<a class="contentView" href="productReviewContent?rbId=${dto.rbId}">${dto.rTitle}</a>
						</td>
						<td>${dto.uEmail}</td> 
						<td>${dto.rDate}</td> 	
				    </tr>	
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<!-- 페이지 표시 -->
	<nav aria-label="Page navigation"> 
		<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0">
		</ul>
	</nav>

	<div class="conbox con3"><!--사이즈 설명 탭: pdf-->
		<div id="sizePdf" style="height:720px;"></div>
	</div>
</div>

<!--최상단 이동 버튼-->
<div class="moveTopBtn">^<br/>TOP</div>

<!-- pdfobject javascript 적용 -->
<script src="js/pdfobject.js"></script>

<!--PDFObject객체로 method 호출 -->
<script>
PDFObject.embed("pdf/folio.pdf","#sizePdf");
</script>

<!-- top이동 버튼 -->
<script>
const $topBtn = document.querySelector(".moveTopBtn");
$topBtn.onclick = () => {
	window.scrollTo({ top: 0, behavior: "smooth" });
}
</script>
<!-- CK editor module -->
<script type="module">	
 DecoupledEditor
    .create(document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: {
	   		uploadUrl: 'ckedit' 		
	   	},
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
<!-- DTO값 출력 -->
<script>
$(document).ready(function(){
	//ckeditor의 값 출력
	$("#ckeditor").html('${pmDto.pContent}');
	//pSize
	let sizevalue = $("#sizeV").val();
	$("#sizeSelect").val(sizevalue).prop("selected",true);
});
</script>
<!-- cart: db입력 x -->
<script>
let userid="<c:out value='${user_id}'></c:out>";
function inCart(){
	if(typeof(Storage)=="undefined"){
		return;
	}
	//같은 제품 적용, 삭제 대비
	let maxKeyValue = 0;
	let keyValue;
	let pIdCheck=-1;
	let newpId = "${pmDto.pId}";
	for(let i=0 ; i<localStorage.length ; i++){
		keyName = localStorage.key(i);
		let oldItem=localStorage.getItem(keyName);
		let oldItemObj=JSON.parse(oldItem);
		if(newpId==oldItemObj.pId){
			pIdCheck = keyName;
		}
		if(parseInt(keyName) > maxKeyValue) {
			maxKeyValue = parseInt(keyName);
			keyValue = maxKeyValue;
		}
	}
	if(pIdCheck > -1){
		keyValue = pIdCheck;
	}
	else{
		keyValue = maxKeyValue + 1;
	}
	let orderQty = $("#orderQuanty").val();
	let maxQty = $("#maxQuanty").val();
	//입력값이 없거나 잘못된 경우
	if(parseInt(orderQty) < 1){
		alert("주문 수량을 입력하세요");
		return;
	}
	if(parseInt(orderQty) > parseInt(maxQty)){
		alert("최대 수량을 넘었습니다. 남은 수량을 확인해주세요.");
		return;
	}
	let productInfo = {
			pId: "${pmDto.pId}",
			pType: "${pmDto.pType}",
			pName: "${pmDto.pName}",
			pPrice: "${pmDto.pPrice}",
			pQuanty: orderQty,
			pPhoto: "${pmDto.pPhoto}",
			pBoard: "${pmDto.pBoard}",
			pColor: "${pmDto.pColor}",
			pSize: "${pmDto.pSize}",
			uEmail: userid,
			pTotal: "${pmDto.pPrice}"*orderQty
	}
	localStorage.setItem(keyValue, JSON.stringify(productInfo));
	alert("장바구니에 저장했습니다.");
}
<!-- order입력 -->
function inOrder(){
	let quantyInput=$("#orderQuanty").val();
	let orderRequest={
		opName:"${pmDto.pName}",
		opPrice: "${pmDto.pPrice}",
		opQuanty: quantyInput,
		opTotal: "${pmDto.pPrice}"*quantyInput,
		opColor: "${pmDto.pColor}",
		opSize: "${pmDto.pSize}",
		pId: "${pmDto.pId}",
		uEmail: userid,  
		opPhoto: "${pmDto.pPhoto}",
		${_csrf.parameterName} : "${_csrf.token}"
	}
	console.log(orderRequest);
	let conf=confirm("주문으로 저장하시겠습니까?");
	if(conf){
		$.ajax({
			url: "oneOrderRequest",
			type: "post",
			data: orderRequest,
			success: function(data){
				alert(data);
			},
			error: function(){
				alert("저장완료");
			}
		});
	}
	else{
		alert("저장을 취소했습니다.");
	}
}
</script>
<script>
$(function(){		
	//내용보기
	$(".contentView").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success: function(data){
				$("#reviewContainer").html(data);
			},
			error: function(){
				alert("서버 접속 실패");
			}
		});
	});
	//쓴 글이 없을때 
	if($(".contentView").length==0){
		let noneReview ="<tr><td colspan='6'><h3 class='text-secondary text-center'>작성한 리뷰가 없습니다.</h3></td></tr>";
		$("#reviewBody").html(noneReview);
	}
	else{
		window.pagObj = $("#pagination").twbsPagination({
			totalPages: $(".contentView").length,
			visiblePages: 10,
			onPageClick : function(event,page) {
				console.info(page + ' (from options)');
				$(".page-link").on("click",function(event){
					event.preventDefault(); 	 			
					let peo = $(event.target); 			
					let pageNo = peo.text();				
					let purl;
					let pageA;
					let pageNo1;
					let pageNo2;
					
					if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
						purl = "plist?pageNo=" + pageNo;
					}
					else if(pageNo == "Next") {
						pageA = $("li.active > a");
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo);
						pageNo2 = pageNo1 + 1;
						purl = "plist?pageNo=" + pageNo2;
					}
					else if(pageNo == "Previous") {
						pageA = $("li.active > a");
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo);
						pageNo2 = pageNo1 - 1;
						purl = "plist?pageNo=" + pageNo2;
					}
					else if(pageNo == "First") {					
						purl = "plist?pageNo=" + 1;
					}
					else if(pageNo == "Last") {					
						purl = "plist?pageNo=" + 35;
					}
					else {					
						return;					
					}	
					
					$.ajax({
						url : purl,
						type : "get",
						data : "",
						success : function(data) {
							$("#reviewContainer").html(data);						
						},
						error : function() {
							alert("서버 접속 실패");
						}					
					});
				});
			}
		})//chaining
		.on('page', function(event, page){
			console.info(page + ' (from event listening)');	    
		});
	}//else	
});
</script>

</body>
</html>