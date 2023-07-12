<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bowling.db.Dbcon" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/registerForm.css">
    <title>Register</title>
</head>
<body>
    <form action="/register/save" method="post" onsubmit="return formCheck(this)" >
        <div class="title">회원가입</div>
        <div id="msg" class="msg"></div> 
        <label for="id" focuson>아이디</label>
        <input class="input-field" type="text" name="id" id="id" placeholder="8~12자리의 영대소문자와 숫자 조합" autofocus>
        <label for="pwd">비밀번호</label>
        <input class="input-field" type="password" name="pwd" id="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
        <label for="name">이름</label>
        <input class="input-field" type="text" name="name" id="name" placeholder="홍길동">
        <label for="email">이메일</label>
        <input class="input-field" type="email" name="email" id="email" placeholder="example@fastcampus.co.kr"> 
        <label for="birth">생일</label>
        <input class="input-field" type="text" name="birth" id="birth" placeholder="2020/12/31">
        <div class="sns-chk">
            <label><input type="checkbox" name="sns" value="facebook"/>페이스북</label>
            <label><input type="checkbox" name="sns" value="kakaotalk"/>카카오톡</label>
            <label><input type="checkbox" name="sns" value="instagram"/>인스타그램</label>
        </div>
        <button type="submit">회원 가입</button>
    </form> 

    <script>
        function formCheck(frm) {
            var msg ='';

            if (frm.id.value.length < 3) {
                setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
                return false;
            }

            return true;
        }

        function setMessage(msg, element) {
            var msgElement = document.getElementById("msg");
            msgElement.innerHTML = '<i class="fa fa-exclamation-circle">' + msg + '</i>';

            if (element) {
                element.select();
            }
        }
    </script>

    <%@ page import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import="javax.servlet.http.HttpServletResponse" %>

    <%!
    public void saveRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String sns = request.getParameter("sns");

        // DB 연결 및 쿼리 실행
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = Dbcon.getConnection();
            String sql = "INSERT INTO 회원테이블 (id, pwd, name, email, birth, sns) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, birth);
            pstmt.setString(6, sns);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // 회원 가입 성공 페이지로 이동
        response.sendRedirect("registerSuccess.jsp");
    }
    %>

</body>
</html>
