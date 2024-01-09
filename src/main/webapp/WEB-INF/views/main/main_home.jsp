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
	
	<jsp:include page="/WEB-INF/views/template/headerTemplate.jsp"/>

		
		<!-- 헤더 -->
		
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
									<textarea class="col-auto form-control" style="resize: none;"
										id="reviewContents" placeholder="${vo.r_content }" readonly ></textarea>
								</td>
			          		</tr>
			          		<tr>
			          			<th colspan="2" align="right">${vo.u_nickName}</th>
			          		</tr>
			          	</table>
			        </div>
			        </c:forEach>
			   
		    	</c:if>
		    	<c:if test="${list[0] == null }">
		    		<li style="padding-left: 20px; padding-bottom: 10px;">리뷰 없음</li>
		    	</c:if>
		    	</div>
          <div class="qna" onclick="location.href='faq_main.do';" style="cursor:pointer;">
              <h2 align="center">자주 묻는 질문</h2>
              <hr>
				<ul>
				<c:choose>
				<c:when test="${faqList[0] != null}">
				<c:forEach items="${faqList}" var="faqData">
				<li>${faqData.f_title}</li>
				</c:forEach>
				</c:when>
				
				<c:otherwise>
					<li>게시글이 존재 하지 않습니다.</li>
				</c:otherwise>
				</c:choose>
				
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
	
	<jsp:include page="/WEB-INF/views/template/footerTemplate.jsp"/>   

    </div>
    
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