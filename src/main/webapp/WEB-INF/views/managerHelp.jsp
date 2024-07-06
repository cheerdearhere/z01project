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

<h1>관리자 문의 정보</h1><hr/>
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
			<i class="fas fa-city"></i> 오시는 길: 서울특별시 광진구...
		</p>
		<a class="btn btn-outline-warning" href="https://map.kakao.com/">방문 경로 알아보기</a>
	</div>
</div>
</body>
</html>