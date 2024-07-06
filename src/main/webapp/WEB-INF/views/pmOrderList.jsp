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
<title>pmOrderList</title>
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>-->
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
<!-- JS PDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.2.11/jspdf.plugin.autotable.min.js"></script>
<!-- tableHTMLExport -->
<script src="js/tableHTMLExport.js"></script>
<!-- HTML to canvas -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="row">
	<form id="searchForm" class="col-6" style="display:inline" action="#">
		<input id="searchInput" class="form-control ml-sm-2 w-100" type="text" placeholder="Search"/>
	</form>
	<div class="btn-group col-6">
		<button id="json" class="btn btn-outline-primary">TO JSON</button>
		<button id="csv" class="btn btn-outline-info">TO CSV</button>
		<button id="pdf" class="btn btn-outline-danger">TO PDF</button>
		<button id="print" class="btn btn-outline-dark" onclick=" window.print()">전체화면 인쇄</button>
	</div>
</div>
<div class="table-responsive-sm">
	<table id="orderReadyTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>제품명</th>
				<th>양</th>
				<th>색</th>
				<th>size</th>
				<th>주문날짜</th>
				<th>주문상태</th>
				<th>변경</th>
			</tr>
		</thead>
		<tbody id="searchInput">
			<c:forEach items="${allOrderList}" var="orDto">
				<tr>
					<td>
						<span class="orderNum" style='margin:auto'>${orDto.opId}</span>
					</td>
					<td>
						<a href="pmOrderDetails?opId=${orDto.opId}" class="pmOrderDetails btn btn-outline-success w-100">${orDto.opName}</a>
					</td>
					<td>${orDto.opQuanty}</td>
					<td style="color:${orDto.opColor}">${orDto.opColor}</td>
					<td>${orDto.opSize}</td>
					<td>${orDto.opDate}</td>
					<td>${orDto.opState}</td>
					<td>
						<a href="#" class="opStateBtn btn btn-success w-100">변경</a>
						<input type="hidden" value="${orDto.opId}"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- modal -->
<button type="button" id="stateModalBtn" class="btn d-none" data-toggle="modal" data-target="#stateModal">
	Open modal
</button>
<div class="modal fade" id="stateModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header bg-light">
				<h4 id="mBody" class="modal-title text-center">
					<i class="fa fa-truck-moving" aria-hidden="true"></i> 
				</h4>
				<button type="button" class="close mclose" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form action="opStateModify" method="post" id="opStateModify">
					<div class="form-group">
						<select name="opState" class="form-control" id="stateSelect">
							<option value="ordered">주문완료</option>
							<option value="confirm">결제확인</option>
							<option value="ready">제품준비</option>
							<option value="delivery">배송시작</option>
							<option value="arrive">배송완료</option>
						</select>
					</div>
					<input type="hidden" name="opId" id="orderId"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button type="submit" class="btn btn-success btn-block">제출</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary mclose" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$(".pmOrderDetails").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(event.target).attr("href"),
			type: "get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("주문 상세 페이지입니다.");
			},
			error: function(){
				alert("orderDetails: 서버 접속 실패");
			}
		});
	});
	$("#searchInput").on("focus",function(){
		$.ajax({
			url: "searchOrder",
			type: "get",
			data: "",
			success: function(data){
				$("#managerBoard").html(data);	
				$("#infotxt").text("결재 이후 주문 검색");
			},
			error: function(){
				alert("검색: 서버 접속 실패");
			}	
		});
	});
	$("#searchInput").on("keyup",function(){
		var value = $(this).val().toLowerCase();
		$("#searchTable tr").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf(value)>-1);
		});
	});
	$(".opStateBtn").click(function(event){
		event.preventDefault();
		let target = $(event.target);
		let targetOrderId= target.next().val();
		let targetState=target.parent().prev().text();
		$("#mBody").text("주문번호 "+targetOrderId+"의 배송상태를 변경합니다.");
		$('#stateSelect option[value='+targetState+']').attr('selected','selected');
		$("#orderId").val(targetOrderId);
		$("#stateModalBtn").trigger("click");
	});
	$("#opStateModify").submit(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#opStateModify").attr("action"),
			type:$("#opStateModify").attr("method"),			
			data:$("#opStateModify").serialize(),
			success: function(data){
				$(".mclose").trigger("click");
				$("#infotxt").text("주문 상태 변경");
				setTimeout(function(){
					$("#managerBoard").html(data);
				},1000);//1초동안 서버로 갈 html을 보여줌
			},
			error: function(){
				alert("주문상태 변경: 서버 접속 실패");
			}	
		});
	});
	function currentYYMMDD(name){
		let today = new Date();
		let data = today.getFullYear()+('0' + (today.getMonth() + 1)).slice(-2)+('0' + today.getDate()).slice(-2);
		console.log(name+" "+data);
		return data;
	}
	$("#json").on("click",function(){
		$("#orderReadyTable").tableHTMLExport({
			type:'json',
			filename: currentYYMMDD("json")+'ordered.json'
		});
	});
	$("#csv").on("click",function(){
		$("#orderReadyTable").tableHTMLExport({
			type:'csv',
			filename: currentYYMMDD("csv")+'ordered.csv'
		});
	});
	$("#pdf").on("click", function(){
		html2canvas(document.getElementById("orderReadyTable"),{
			onrendered:function(canvas){
				var imgData=canvas.toDataURL('images/png');
				console.log('Report imageURL: ' + imgData);
				var doc = new jsPDF('p','mm',[297,210]);
				doc.addImage(imgData,'PNG',5,5,55,20);
				doc.save(currentYYMMDD("pdf")+'ordered.pdf');
			}
		});
	});
});
</script>
</body>
</html>