<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css?after">
<script type="text/javascript">
</script>
</head>

<body class="body"  
	style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
			
					
	<div class="wrapper">
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
					<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		        </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">병원소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="qna_main.do">QNA</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>
								<li><a href="login_main.do">로그인</a></li>
							</c:when>
							<c:when test="${not empty id}">
								<li><a href="petinfo_main.do">펫 등록</a></li>
								<li><a href="check_up.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div> <!-- 헤더 -->
		
		<div class="immg">
			<img src="${pageContext.request.contextPath}/resources/img/mainimg.jpg">
		</div>
		
		<div class="line1"></div>
		
		<div class="mid">
        <div class="tab_content" >
        	<div class="slider" onclick="location.href='review_main.do';" style="cursor:pointer;">
        		<h2 align="center">이용 후기</h2>
					<c:if test="${list != null }">
					<c:forEach var="vo" items="${list }">
			        <div class="slide">
			          	<table >
			          		<tr>
								<c:choose>
									<c:when test="${vo.r_photo != 'no_file' and vo.r_photo!=null}">
										<td id="timg">
											<img src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
											width="101" height="101">
										</td>
									</c:when>
									<c:when test="${vo.r_photo == 'no_file' or vo.r_photo==null}">
										<td id="timg">
											<img src="${pageContext.request.contextPath}/resources/petImg/defaultImg.jpg"
											width="100" height="100">
										</td>
									</c:when>
								</c:choose>
								<td>
									<textarea class="col-auto form-control"
										id="reviewContents" placeholder="${vo.r_content }" readonly></textarea>
								</td>
			          		</tr>
			          		<tr>
			          			<th colspan="2" align="right">${vo.u_nickName}</th>
			          		</tr>
			          	</table>
			        </div>
			        </c:forEach>
			   
		    	</c:if>
		    	<c:if test="${list == null }">
		    		리뷰 없음
		    	</c:if>
		    	</div>
          <div class="qna" onclick="location.href='qna_main.do';" style="cursor:pointer;">
              <h2 align="center">자주 묻는 질문</h2>
              <hr>
				<ul>
					<li>공지</li>
					<li>공지</li>
					<li>자주묻는 질문</li>
					<li>자주묻는 질문</li>
					<li>자주묻는 질문</li>
				</ul>
			</div>
          </div>
        </div>
        
        <div class="line1"></div>

		<div class="text1">
			<h1>반가워요!!</h1>
			<div class="text2">
				<h3>저희를 찾아주신 반려동물 보호자님께 감사의 말씀을 전합니다.</h3>
			</div>
		</div>
        
        <div class="line1"></div>
        
        <div class="main_text0">
        <h1>멍이 냥이 동물병원</h1>
        <div class="contents1">저희 동물병원은 과별 전문 의료진과 첨단 장비를 보유하고 있어요</div>
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="${pageContext.request.contextPath}/resources/img/img1.jpg" width="100" height="100">
            </div>
            <div class="contents1_bold">최고의 수의 의료서비스</div>
            <div class="contents2">
               반려동물과 보호자님께 한번도 느껴보지 못한 최고의 수의 의료서비스를 제공
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="${pageContext.request.contextPath}/resources/img/img1.jpg" width="100" height="100">
            </div>
            <div class="contents1_bold">본원만의 진료 및 치료 노하우</div>
            <div class="contents2">
                차별화된 진료 서비스와 다수의 경력을 통한 노하우를 느껴보세요
            </div>
          </li>
          
          <li>
            <div class="icon_img">
              <img src="${pageContext.request.contextPath}/resources/img/img1.jpg" width="100" height="100">
            </div>
            <div class="contents1_bold">첨단 장비를 통한 정확한 진단</div>
            <div class="contents2">
                첨단 장비를 사용하여 보다 정확한 진료를 진행합니다
            </div>
          </li>
        </ul>
      </div>
        
        <div class="line1"></div>
        
       	<h2 align="center">마음이 따뜻하고 실력있는 의료진들이 소중한 반려동물과 함께 하겠습니다.</h2>
        
        <div class="line"></div>

        <div class="where">
        	<ul class="here">
        		<li>
        			<label id="i">찾아 오시는 길</label>
		     		<div class="mapp">
		       			<img src="${pageContext.request.contextPath}/resources/img/mapp.jpg">
		       		</div>
		       	</li>
		       	<li>
		       		<label>
		       			> 주소안내 : 
		       		</label>
		       		<strong>
		       			인천광역시 부평구 시장로 7 MH타워 5층
		       		</strong>
		       	</li>	
	       		<li>
	       		<label>
	       			> 지하철 : 
	       		</label>
	       		<strong>
	       			부평역 (21-B출구)
	       		</strong>
		       	</li>	
       		</ul>
        </div>
        
        <div class="line"></div>
      
	<div class="footer">
        <div>멍이 냥이 동물병원</div>
        <div id="info">
          CEO. 김가나다 <br>
          Addr. 인천광역시 부평구 시장로 7 MH타워 5층 <br>
          Fax/Tel. 032-262-5890 <br>
          ⓒ2023.hospital name All rights reserved.
        </div>
        <div class="sns">
			<a href="https://www.instagram.com/projecttest0103?igshid=NGVhN2U2NjQ0Yg%3D%3D&utm_source=qr">
				<img src="resources/img/insta.jpg" width="100px" height="100px">
			</a>
		</div>
      </div>
    </div>
	


<!-- 	<!-- 자동롤링배너 
			<div class="wrap"> 배너표시영역
		        <div class="rolling-list"> 원본배너
		            <ul>
		                <li>
		                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1471922694854-ff1b63b20054?ixlib=rb-4.0.3&ixid=M3wxM jA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
		                </li>
		                <li>
		                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1493246507139-91e8fad9978e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
		                </li>
		                <li>
		                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1501493870936-9c2e41625521?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
		                </li>
		                <li>
		                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1611832197549-ff910be125dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
		                </li>
		            </ul>
		        </div>
		    </div>
	
	
	 <script type="text/javascript">
        // 롤링 배너 복제본 생성
        let roller = document.querySelector('.rolling-list');
        roller.id = 'roller1'; // 아이디 부여
 
        let clone = roller.cloneNode(true)
        // cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
        clone.id = 'roller2';
        document.querySelector('.wrap').appendChild(clone); // wrap 하위 자식으로 부착
 
        document.querySelector('#roller1').style.left = '0px';
        document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
        // offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)
 
        roller.classList.add('original');
        clone.classList.add('clone');
    </script> -->
    
    <script type="text/javascript">
	    var currentSlide = 0;
	    const slides = document.querySelectorAll('.slide');
	    const slideCount = slides.length;
	     
	    function showSlide(n) {
	        slides.forEach(slide => slide.style.display = 'none');
	        slides[n].style.display = 'block';
	    }
	     
	    function nextSlide() {
	        currentSlide = (currentSlide + 1) % slideCount;
	        showSlide(currentSlide);
	    }
	     
	    function prevSlide() {
	        currentSlide = (currentSlide - 1 + slideCount) % slideCount;
	        showSlide(currentSlide);
	    }
	     
	    document.addEventListener('DOMContentLoaded', () => {
	        showSlide(currentSlide);
	        setInterval(nextSlide, 3000); // 3초마다 자동 슬라이드                
	    });
    </script>
    
</body>
</html>