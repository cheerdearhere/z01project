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
<title>orderReadylist</title>
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
</head>

<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<form method="post" action="orderRequest" id="orderRequest">
	<div class="table-responsive-sm">
		<table id="orderReadyTable" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>정보</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="orderBody">
				<c:forEach items="${orderReadylist}" var="orDto">
					<tr>
						<td>
							<span class="orderNum" style='margin:auto'>${orDto.opId}</span>
						</td>
						<td>
							<div class='card'>
								<div class='row'>
									<div class='col-4'>
										<img src='image/${orDto.opPhoto}' alt='${orDto.opPhoto}' class='card-img'/>
									</div>
									<div class='col-8'>
										<div class='card-body'>
											<p class='card-text' style='overflow:hidden;'>
												<a href='productdetails?pId=${orDto.pId}' class='text-dark stretched-link pclick'>
													[[${orDto.pId}]] ${orDto.opName} || ${orDto.opColor} || ${orDto.opSize}
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<input type='number' value='${orDto.opQuanty}' id='changedQuanty${orDto.opId}' class='qty' style='width:50px;margin:auto;'/>
							<span class="variableID d-none">${orDto.opId}</span>
						</td>
						<td>
							${orDto.opPrice}
							<input type="hidden" id="changedPrice${orDto.opId}" class="prices" value="${orDto.opPrice}"/>
						</td>
						<td>
							<a href="deleteOrderList?opId=${orDto.opId}" class='btn btn-danger dBtn w-100'>
								<i class="fas fa-trash-alt"></i>
							</a><br/>
							<a href="moveToCart?opId=${orDto.opId}" class='btn btn-warning dBtn w-100'>
								<i class="fas fa-shopping-cart"></i>
							</a>
							<a href="dicountSelect?opId=${orDto.opId}" class='btn btn-info dBtn w-100'>
								<i class="fas fa-ticket-alt"></i>
							</a>							
							<input type="text" id="discountID" class="d-none"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr/>
	<div class="form-group">
		<label for="addressInput">주소 입력</label>
		<input type="text" id="addressInput" name="opAddress" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="phoneInput">연락처 입력</label>
		<input type="text" id="phoneInput" name="opPhone" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="userRequest">주문시 요청사항</label>
		<textarea rows="10" class="form-control" id="userRequest" placeholder="write your request about this orders."></textarea>
	</div>
	<div class="form-group">
		<label for="totalPrice">총액</label>
		<div id="totalPrice"></div>
		<input type="text" name="opTotal" class="form-control d-none"/>
	</div><!-- 아임포트 적용 -->
	<hr/>
	<div class="btn-group row container">
		<a href="main" class="btn btn-dark col-6">메인으로</a>
		<button id="orderrequest" class="btn btn-inline-success col-6" type="submit">주문진행</button>
	</div>
</form>
<script>
$(document).ready(function(){
	$(".pclick").click(function(e){
		e.preventDefault();
		let productPage=window.open("","_blank","left=10,width=300");
		$.ajax({
			url: $(e.target).attr("href"),
			type: "get",
			data:"",
			success:function(data){
				productPage.document.write(data);
				$("#current").text("제품상세");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
				productPage.close();
			}
		});
	});
	//주문이 없을때 
	if($(".orderNum").length==0){
		let cartList ="<tr><td colspan='6'><h3 class='text-secondary text-center display-1'>Empty!</h3></td></tr>";
		$("#orderBody").html(cartList);
	}
	//수량 변경에 따른 총액 변경
	let sumresult=0;
	function pricesSum(){
		let orSum=0;
		let sumR=0;
		let quanty=document.getElementsByClassName("qty");
		let quantyArr=Array.from(quanty);
		let prouctprice=document.getElementsByClassName("prices");
		let prouctpriceArr = Array.from(prouctprice);
		for(let i=0; i<quanty.length; i++){
			orSum=sumR;
			sumR+=quantyArr[i].value*prouctpriceArr[i].value;
		//	console.log(orSum+"+"+quantyArr[i].value+'*'+prouctpriceArr[i].value+"="+sumR);
		}
		sumresult = sumR.toLocaleString('ko-KR');
		$("#totalPrice").text(sumresult+" 원");
	}
	//수량 변경(DB는 요청할때만 저장)
	$(".qty").change(function(event){
		let qtyT = $(event.target);
		let changedQty= qtyT.val();
		let targetId = qtyT.next().text();
		pricesSum();
		console.log("변경 대상: "+targetId+"/변경 수량: "+changedQty+"/총액: "+sumresult+"원");
	});
	//item delete(DB고려해서 재작성)
	$(".dBtn").click(function(event){
		event.preventDefault();
		let eTarget=$(event.target);
		let dkeyname = eTarget.children("span").text();
		cartItem=localStorage.getItem(dkeyname);
		localStorage.removeItem(dkeyname);
			$.ajax({
			url: "productCart", 
			type: "get",
			data: "",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("my Page");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패!");
				$("#modal").trigger("click");
			}
		});
	});
	$("#orderRequest").submit(function(e){
		e.preventDefault();
		let orderRequests=[];
		let orderRequest;
		let priceInput;
		let quantyInput;
		let addressInput=$("#addressInput").val();
		let phoneInput=$("#phoneInput").val();
		let userRequest=$("#userRequest").val();
		let discountCode=$("#discountID").val();
		<c:forEach items="${orderReadylist}" var="orDto">
			priceInput = $("#changedPrice${orDto.opId}").val();
			quantyInput = $("#changedQuanty${orDto.opId}").val();
			orderRequest={
				opId:"${orDto.opId}",
				opName:"${orDto.opName}",
				opPrice: priceInput,
				opQuanty: quantyInput,
				opTotal: priceInput*quantyInput,
				opColor: "${orDto.opColor}",
				opSize: "${orDto.opSize}",
				opAddress: addressInput,
				opPhone: phoneInput,
				opRequest: userRequest,
				pId: "${orDto.pId}",
				uEmail: "${orDto.uEmail}",
				discountId: discountCode, 
				opPhoto: "${orDto.opPhoto}"
			};
			console.log(orderRequest);
			orderRequests.push(JSON.stringify(orderRequest));
		</c:forEach>
		console.log(orderRequests);
		$.ajax({
			url: "orderRequest",
			type: "post",
			dataType:"json",
			traditional: true,
			data: {
				orderRequestList : orderRequests,
				${_csrf.parameterName} : "${_csrf.token}"},
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("order request complete");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패!");
				$("#modal").trigger("click");
			}
		});
	});
	//페이지 로드시 수행
	pricesSum();
});
</script>
</body>
</html>