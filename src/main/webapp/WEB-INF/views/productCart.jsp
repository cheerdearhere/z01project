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
th{
	text-align:center;
}
</style>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<form method="post" action="orderSave" id="orderSaveList">
	<input type="text" class="d-none" name="orderSaveItems" id="orderSaveItems"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="table-responsive-sm">
		<table id="cartTable" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="checkedAll"/>
					</th>
					<th>no.</th>
					<th>정보</th>
					<th>수량</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="cartBody"></tbody>
		</table>
	</div>
	<hr/>
	<div class="btn-group row container">
		<a href="main" class="btn btn-dark col-6">메인으로</a>
		<button id="orderForm" class="btn btn-inline-success col-6" type="submit">목록 저장하기</button>
	</div>
</form>
<!-- 장바구니 호출 -->
<script>
$(document).ready(function(){
	if(typeof(Storage)=="undefined") {
		return;
	}

	let i;//index
	let keyName;//key
	let cartItem;//cartItem JSON
	let cartItemObj;//javascript object
	
	//data
	let pId;
	let pType;
	let pName;
	let pPrice;
	let pQuanty;
	let pPhoto;
	let pBoard;
	let pColor;
	let pSize;
	let uEmail;
	let pTotal;
	let currentUser = '${user_id}';

	//cart list
	let cartList ="";
	for(i=0;i<localStorage.length;i++){
		keyName=localStorage.key(i);
		
		cartItem=localStorage.getItem(keyName);
		cartItemObj=JSON.parse(cartItem);
		
		pId=cartItemObj.pId;
		pType=cartItemObj.pType;
		pName=cartItemObj.pName;
		pPrice=cartItemObj.pPrice;
		pQuanty=cartItemObj.pQuanty;
		pPhoto=cartItemObj.pPhoto;
		pBoard=cartItemObj.pBoard;
		pColor=cartItemObj.pColor;
		pSize=cartItemObj.pSize;
		uEmail=cartItemObj.uEmail;
		pTotal=cartItemObj.pQuanty*cartItemObj.pPrice;
		if(uEmail==currentUser){
			cartList +="<tr><td><input style='margin:auto' type='checkbox' name='productKey' value='"+keyName
				+ "'/></td><td><span style='margin:auto'>"+pId+"</span></td><td><div class='card'><div class='row'><div class='col-4'><img src='image/"
				+ pPhoto+"' alt='"+pPhoto+"' class='card-img'/></div><div class='col-8'><div class='card-body'>"
				+ "<p class='card-text' style='overflow:hidden;'><a href='productdetails?pId="+pId+"' class='text-dark stretched-link pclick'>"
				+ "[["+pBoard+"]] "+ pName +" || " + pColor +" || "+ pType +" || "+pPrice+"원</a></p></div></div></div></div></td>"
				+ "<td><input type='number' value='"+pQuanty+"' name='pQuanty' class='qty' style='width:50px;margin:auto;'/>"
				+ "</td><td class='totalprice'>"+pTotal+"</td><td><button type='button' class='btn btn-danger dBtn' style='margin:auto;''><i class='fas fa-trash-alt'></i><span class='d-none'>"
				+ keyName+"</span></button></td></tr>";
			
			$("#cartBody").html(cartList);
		}
	}
	if($(':checkbox').length<2){
		cartList ="<tr><td colspan='6'><h3 class='text-secondary text-center display-1'>Cart is Empty!</h3></td></tr>";
		$("#cartBody").html(cartList);
	}

	//수량 변경
	$(".qty").change(function(event){
		let qtyT = $(event.target);
		let changedQty= qtyT.val();
		let targetKey = qtyT.parent().nextAll().find('span').text();
		let targetTotal= qtyT.parent().next();
		
		cartItem=localStorage.getItem(targetKey);
		cartItemObj=JSON.parse(cartItem);
		let targetData = {
				pId:cartItemObj.pId,
				pType:cartItemObj.pType,
				pName:cartItemObj.pName,
				pPrice:cartItemObj.pPrice,
				pQuanty:changedQty,
				pPhoto:cartItemObj.pPhoto,
				pBoard:cartItemObj.pBoard,
				pColor:cartItemObj.pColor,
				pSize:cartItemObj.pSize,
				uEmail:cartItemObj.uEmail,
				pTotal:cartItemObj.pPrice*changedQty		
		}
		localStorage.setItem(targetKey,JSON.stringify(targetData));
		targetTotal.text(cartItemObj.pPrice*changedQty);
	});
		
	//item delete in cart 
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
	
	//주문창으로 이동(key값 list)
	$("#orderSaveList").submit(function(event){
		event.preventDefault();
		
		let productkey;
		let productName;
		let productPrice;
		let productColor;
		let productSize;
		let productPhoto;
		let userId;
		let productId;
		let orderQty;
		let saveItem;
		let saveItemObj;
		let saveOrderList="";
		
		let selectedEls = document.querySelectorAll('input[name="productKey"]:checked');
		if(selectedEls.length==0){
			$("#mbody").text("선택한 제품이 없습니다.");
			$("#modal").trigger("click");
			$("#myPage").trigger("click");
		}
		else{
			selectedEls.forEach((el) => {
				productKey = el.value;
				saveItem = localStorage.getItem(productKey);
				saveItemObj=JSON.parse(saveItem);
				
				productName = saveItemObj.pName;
				productPrice = saveItemObj.pPrice;
				productColor = saveItemObj.pColor;
				productSize = saveItemObj.pSize;
				productId = saveItemObj.pId;
				userId = saveItemObj.uEmail;
				orderQty = saveItemObj.pQuanty;
				productPhoto = saveItemObj.pPhoto;
				
				saveOrderList += productName+"``"+productPrice+"``"+orderQty+"``"+productColor+"``"+productSize+"``"+productId+"``"+userId+"``"+productPhoto+"%%%";
			});
			$("#orderSaveItems").val(saveOrderList);
			$.ajax({
				url:$("#orderSaveList").attr("action"),
				type:"post",
				data:$("#orderSaveList").serialize(),
				success: function(data){
					$("#mainRegion").html(data);
					$("#current").text("장바구니 내용을 주문대기창에 전달했습니다.");
					selectedEls.forEach((el) => {
						let afterSave = el.value;
						localStorage.removeItem(afterSave);
					});
				},
				error: function(){
					$("#mbody").text("서버 접속 실패!");
					$("#modal").trigger("click");
				}
			});
		}
	});
});
</script>
<!-- product details page load -->
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
});
</script>
<!-- checked All button-->
<script>
$("#checkedAll").click(function(){
	$(':checkbox').prop('checked',this.checked);
});
$(':checkbox').click(function() {
	let checkboxNum = $(':checkbox').length;
	let checkedBoxNum = $(':checkbox').filter(':checked').length;
	if(checkboxNum==checkedBoxNum){
		$('#checkedAll').prop('checked',true);
	}
	else{
		$('#checkedAll').prop('checked',false);
	}
});
</script>
</body>
</html>