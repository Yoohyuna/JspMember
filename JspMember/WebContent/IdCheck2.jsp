<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hewon.MemberDAO" %>

<%
      //script.js->IdCheck.jsp?mem_id='kkk'
     String mem_id=request.getParameter("mem_id");
     System.out.println("mem_id=>"+mem_id);
     
     //MemberDAO ->loginCheck
     MemberDAO memMgr=new MemberDAO();  //(1)
     boolean check=memMgr.checkId(mem_id);
%>
<html>
<body bgcolor="#FFFFCC">
<br>
<center>
<b><%=mem_id %></b>
<%
  if(check){  //이미 아이디가 존재한 아이디라면
	  out.println("는 이미 존재하는 아이디입니다.<p>");
  }else{ //id가 없다는 경우
	  out.println("는 사용가능한 아이디입니다.<p>");
  }
%>
<!-- 자바스크립트에서 자기자신창을 가리키는 예약어 self -->
<a href="#" onclick="self.close()">닫기</a>
</center>
</body>
</html>





