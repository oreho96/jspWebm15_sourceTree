<%@page import="customer.vo.Notice"%>
<%@page import="customer.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeRegProc.jsp</h3>
<%-- <%
request.setCharacterEncoding("utf-8");
String title=request.getParameter("title");
String content=request.getParameter("content");

	
Notice n=new Notice();
 n.setTitle(title);
 n.setContent(content);
 

 NoticeDao dao=new NoticeDao();
 dao.write(n);
 
 
 
//목록으로 이동
response.sendRedirect("notice.jsp");
%> --%>

</body>
</html>
