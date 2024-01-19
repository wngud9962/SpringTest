<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="paging" style="text-align: center;">
			<c:choose>

				<c:when test="${nowPage>3}">
					<span><a href="${mapping}?page=${nowPage-3}&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}">&lt; <span>이전</span></a></span>
				</c:when>

				<c:when test="${nowPage<=3 && nowPage>1}">
					<span><a href="${mapping}?page=1&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}">&lt; <span>이전</span></a></span>
				</c:when>

				<c:otherwise>
					<span>&lt; 이전</span>
				</c:otherwise>

			</c:choose>

			<c:forEach begin="1" end="${maxPagingIdx}" step="1" var="page">

				<c:choose>
					<c:when test="${page>=nowPage-2 && page<nowPage}">
						<span><a href="${mapping}?page=${page}&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}">${page}</a></span>
					</c:when>

					<c:when test="${page == nowPage}">
						<span style="color: orange; border : 3px solid orange;
						background-color : yellow;
						border-radius : 5px;
						 font-weight: bold;">${page}</span>
					</c:when>

					<c:when test="${page<=nowPage+2 && page>nowPage}">
						<span><a href="${mapping}?page=${page}&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}">${page}</a></span>
					</c:when>

				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${nowPage<maxPagingIdx-3}">
					<span><a href="${mapping}?page=${nowPage+3}&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}"><span>다음</span> &gt;</a></span>
				</c:when>
				
				<c:when test="${nowPage>maxPagingIdx-3 && nowPage<maxPagingIdx}">
					<span><a href="${mapping}?page=${maxPagingIdx}&searchType=${searchType}&searchTypeHead=${searchTypeHead}&searchContent=${searchContent}"><span>다음</span> &gt;</a></span>
				</c:when>
				
				<c:otherwise>
					<span>다음 &gt;</span>
				</c:otherwise>
				
			</c:choose>

		</div>

</body>
</html>