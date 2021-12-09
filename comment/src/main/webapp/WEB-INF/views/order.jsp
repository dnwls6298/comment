<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">
	
	$(function() {
		var Pricedot = ${ListDTO.goodsPrice} * ${goodsCount};
	     
		$("#sumprice").html("가격 : " + Pricedot + "원");
	});
	   
	   function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	   
	   function openbasic(){
		   $('#basic_infomation').show();
		   $('#input_infomation').hide();
	   }
	   
	   function openinput(){
		   $('#basic_infomation').hide();
		   $('#input_infomation').show();
	   }
	   
	   function submitOrder(){
		   if($("#basic_infomation").css("display") == "none"){
			   
			   var orderAddr = $("#sample4_roadAddress").val() + $("#sample4_extraAddress").val() + " " + $("#sample4_detailAddress").val();
			   var goodNum = ${goodsNum};
			   var goodsCount = ${goodsCount};
			   var Pricedot = ${ListDTO.goodsPrice} * ${goodsCount};
			   
				alert("입력 주소지 배송");
				
				$.ajax({
					url:"insertOrder" , async: false , type:"post", data:{
						"memId":'<%=(String)session.getAttribute("id")%>',
						"goodsNum":goodNum,
						"goodsCount":goodsCount,
						"orderAddr":orderAddr,
						"orderSub":$("#orderemail").val(),
						"orderZipcode":$("#sample4_postcode").val(),
						"orderPhone":$("#orderPhone").val(),
						"amount":Pricedot,
						"resipient":$("#resipient").val()
					},
					success: function(){},
					error:function(request,status,error){
						
					}
				});
				
			}else if($("#input_infomation").css("display") == "none"){
				
				var orderAddr = "${AMemberDTO.address}" + " " + "${AMemberDTO.addressSub}" + " " + "${AMemberDTO.addressReference}";
				var goodNum = ${goodsNum};
				var goodsCount = ${goodsCount};
				var Pricedot = ${ListDTO.goodsPrice} * ${goodsCount};
				var orderSub = "${AMemberDTO.email}";
				var orderZipcode = ${AMemberDTO.zipcode};
				var orderPhone = "${AMemberDTO.phone}";
				var resipient = "${AMemberDTO.memNm}";
					
				alert("기본 주소지 배송");
				
				$.ajax({
					url:"insertOrder" , async: false , type:"post", data:{
						"memId":'<%=(String)session.getAttribute("id")%>',
						"goodsNum":goodNum,
						"goodsCount":goodsCount,
						"orderAddr":orderAddr,
						"orderSub":orderSub,
						"orderZipcode":orderZipcode,
						"orderPhone":orderPhone,
						"amount":Pricedot,
						"resipient":resipient
					},
					success: function(){},
					error:function(request,status,error){
						
					}
				});
		   }
		   
	   }
	   
	</script>
	
</head>
<body>

<div id="product list"><h1>상품 내용</h1></div><br><br>

<table id="productlist" border="1">
	<tr><td><img alt="미리보기 이미지 없음" src="${ListDTO.imagePath}">${ListDTO.goodsNm}</td><td style="font-size: 2em;">${goodsCount}개</td></tr>
</table>

<br><br><br>

<div id="sumprice"></div>
<br><br><br>

<a href="javascript:;" onclick="openbasic()">기본 내용</a> / <a href="javascript:;" onclick="openinput()">직접 입력</a>
<br><br><br>

<h1>배송 정보</h1><br>


<div id=basic_infomation>
	수취인 : ${AMemberDTO.memNm}<br>
	이메일 : ${AMemberDTO.email}<br>
	전화번호 : ${AMemberDTO.phone}<br>
	우편번호 : ${AMemberDTO.zipcode}<br>
	주소 : ${AMemberDTO.address}<br>
	참고항목 : ${AMemberDTO.addressSub}<br>
	상세주소 : ${AMemberDTO.addressReference}<br>
</div>


<div id=input_infomation style="display:none;">
	<form id=sub_myinfo>
		수취인 : <input type="text" id="resipient" name="resipient"><br>
		이메일 : <input type="text" id="orderemail" name="orderemail"><br>
		전화번호 : <input type="number" id="orderPhone" name="orderPhone"><br>
		우편번호 : <input type="text" id="sample4_postcode" placeholder="우편번호" name="zipcode" readonly>
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		주소 : <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address1" readonly><br>
		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
		상세주소 : <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address3"><br>
		참고항목 : <input type="text" id="sample4_extraAddress" placeholder="참고항목" name="address2" readonly><br>
	</form>
</div>

<button type="button" onclick="submitOrder()">결제하기</button>

</body>
</html>