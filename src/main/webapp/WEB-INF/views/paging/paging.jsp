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
					<span><a href="${mapping}?page=${nowPage-3}">◀</a></span>
				</c:when>

				<c:when test="${nowPage<=3 && nowPage>1}">
					<span><a href="${mapping}?page=1">◀</a></span>
				</c:when>

				<c:otherwise>
					<span>◀</span>
				</c:otherwise>

			</c:choose>

			<c:forEach begin="1" end="${maxPagingIdx}" step="1" var="page">

				<c:choose>
					<c:when test="${page>=nowPage-2 && page<nowPage}">
						<span><a href="${mapping}?page=${page}">${page}</a></span>
					</c:when>

					<c:when test="${page == nowPage}">
						<span style="color: white; background-color: red;">${page}</span>
					</c:when>

					<c:when test="${page<=nowPage+2 && page>nowPage}">
						<span><a href="${mapping}?page=${page}">${page}</a></span>
					</c:when>

				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${nowPage<maxPagingIdx-3}">
					<span><a href="${mapping}?page=${nowPage+3}">▶</a></span>
				</c:when>
				
				<c:when test="${nowPage>maxPagingIdx-3 && nowPage<maxPagingIdx}">
					<span><a href="${mapping}?page=${maxPagingIdx}">▶</a></span>
				</c:when>
				
				<c:otherwise>
					<span>▶</span>
				</c:otherwise>
				
			</c:choose>

		</div>

</body>
</html>