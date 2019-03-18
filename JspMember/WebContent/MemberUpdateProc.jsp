<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hewon.MemberDAO" %>

<%
     //회원가입,회원수정할때도 한글이 깨지지 않도록 설정
     request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mem" class="hewon.MemberDTO" />
<jsp:setProperty name="mem" property="*" />
<%
    //추가
     String mem_id=request.getParameter("mem_id");
     System.out.println("MemberUpdateProc.jsp의 mem_id=>"+mem_id);
     
     MemberDAO memMgr=new MemberDAO();  //(1)수정할 메서드호출
     boolean check=memMgr.memberUpdate(mem);
     System.out.println("MemberUpdateProc.jsp의 회원수정유무(chek=>)"+check);
%>
<html>
<body bgcolor="#FFFFCC">
<br>
<center>
<%
  if(check){  //회원수정에 성공했다면
%>
	 <script>
	      alert("성공적으로 수정되었습니다.");
	      location.href="Login.jsp";
	 </script>
 <%  }else{  %>
	  <script>
	      alert("수정도중 에러가 발생되었습니다.");
	      history.back();
	  </script>
<%   } %>
</center>
</body>
</html>





