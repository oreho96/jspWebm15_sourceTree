<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function cancelurl() {
	location.href="./notice.do"
}


</script>
</head>
<body>
<h3>noticeReg.jsp</h3>

<form action="noticeRegProc.do" method="post">
	제목 : <input type="text" name="title" /> <br />
	첨부파일 : <input type="file" name="txtFile" /> <br />
	내용 : 
	<textarea name="content" id="txtcontent" class="txtcontent">aaa</textarea> <br />
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel" onclick="cancelurl()" />
</form>

</body>
</html>