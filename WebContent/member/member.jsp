<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%>

<%
	request.setCharacterEncoding("utf-8");
%>    

<jsp:useBean id="member" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>

<%
	String[] hobby = request.getParameterValues("hobby");
	String h="";
	for(String h1 : hobby){
		h += h1 + "-";
	}

	member.setHobby(h);       //  hobby ="공부-게임-등산";
	
	// DAO 객체 구하기
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.insert(member);
	
	if(result == 1){	// 회원가입 성공
%>
		<script>
			alert("회원가입 성공");
			location.href="loginform.html";
		</script>

<%	}else{				// 회원가입 실패	%>
		<script>
			alert("회원가입 실패");
			history.go(-1);
		</script>
<%	} %>
