<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hewon.MemberDAO" %>
 
 <jsp:useBean id="memMgr" class="hewon.MemberDAO" />
<%
     String mem_id=request.getParameter("mem_id");
     String mem_passwd=request.getParameter("mem_passwd");
     System.out.println("mem_id=>"+mem_id);
     System.out.println("mem_passwd=>"+mem_passwd);
     //MemberDAO ->loginCheck
     //MemberDAO memMgr=new MemberDAO();  //(1)
     boolean check=memMgr.loginCheck(mem_id, mem_passwd);
%>
<%
   //check->LoginSuccess.jsp(인증화면), LogError.jsp(에러메세지)
  if(check){  //if(check==true)
	  session.setAttribute("idKey",mem_id);//키명->idKey
	  //response.sendRedirect("LoginSuccess.jsp");
	  response.sendRedirect("Login.jsp");
  }else{ //id가 없다는 경우
	  response.sendRedirect("LogError.jsp");
  }

%>






