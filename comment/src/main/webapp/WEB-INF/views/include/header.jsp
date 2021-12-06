<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>GH SHOP</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertSearch.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">    
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/dd43a0e2b4.js" crossorigin="anonymous"></script>
	
</head>
<!-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->

<script type="text/javascript">
 	 	
 	// <input type="button" value="dup. check" class="dup"> 클릭했을때 
 	// html 문서가 실행이 준비 되면 => 동작
 	$(document).ready(function(){	
 		// 버튼을 클릭했을때 		
//  			alert("클릭이벤트");
				// idCheck2.jsp에 아이디를 들고 가서  아이디를 중복체크 아이디 중복, 아이디 사용가능 출력
			$.getJSON('${pageContext.request.contextPath}/mainRank',function(rdata){
					//#dupdiv 대상에  가져온 값을 출력
					$.each(rdata,function(index,item){
						$('#ranking').append("<div class='swiper-slide rankitem'>"+item.keyword+"</div>");						
					});					
				
			});	 		
 	});




 	/* 리스트 ajax */
	$(document).ready(function(){	
	 	
		$.getJSON('${pageContext.request.contextPath}/test',function(dated){
				$.each(dated,function(index,item){
				
	$('#middle').attr("src",item.imagePath); //이미지
	$('.title').append(item.goodsNm); //상품명
	$('.del').append(item.fixedPrice+"원");//정가
	$('#middle').attr(index);//한번정지

					});//each
// 				$(this).unbind();
				}); //json
				//이벤트를 한번만 수행하고 멈춤
		});
	/* 끝 리스트 ajax */
	
 </script>
 
 <body>
 <div id="mainLayout">
 
    <header id="header">
            <div id="util">
                <div class="innerContent flex">
                    <div class="qbtn">
                        <ul>
                            <li class="tab01">
                                <a href="">즐겨찾기<span class="icon_bookmark"></span></a>
                            </li>
                            <li class="tab02">
                                <a href="${pageContext.request.contextPath}/notice.jsp">GH SHOP CUSTOMER</a>
                            </li>
                        </ul>
                    </div>
                    <div class="util_menu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
                            <li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
                            <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                            <li><a href="${pageContext.request.contextPath}/notice">고객센터</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="mid">
                <div class="innerContent">
                    <div id="layout_side" class="mobile layout_side">
                        <div class="mo_buger">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="menuSide">

                            <div class="close">
                                <span></span>
                                <span></span>
                            </div>

                            <div class="aside_userinformation">
                                <ul class="btn_nm">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn_login">로그인</a>
                                        <a href="${pageContext.request.contextPath}/join.jsp" class="btn_join">회원가입</a>
                                    </li>
                                </ul>
                                <div class="log_noti">회원이 되시면 <br>다양한 혜택과 할인, 이벤트에 참여하실 수 있습니다.</div>
                            </div>

                            <div class="asie_main_menu">
                                <ul>
                                    <li class="am_my">
                                        <a href="/member/login?return_url=/mypage/index" class="aside_icon mypage"><span>마이페이지</span></a>
                                    </li>
                                    <li class="am_order"><a href="/mypage/order_catalog" class="aside_icon delivery"><span>주문/배송조회</span></a></li>
                                    <li class="am_wish">
                                        <a href="/member/login?return_url=/mypage/wish" class="aside_icon wish"><span>관심상품</span> </a>
                                    </li>
                                    <li class="am_cart"><a href="/order/cart" class="aside_icon cart"><span>장바구니</span> </a></li>
                                </ul>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/sub_new" target="_blank">NEW</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sub_best">TOP100</a></li>
                                    <li><a href="">이용안내</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sub_live">라이브쇼핑</a></li>
                                </ul>
                            </div>
                            <div class="aside_menu1">
                                
                            </div>
                            <!--aside_menu2-->

                            <div class="aside_navigation_wrap">
                                <div class="aside_title">카테고리</div>
                                <!-- ++++++++ 카테고리 ++++++++ -->
                                <ul id="categorySideMenu" class="menu">
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            건강기능식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            건강가공식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            가공식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon3">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            잡화
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            기타상품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            사은품
                                        </a>
                                    </li>
                                </ul>
                                <!-- ++++++++ //카테고리 ++++++++ -->
                            </div>
                            <!--aside_navigation_wrap-->

                            <div class="right_cs">
                                <div class="tle">고객 센터</div>
                                <b>070-123-4567</b>
                                <div class="info info1">
                                    평일 : AM10:00 ~ PM17:00<br>
                                    점심 : PM12:00 ~ PM1:00<br>
                                    주말 및 공휴일 휴무
                                    <a href="" class="kakach"><img src="${pageContext.request.contextPath}/resources/images/kakach.jpg"></a>
                                </div>
                                <div class="tle">계좌 안내</div>
                                <div class="info info2">
                                    <img src="${pageContext.request.contextPath}/resources/images/qbnk.png">
                                    <strong>051-04542-5224-1</strong>
                                    예금주：아이티윌
                                </div>
                            </div>
                            <!-right_cs--->
                                <div class="aside_menu3">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/notice.jsp">공지사항</a></li>
                                        <li><a href="">EVENT</a></li>
                                    </ul>
                                </div>
                                <!--aside_menu3-->

                        </div><!-- mobile -->
                        <div class="menuBG"></div>

                    </div>
                    <!--mobile layout_side-->

                    <h1 class="hlogo">
                        <a href="${pageContext.request.contextPath}/main">GH SH<span>O</span>P</a>
                    </h1>
					 <!-- 인기검색어 -->
                            <table class="hot-Search">
								<tr>
									<td class="td1"><h2>실시간 검색 순위</h2></td>
									<td class="td2">
										<div class="swiper rankwrap">
											<div id="ranking" class="swiper-wrapper">
												${searchDTO.keyword}
											</div>
										</div>									
									</td>
								</tr>
							</table>
							
   <script>
      var swiper = new Swiper(".rankwrap", {
        direction: "vertical",
        autoplay: {
    		delay: 1000,
    		disableOnInteraction: false,
    	},
    	speed: 1000,
      });
    </script>
    
                    <div class="top_search">
                        <form name="frmSearchTop" id="frmSearchTop" action="${pageContext.request.contextPath}/list_search" method="get" novalidate="novalidate">
                            <input type="hidden" name="adUrl" value="">
                            <fieldset>
                                <legend>검색폼</legend>
                                <div class="top_search_cont">
                                    <div class="top_text_cont">
                                        <input type="text" id="search_form" name="keyword" class="top_srarch_text" title="라이프앤밸러스 일상생활에 활력을" placeholder="라이프앤밸러스 일상생활에 활력을" autocomplete="off"
                                       value="${keyword}" >
                                        <input type="image" src="${pageContext.request.contextPath}/resources/images/search_bt.png" id="btnSearchTop" class="btn_top_srarch" title="검색" value="검색" alt="검색"
                                        >
                                   
                    <!-- Side widget-->
                                    </div>
                                    <!-- //top_text_cont -->
                                </div>
                                <!-- //top_search_cont -->
                            </fieldset>
                        </form>
                        <!-- 검색필터 추가 -->
                                  
				                    <div class="card mb-4" id="r_search" style="display: none;">
				                        <div class="card-header">추천검색어</div>
				                        <div class="card-body">
				                            <div class="row">
				                                <div class="col-sm-6">
				                                    <ul class="search-list">
				                                        <li name="keyword" value="a"><a href="${pageContext.request.contextPath}/list_search" >비타민</a></li>
				                                         <li name="keyword" value="칼슘"><a href="#">칼슘</a></li>
				                                        <li name="keyword" value="마그네슘"><a href="#">마그네슘</a></li>
				                                    </ul>
				                                </div>
				                                <div class="col-sm-6">
				                                    <ul class="list-unstyled mb-0">
				                                        <li><a href="#!">생활잡화</a></li>
				                                        <li><a href="#!">단백질</a></li>
				                                        <li><a href="#!">두유</a></li>
				                                    </ul>
				                                    
				                                </div>
				                                
				                            </div>
				                        </div>
				                        <div class="card-header" id="bottomcard" onclick="href='#'">브랜드검색</div>
				                    </div>
				             <!-- //검색필터 추가 -->
                    </div>

                    <div class="buttonArea">
                        <ul>                           
                            <li><a href="${pageContext.request.contextPath}/cart.jsp" class="cart">장바구니<span class="count">0</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="gnbw">
                <div class="innerContent">
                    <div id="categoryAll">
                        <a>
                            <div class="h_buger">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                            전체카테고리
                        </a>
                        <div class="categoryAll_abs">
                            <ul>
                                <li class="cate6">
                                    <a href="${pageContext.request.contextPath}/sub">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_ii.png">
                                        </span>
                                        <span class="ca_t">전체상품</span>

                                    </a>
                                </li>
                                <li class="cate0">
                                    <a href="${pageContext.request.contextPath}/sub?c=a&l=A">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i0.png">
                                        </span>
                                        <span class="ca_t">건강기능식품</span>
                                    </a>
                                    <ol>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=aa&l=B">비타민</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=aaa&l=B">프로바이오틱스</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=aaaa&l=B">칼슘</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=aaaaa&l=B">마그네슘</a></li>
                                    </ol>
                                </li>
                               
                                <li class="cate2">
                                    <a href="${pageContext.request.contextPath}/sub?c=b&l=A">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i2.png">
                                        </span>
                                        <span class="ca_t">가공식품</span>
                                    </a>
                                    <ol>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=b&l=B">단백질</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=bb&l=B">두유</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=bbb&l=B">닭가슴살</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=bbbb&l=B">아연</a></li>
                                    </ol>
                                </li>
                                <li class="cate3">
                                    <a href="${pageContext.request.contextPath}/sub?c=c&l=A">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i3.png">
                                        </span>
                                        <span class="ca_t">잡화</span>
                                    </a>
                                    <ol>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=cc&l=B">생활잡화</a></li>
                                    </ol>
                                </li>
                                <li class="cate4">
                                    <a href="${pageContext.request.contextPath}/sub?c=d&l=A">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i4.png">
                                        </span>
                                        <span class="ca_t">기타상품</span>
                                    </a>
                                     <ol>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=dd&l=B">신선식품</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sub?c=ddd&l=B">차/티백</a></li>
                                    </ol>
                                </li>
                                <li class="cate5">
                                    <a href="${pageContext.request.contextPath}/sub?c=e&l=A">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i5.png">
                                        </span>
                                        <span class="ca_t">사은품</span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="gnbMenu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/sub_new" target="_blank">NEW</a></li>
                            <li><a href="${pageContext.request.contextPath}/sub_best">TOP 100</a></li>
                        </ul>
                    </div>
                    <div class="gnbLive">
                        <a href="${pageContext.request.contextPath}/sub_live">라이브쇼핑</a><span>LIVE</span>
                    </div>
                </div>
            </div>
        </header><!-- header -->
        