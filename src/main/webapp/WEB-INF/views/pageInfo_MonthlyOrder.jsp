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
<title>ss</title>
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
<!-- Chart graphic -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.js"></script>
</head>
<body>

<div class="btn-group w-100">
	<button id="productCurrent" class="btn btn-outline-primary">등록 제품 현황</button>
	<button id="orderStateCurrent" class="btn btn-outline-info">주문 상태 현황</button>
	<button id="monthlyOrderCurrent" class="btn btn-outline-danger">월별 주문 현황</button>
	<button id="monthlyCompleteCurrent" class="btn btn-outline-dark">월별 구매결정 현황</button>
</div>
<canvas id="canvas" style="min-height:350px;border:1px solid gray;width:100%;"></canvas>
<script>
$(document).ready(function(){
	let chartLabels = [];
	let chartData1 = [];
	
	let lineChartData = {
		labels : chartLabels,
		datasets: [
			{
				label: "월별 주문량", //label의 종류
				data: chartData1,
				fill: false,
				borderColor:'#FF6384',
				tension: 0.1
			}
		]		
	};
	function createChart(){
		let ctx = document.getElementById("canvas").getContext("2d");
		if(window.chartObj != undefined){
			window.chartObj.destroy();
		}
		window.chartObj = new Chart(ctx,{
			type: 'line',
			data: lineChartData,
			options:{
				scales:{
					y:{
						stacked: true,
						beginAtZero:true
					}
				}
			}
		});	
	}
	
	$.ajax({
		url:"monthlyOrderCurrent",
		type:"post",
		data: { 
			cmd : 'chart',
			subcmd : 'line',
			${_csrf.parameterName} : "${_csrf.token}"
		},
		dataType: 'json',
		success: function(result){
			$.each(result.datas,function(index, obj){
				chartLabels.push(obj.monthlyData);
				chartData1.push(obj.orders);
			});
			createChart();
			document.getElementById("monthlyOrderCurrent").classList.remove("btn-outline-danger");
			document.getElementById("monthlyOrderCurrent").classList.add("btn-danger");
			document.getElementById("monthlyOrderCurrent").setAttribute("disabled","disabled");
		},
		error: function(){
			alert("monthly order line graph: 서버접속 실패");
		}
	});
	//another graphs
	$("#productCurrent").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "pageInfo",
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
			},
			error: function(){
				alert("서버 접속 실패");
			}
		});
	});  
	$("#orderStateCurrent").click(function(event){
		event.preventDefault(); 
		$.ajax({
			url: "pageInfo_OrderState",
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
			},
			error: function(){
				alert("서버 접속 실패");
			}
		});
	});
	$("#monthlyCompleteCurrent").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "pageInfo_MonthlyComplete",
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
			},
			error: function(){
				alert("서버 접속 실패");
			}
		});
	});
});
</script>
</body>
</html>