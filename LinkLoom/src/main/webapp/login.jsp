<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>LINKLOOM</title>

<%@ include file="/inc/asset.jsp" %>

<style>
        .login-container-form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .login-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .login-row > div {
            flex: 1; 
        }
        .login-row input[type="text"],
        .login-row input[type="password"] {
            width: 100%;
        }

        .form-check {
            margin-top: 10px;
        }
        .login-container{
         	max-width: 600px;
            margin: 20px auto;
        
        }
</style>
</head>

<body>
	<!-- 비회원 전용 템플릿입니다.  -->
	<%@ include file="/inc/header_visit.jsp" %>
	<!-- 로그인 첫 페이지입니다. -->
	   <div class="container mt-5">
	   
	   <h1>로그인</h1>
        <form class="login-container-form">
              
            <div class="login-row mb-2">
                <div>
                    <input type="text" class="form-control mb-2" placeholder="아이디" aria-label="아이디">
                    <input type="password" class="form-control" placeholder="비밀번호" aria-label="비밀번호">
                </div>
                <button type="submit" class="btn btn-primary login-btn">로그인</button>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="rememberMe">
                <label class="form-check-label" for="rememberMe">자동로그인</label>
            </div>
        </form>
        </div>
        <div class="login-container mt-5">
         <div class="additional-options">
             <button type="button" class="btn btn-secondary">아이디 찾기</button>
             <button type="button" class="btn btn-secondary">비밀번호 찾기</button>
             <button type="button" class="btn btn-secondary">회원가입</button>
         </div>
       		 <p style="padding-top:20px; max-width:600px;"><button type="button" class="btn btn-secondary custom-btn" style="width:100%;">구글계정으로 로그인</button></p>
       		 <p style="padding-top:20px; max-width:600px;"><button type="button" class="btn btn-secondary custom-btn" style="width:100%;">카카오 계정으로 로그인</button></p>
		</div>
	<%@ include file="/inc/footer.jsp" %>
	<script>
	
	</script>
</body>
</html>