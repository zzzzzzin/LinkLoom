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

</style>
</head>

<body>
	<!-- 회원 전용 템플릿입니다. -->
	<%@ include file="/inc/header_user.jsp" %>
<div class="container mt-5">
        <!-- 검색 및 필터 버튼 -->
        <div class="row mb-3">
            <div class="col-12">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="검색어">
                    <button class="btn btn-outline-secondary" type="button">검색</button>
                </div>
            </div>
        </div>


        <div class="row mb-3">

            <div class="col-12 filter-btns">
            <%
            for (int i = 0; i < 5; i++){
            %>
                <button class="btn btn-primary me-1">추천키워드1</button>
            <%} %>    
               <select class="form-select w-auto d-inline-block">
                    <option selected>정렬</option>
                    <option value="1">최신순</option>
                    <option value="2">조회순</option>
                    <option value="3">TOPIC</option>
                    <option value="4">TAG</option>
                </select>
            </div>
        </div>
        <div class="col-12 mt-3">
                	<h3><span>"키워드"</span>로 검색한 결과입니다.</h3>
    <ul class="list-group">
  
    	<%
    	for (int i = 0; i < 10; i++) {
		%>
        <li class="list-group-item">
            <span class="badge bg-primary">1</span> <span>토픽키워드</span> | <span>카테고리키워드</span> | <span>태그키워드</span> | <span>작성자닉네임</span>
        </li>
		<%} %>

    </ul>
</div>

        <!-- 페이징 -->
        <div class="row mt-4">
            <div class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
	<!-- Home화면에서 검색하는 페이지입니다. -->
	<%@ include file="/inc/footer.jsp" %>
	<script>
	
	</script>
</body>
</html>