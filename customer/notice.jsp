<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- JDBC(Java Database Connectivity)를 사용하여 데이터베이스에 접속하기 위한 import 문을 포함합니다.
UTF-8 인코딩을 설정합니다.
JSTL(Core 태그 라이브러리)의 prefix를 c로 설정합니다.
로그인 상태에 따라 "login" 또는 "logout" 링크를 표시합니다.
검색 기능을 제공하는 폼을 생성합니다. 사용자는 제목(title) 또는 내용(content)으로 공지사항을 검색할 수 있습니다.
공지사항 목록을 테이블로 표시합니다. list라는 배열에 있는 값들을 반복적으로 출력합니다.
각 공지사항의 번호, 제목, 작성자, 작성일, 조회수를 표시합니다. 제목은 링크로 되어 있으며, 공지사항 상세 페이지로 이동할 수 있습니다.
"글쓰기" 링크를 통해 공지사항 작성 페이지로 이동할 수 있습니다.
코드에서는 JSTL을 사용하여 Java 코드를 최소화하고,
HTML과 JavaScript를 활용하여 웹 페이지를 동적으로 구성하고 기능을 제공하고 있습니다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function clearVal() {
		var inputVal = document.getElementById("q"); // "q"라는 id를 가진 요소를 가져옴
		inputVal.value = ""; // 해당 요소의 값을 빈 문자열로 설정
	}

	/* inputVal 변수에 "q"라는 id를 가진 요소(element)를 가져옵니다.
	 inputVal.value는 해당 요소의 값을 나타냅니다. 여기서는 inputVal 요소의 값을 빈 문자열("")로 설정하여
	 입력 필드를 초기화합니다. 즉, 해당 입력 필드를 클릭하면 입력된 값을 지우는 역할을 합니다. */
</script>
</head>
<body>
	<h3>notice.jsp</h3>

	<c:if test="${empty sessionScope.uid }">
		<a href="../login/login.do">login</a>	|
	</c:if>

	<c:if test="${not empty sessionScope.uid }">
		<a href="">logout</a>	|
	</c:if>


	<form action="notice.do" method="get">
		<select name="f">
			<option value="title" ${param.f=="title"?"selected":"" }>제목</option>
			<option value="content" ${param.f=="content"?"selected":"" }>내용</option>

		</select> <input type="text" name="q" value="${query }" id="q"
			onclick="clearVal()" /> <input type="submit" value="검색" />

	</form>



	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<!-- 배열에 있는 값을 끌어내는 작업 -->
		<c:forEach items="${list }" var="n">
			<tr>
				<td>${n.seq }</td>
				<td><a href="noticeDetail.do?c=${n.seq }&h=${n.hit }">${n.title }</a></td>
				<td>${n.writer }</td>
				<td>${n.regdate }</td>
				<td>${n.hit }</td>
			</tr>
		</c:forEach>

	</table>
	<a href="noticeReg.do">글쓰기</a>

</body>
</html>

