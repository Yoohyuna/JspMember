<%@page contentType="text/html;charset=UTF-8"%>
<%
     //웹상에서 강제로 접근->인증처리
     String mem_id=(String)session.getAttribute("idKey");
     System.out.println("mem_id=>"+mem_id);//계정명->null
 %>
<HTML>
 <HEAD>
  <TITLE> 로그인 </TITLE>
<link href="style.css" rel="stylesheet"  type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js">
</SCRIPT>
 </HEAD>

 <BODY onload="document.login.mem_id.focus()" bgcolor="#FFFFCC">
  <center>
  <!-- mem_id의 상태에따라 로그인 처리 -->
  <br><br><br>
  <%
      //Login.jsp->LoginProc.jsp->LoginSuccess.jsp
      if(mem_id!=null){ //인증된 사람이라면
    	  //추가
    	  if((mem_id).equals("admin")) { //관리자->admin, 1234
  %>
  <b><%=mem_id %></b>님 환영합니다.<p>
    당신은 제한된 기능을 사용할 수가 있습니다.<p>
    <a href="MemberUpdate.jsp">회원수정</a>
    <a href="DelCheckForm.jsp?mem_id=<%=mem_id%>">회원탈퇴</a>
    <a href="MemberList.jsp">회원리스트</a><!-- 관리자 -->
   <a href="Logout.jsp">로그아웃</a>
   <% }else { %>
      <b><%=mem_id %></b>님 환영합니다.<p>
    당신은 제한된 기능을 사용할 수가 있습니다.<p>
    <a href="MemberUpdate.jsp">회원수정</a>
    <a href="DelCheckForm.jsp?mem_id=<%=mem_id%>">회원탈퇴</a>
   <a href="Logout.jsp">로그아웃</a>
     <% } %>
  <%   	  
      }else{  //null인경우(로그인 하지 않았다면)
  %>

  <!-- 로그인 안된 상태 -->
     <TABLE>
    <form name="login" method="post" action="LoginProc.jsp">
     <TR>
		<TD align="center" colspan="2">
		<h4>로그인</h4></TD>
     </TR>

     <TR>
		<TD>아이디</TD>
		<TD><INPUT TYPE="text" NAME="mem_id"></TD>
     </TR>
     <TR>
		<TD>비밀번호</TD>
		<TD><INPUT TYPE="password" NAME="mem_passwd"></TD>
     </TR>
     <TR><!-- submit(onSubmit="호출할 함수명(~))  -->
		<TD colspan="2"><div align="center">
		<INPUT TYPE="button" value="로그인"  onclick="loginCheck()">&nbsp;
		<INPUT TYPE="button" value="회원가입" onclick="memberReg()">
		</div>
		</TD>
     </TR>
	 </form>
     </TABLE>
     <% } %>
  </center>
 </BODY>
</HTML>
