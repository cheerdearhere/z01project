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
<title>look book</title>
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
<link href="style/lookbook.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<section>
	<!--Lookbook img menu-->
	<div id="lookbook" class="shopPage">
		<div class="layout-center">
			<div class="lookbook-img">
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page1">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_1.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page2">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_2.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page3">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_3.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page4">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_4.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page5">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_5.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page6">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_6.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page7">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_7.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page8">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_8.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page9">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_9.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page10">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_10.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page11">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_11.jpg" alt="lookbook"/>
				</a>
				<a href="#" data-toggle="modal" data-target="#lookbook_zoom_page12">
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_12.jpg" alt="lookbook"/>
				</a>
				<!-- DB연계용  -->
				<c:forEach items="${lookbookList}" var="dto">
					<a href="#" data-toggle="modal" data-target="#_${dto.lid}">
						<img src="image/${dto.limg}" alt="${dto.lid}"/>
					</a>
				</c:forEach>
			</div>
		</div>
		<!--lookbook img zoom modal-->
		<div id="lookbook_zoom_page1" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_1.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page2" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_2.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page3" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_3.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page4" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_4.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page5" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_5.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page6" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_6.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page7" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_7.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page8" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_8.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page9" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_9.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page10" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_10.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page11" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_11.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<div id="lookbook_zoom_page12" class="modal">
			<div class="modal-dialog">
				<div class="modal-body">
					<button class="close" type="button" data-dismiss="modal">
						&times;
					</button>
					<img src="https://black-up.kr/web/upload/NNEditor/2203_loobook_page_12.jpg" alt="lookbook"/>
				</div>
			</div>
		</div>
		<!-- DB연계용  -->
		<c:forEach items="${lookbookList}" var="dto">
			<div id="_${dto.lid}" class="modal">
				<div class="modal-dialog">
					<div class="modal-body">
						<button class="close" type="button" data-dismiss="modal">
							&times;
						</button>
						<img src="image/${dto.limg}" alt="${dto.lid}"/>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- Lookbook video link: -->
		<div class="w-75 lookbook-video embed-responsive embed-responsive-16by9" style="margin-top: 100px;margin-bottom: 100px;">
			<!-- DB 연결 후 삭제 -->
			<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/iAStDdxGPiE?autoplay=1&mute=1&loop=1&controls=1" title="youtube video player"></iframe>
			<c:forEach items="${lookbookList}" var="dto">
				<iframe class="embed-responsive-item" src="${dto.llink }" title="youtube video player"></iframe>
			</c:forEach>
		</div>
	</div>
</section> 
<script>
$(document).ready(function(){
});
</script>
</body>
</html>