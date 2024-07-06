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
<title>faq</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- stylesheet -->
<link href="style/faq.css" type="text/css" rel="stylesheet"/>
</head>

<body>

<div class="tab_faq">
	<h3 class="text-center mb-2">FAQ</h3>
	<!-- 버튼요소 -->
	<input type="radio" name="faqtabmenu" id="tab01faq" checked>
	<label for="tab01faq">배송문의</label>
	<input type="radio" name="faqtabmenu" id="tab02faq">
	<label for="tab02faq">교환/반품문의</label>
	<input type="radio" name="faqtabmenu" id="tab03faq">
	<label for="tab03faq">입금/결제문의</label>
	<input type="radio" name="faqtabmenu" id="tab04faq">
	<label for="tab04faq">기타문의</label>
	<input type="radio" name="faqtabmenu" id="tab05faq">
	<label for="tab05faq">그 외 QnA</label>
	
	<!--배송문의-->
	<div class="faqconbox con1faq">
		<div class="accordion">
			<input type="radio" name="accordion" id="answer01"/>
			<label for="answer01">언제 배송되나요?<em></em></label>
			<div>
				<p>결제 완료 후 기본 상품 준비기간은 영업일 기준 1-3일 정도 소요되며, 거래처 사정에 따라 2-3일 정도 더 소요 될 수 있습니다.<br/>
				3일 이상 입고지연되는 경우 알림톡으로 안내드리고 있습니다.<br/>
				입고 예정일, 출고 예정일 문의는 14시 이후로 연락주시면 가장 정확히 확인 가능합니다.
				</p>
			</div>
			<input type="radio" name="accordion" id="answer02"/>
			<label for="answer02">배송 문자를 받았는데 배송 조회가 되지 않아요.<em></em></label>
			<div>
				<p>저희쪽에서 출고된 상품은 CJ대한통운으로 발송되어 운송장 정보를 전송하는 시간이 필요합니다.<br/>
				운송장번호를 이용한 배송조회는 저녁7~10시 이후 가능하며, 출고 후 1-3일 이내로 수령 가능합니다.<br/>
				(택배사 물량에 따라 변동이 있을 수 있습니다.)<br/>
				간혹 시스템 오류로 배송추적이 되지 않을 경우, 게시판 또는 고객센터로 문의주세요.
				</p>
			</div>
			<input type="radio" name="accordion" id="answer03"/>
			<label for="answer03">한번에 묶음배송 받고 싶어요.<em></em></label>
			<div>
				<p>부분배송을 원치 않는 고객님은 주문 후 '배송 전 취소/변경' 게시판 또는 고객센터로 요청해주시면 됩니다.<br/>
				* 묶음배송의 경우 지연되는 상품이 포함돼 있는 주문건은 상품 준비기간이 더 소요 될 수 있는 점 양해 부탁드립니다.<br></p>
			</div>
			<input type="radio" name="accordion" id="answer04"/>
			<label for="answer04">배송 전인데 상품/주소를 취소/변경하고 싶어요.<em></em></label>
			<div>
				<p>배송 전 주문 정보 변경을 원하시는 경우 전산작업이 마무리되는 오전 10시까지 고객센터 또는 'QNA' 게시판으로 요청해주시면 됩니다.<br/>
				상품명과 옵션을 정확히 기재해주셔야하며, 정확한 기재가 안된 경우 처리 불가 할 수 있습니다.<br/><br/>
				* 오전 10시 이후에는 꼭! 고객센터 또는 상담톡으로 연락주셔야 합니다.<br/><br/>
				주문 상태가 배송 전으로 확인되어도 이미 배송작업이 시작 됐을 수 있습니다.<br/>
				이 경우 변경이 불가하며, 교환/반품을 원하시는 경우 교환/반품 배송비가 발생됩니다.</p>
			</div>
		</div>
	</div>
	<!--교환/반품 문의-->
	<div class="faqconbox con2faq"> 
		<div class="accordion">
			<input type="radio" name="accordion2" id="answer05">
			<label for="answer05">교환/반품 하고싶어요<em></em></label>
			<div>
				<p>상품 수령 후 7일 안에 '배송 후 교환/반품' 게시판 또는 고객센터로 접수해주시면 됩니다.<br/>
				접수하시면 영업일 기준 2-3일 내에 기사님 방문하시며,<br/>
				교환/반품 원하는 모든 상품을 한번에 포장하여 기사님께 전달해주시면 5일 이내에 처리됩니다.<br/>
				* 교환은 같은 상품의 색상/사이즈만 가능하며, 다른 상품으로 교환이 불가하기 때문에 반품 후 새로 주문하셔야 하는 점 양해 부탁드립니다.
				</p>
			</div>
			<input type="radio" name="accordion2" id="answer06"/>
			<label for="answer06">교환/반품 배송비와 환불은 어떻게 처리되나요?<em></em></label>
			<div>
				<p>-단순 교환 : 5,000원 (제주/산간 11,000)<br/>
				-반품 : 2,500원 (제주/산간 11,000원)<br/>
				무료배송 받으신 경우 교환/반품 이 후 최종적으로 무료배송 조건에 충족되지 않는다면, 초기배송비도 부담됩니다.<br/><br/>
				*블랙업은 CJ대한통운을 이용하고 있기 때문에 CJ대한통운 접수시 금액입니다.<br/>
				편의점 CJ택배 포함, 타택배 이용시 선불로 보내주셔야 합니다.<br/>
				(불량/오배송일 경우에도 선불로 보내주셔야 하는 점 양해 부탁드립니다.)<br/>
				타택배 이용 원하시면 고객센터 또는 게시판으로 발송 전 문의 부탁드립니다.<br/>
				</p>
			</div>
			<input type="radio" name="accordion2" id="answer07"/>
			<label for="answer07">교환/반품이 불가한 경우가 있나요?<em></em></label>
			<div>
				<p>-상품 수령 후 영업일 기준 7일이 경과한 경우.<br/>
				-공정거래 표준약관 제 15조 2항에 의한 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우.<br/>
				(착용흔적, 오염, 냄새, 세탁한 상품, 택이 제거된 상품 포함)<br/>
				-세탁 후, 착용 후에 발견된 불량/오배송은 반품/교환 불가합니다.<br/>
				제품의 초기 불량과 소비자 과실과의 책임소지가 불분명해 불가피하게 마련된 규정이오니 양해 부탁드립니다.<br/>
				-모니터 해상도에 따라 색상 차이가 있을수 있기 때문에 불량으로 처리되지 않습니다.<br/>
				-실측사이즈는 측정방법에 따라 1~3cm 오차가 있을 수 있으며, 니트 상품은 소재 특성상 1~5cm 오차가 있을 수 있습니다.<br/>
				이런 경우 불량으로 교환/반품 불가한 점 양해 부탁드립니다.<br/>
				-데님소재 및 컬러감이 강한 상품은 밝은 색상의 상품과 함께 착용시 이염의 가능성이 있는 점 주의 부탁드립니다.<br/>
				-제작과정에 따라 마감처리 미흡(실밥), 초크자국 등이 있을 수 있으며 불량으로 판단되지 않습니다.<br/>
				</p>
			</div>
		</div>
	</div>
    <!--입금/결제문의-->
	<div class="faqconbox con3faq">
		<div class="accordion">
			<input type="radio" name="accordion3" id="answer08">
			<label for="answer08">무통장 입금 결제방법으로 주문 후 입금했는데 확인되지 않아요.<em></em></label>
			<div>
				<p>주문 후 7일 이내에 입금확인이 되지 않을 경우 주문은 자동 취소됩니다.<br/>
				입금 후 1시간 뒤 자동으로 입금확인됩니다.<br/>
				* 주문서와 은행명/예금주명/금액이 다를 경우 입금확인이 불가하오니, 이런 경우 '입금확인/입금자변경' 게시판 또는 고객센터로 문의 부탁드립니다.
				</p>
			</div>
			<input type="radio" name="accordion3" id="answer09"/>
			<label for="answer09">실수로 주문금액보다 더(혹은 덜) 입금했어요.<em></em></label>
			<div>
				<p>입금하신 금액과 주문서 금액이 일치하지 않을 경우, 자동입금확인이 불가합니다<br/>
				은행/입금자면/입금일/입금액을 확인 후 [입금확인/입금자변경] 게시판 또는 고객센터로 문의주세요.<br/><br/>
				*주문금액보다 더 입금했을 경우 [입금확인/입금자변경] 게시판에 환불 받으실 계좌를 남겨주시면 익일 오전에 차액을 환불해드립니다<br/>
				*주문금액보다 덜 입금했을 경우 차액을 추가로 입금해주시고 [입금확인/입금자변경] 게시판 또는 고객센터로 문의주세요.<br/>
				</p>
			</div>
			<input type="radio" name="accordion3" id="answer10"/>
			<label for="answer10">여러가지 상품을 따로 주문하였는데 한꺼번에 입금해도 되나요?<em></em></label>
			<div>
				<p>주문을 따로하시고 함께 입금하는 것은 가능하나, 주문서와 입금액이 일치하지 않기 때문에 자동입금확인은 어렵습니다.<br/><br/>
				총 주문금액을 입금하신 후 고객센터나 [입금확인/입금자변경] 게시판으로 입금확인 요청을 해주시면,<br/>
				각 주문서별로 입금확인 후 발송해드리도록 하겠습니다.<br/>
				</p>
			</div>
			<input type="radio" name="accordion3" id="answer11"/>
			<label for="answer11">현금영수증 신청은 어떻게 하나요?<em></em></label>
			<div>
				<p>주문 후 '고객님의 주문이 완료 되었습니다.' 페이지 하단 '배송지정보' 아래 [현금영수증 신청] 버튼을 통해 신청하실 수 있습니다.<br/>
				위에 방법을 놓치신 경우에는 입금완료 된 주문건에 한하여, 영업일 기준 7일 이내에 신청 가능합니다.<br/>
				</p>
			</div>
		</div>
	</div>
	<!--기타문의-->
	<div class="faqconbox con4faq">
		<div class="accordion">
			<input type="radio" name="accordion4" id="answer12"/>
			<label for="answer12">방문수령 또는 퀵으로 받아 볼 수 있나요?<em></em></label>
			<div>
				<p>오프라인 매장이 없는 관계로 택배 거래만 가능합니다.<br/>
				급하신 경우 재고있는 상품은 퀵 서비스 가능합니다.<br/>
				결제 완료 된 주문건에 한하여 오전 11시까지 고객센터 또는 '배송전 취소/변경' 게시판으로 신청 가능합니다.<br/>
				재고 확인 후 저희가 계약된 퀵 사무실을 통해 오후 3시 일괄 발송됩니다.<br/>
				* 퀵 배송비는 고객님 부담입니다.<br/>
				* 주문서와 은행명/예금주명/금액이 다를 경우 입금확인이 불가하오니, 이런 경우 '입금확인/입금자변경' 게시판 또는 고객센터로 문의 부탁드립니다.<br/>
				</p>
			</div>
			<input type="radio" name="accordion4" id="answer13"/>
			<label for="answer13">구매 적립금/후기 적립금이 궁금해요.<em></em></label>
			<div>
				<p>구매 적립금은 배송완료 후 7-10일 내에 자동 적립됩니다.<br/>
				만원 이상의 상품부터 금액대 별로 지급되며, 회원등급에 따라 적립됩니다.<br/>
				후기 적립금은 작성해주신 후 7일 이내에 지급 됩니다.<br/>
				* 적립금 지급 기준을 충족하지 못하거나 구매하지 않은 상품(반품 상품 포함)에 대한 후기는 적립금이 지급이 불가합니다.<br/>
				</p>
			</div>
		</div>
	</div>
	<!--그외 QnA-->
	<div class="faqconbox con5faq">
	</div>
</div>


</body>
</html>
