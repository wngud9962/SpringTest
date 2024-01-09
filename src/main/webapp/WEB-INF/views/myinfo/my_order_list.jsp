<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 주문내역</title>
</head>
<body>
	<table>
		<c:choose>
			<c:when test="${not empty order_list}">
				<tr>
					<th>주문번호</th>
					<th>주문 총 금액</th>
					<th>주문 총 개수</th>
					<th>배송 상태</th>
					<th>배송 목적지</th>
				</tr>
				<c:forEach var="order" items="${order_list}">
					<tr>
						<td>${order.o_idx}</td>
						<td>${order.o_totalcost}</td>
						<td>${order.o_totalproduct}</td>
						<td>${order.o_status}</td>
						<td>${order.o_destination}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>주문 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>