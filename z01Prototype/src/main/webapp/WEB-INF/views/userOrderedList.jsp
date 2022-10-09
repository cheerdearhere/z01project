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
</head>
<body>

<form method="post" action="orderRequest" id="orderRequest">
	<div class="table-responsive-sm">
		<table id="orderReadyTable" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>정보</th>
					<th>총액</th>
					<th>배송 상태</th>
					<th>...</th>
				</tr>
			</thead>
			<tbody id="orderBody">
				<c:forEach items="${orderList}" var="orDto">
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
												<a href='productdetails?pId=${orDto.pId}' class='text-dark pclick'>
													[[${orDto.pId}]] ${orDto.opName} || ${orDto.opColor} || ${orDto.opSize} || ${orDto.opPrice} 원 ||${orDto.opQuanty} || ${orDto.discountID} 적용
												</a><br/>
												배송지: ${orDto.opAddress}
											</p>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>${orDto.opTotal}</td>
						<td id="orderState${orDto.opId}">
							${orDto.opState}
						</td>
						<td>
							<a id="cancle${orDto.opId}" href="deleteOrderList?opId=${orDto.opId}" class='btn btn-danger dBtn w-100'>
								교환 반품
							</a><br/>
							<a id="return${orDto.opId}" href="moveToCart?opId=${orDto.opId}" class='btn btn-warning dBtn w-100'>
								리뷰작성
							</a>
							<a id="decide${orDto.opId}" href="dicountSelect?opId=${orDto.opId}" class='btn btn-info dBtn w-100'>
								구매결정
							</a>							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</form>
<script>
$(document).ready(function(){
	//고객리뷰작성
	//주문서 확인orderDetails
});
</script>
</body>
</html>