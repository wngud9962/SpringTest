<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>

	
	public List<QnaVO> qna_list(){
		//sqlSession.해야할 행동("xml의 namespace.")
		return sqlSession.selectList("q.qna_list");
	}
	
		
	<select id="qna_list" resultType="vo.QnaVO">
		SELECT * FROM QNA
	</select>	
	
	List<QnaVO> list = qna_dao.qna_list();
		model.addAttribute("list", list);
		
		<table>
<caption>qna list</caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<c:forEach var="qna" items="${list }">
		<tr>
			<td>${qna.q_idx }</td>
			<td>${qna.q_title }</td>
			<td>${qna.q_content }</td>
		
		</tr>
	</c:forEach>
</table>