<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hewon.*,java.util.*,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%!
       int pageSize=5;//numPerPage->페이지당 보여주는 게시물수(=레코드수)->20개이상
       int blockSize=3;//pagePerBlock->블럭당 보여주는 페이지수
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
    //페이징처리에 해당하는 환경설정을 마무리
    //게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력
    String pageNum=request.getParameter("pageNum");
    if(pageNum==null){
    	pageNum="1";//default(무조건 1페이지는 선택하지 않아도 보여줘야 되기때문에)
    }
    int currentPage=Integer.parseInt(pageNum);//현재페이지->nowPage
    //시작레코드번호 ->limit ?,?
    //                  (1-1)*10+1=1,(2-1)*10+1=11,(3-1)*10+1=21
    int startRow=(currentPage-1)*pageSize+1;		
    int endRow=currentPage*pageSize;//1*10=10,2*10=20,3*10=30
    int count=0;//총레코드수
    List articleList=null;//화면에 출력할 레코드를 저장할 변수
    //-------------------------------------------------
    MemberDAO dbPro=new MemberDAO();
    count=dbPro.getMemberCount();
    //---------------------------------------------------
    System.out.println("현재 레코드수(count)=>"+count);
    
    if(count > 0){
    	articleList=dbPro.getMemberArticles(startRow, pageSize);                                                                     
    }
 
%>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
<center><b>글목록(전체글:<%=count %>)</b><p>
<!-- 데이터의 유무 -->
<%
  if(count==0){
%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr>
        <td align="center">회원테이블에 저장된 글이 없습니다.</td>
    </tr>
</table>
<%}else { %>
<table border="1" width="800" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="#b0e0e6"> 
      <td align="center"  width="50"  >번 호 </td> 
      <td align="center"  width="30" >이 름</td> 
      <td align="center"  width="120" >이메일</td>
      <td align="center"  width="150" >전화번호</td> 
      <td align="center"  width="300" >주소</td> 
      <td align="center"  width="150" >직업</td>    
    </tr>
    <!--실질적으로 레코드를 출력시켜주는 부분  -->
    <%
        for(int i=0;i<articleList.size();i++){
        	MemberDTO article=(MemberDTO)articleList.get(i);//vecList.elementAt(i),vecList.get(i);
    %>
   <tr height="30"><!-- 하나씩 감소하면서 출력하는 게시물번호  -->
    <td align="center"  width="50" ><%=article.getMem_id()%></td>
    <td  align="center" width="250" >  
           <%=article.getMem_name()%> 
    </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getMem_email()%>"><%=article.getMem_email()%></a></td>
    <td align="center"  width="150"><%=article.getMem_phone() %></td>
    <td align="center"  width="50"><%=article.getMem_address() %></td>
    <td align="center" width="100" ><%=article.getMem_job() %></td>
  </tr>
       <%  } //for %>
</table><p>
<%  } //else %>
<%  //페이징 처리
    if(count > 0){//레코드가 한개 이상이라면
    	//1.총페이지수 구하기
    	//                      122/10=12.2+1.0=13.2 (122%10)=13페이지
    	int pageCount=count/pageSize+(count%pageSize==0?0:1);
       //2.시작페이지 
       //블럭당 페이지수 계산->10->10배수,3->3의 배수
       int startPage=0;//1,2,3,,,,10 [다음블럭 10],11,12,,,,,20
       if(currentPage%blockSize!=0){ //1~9,11~19,21~29,,,
    	   startPage=currentPage/blockSize*blockSize+1;
       }else{ //10%10 (10,20,30,40~)
    	   //             ((10/10)-1)*10+1=1
    	  startPage=((currentPage/blockSize)-1)*blockSize+1; 
       }
       int endPage=startPage+blockSize-1;//1+10-1=10
       System.out.println("startPage="+startPage+",endPage=>"+endPage);
       //블럭별로 구분해서 링크걸어서 출력
       if(endPage > pageCount) endPage=pageCount;//마지막페이지=총페이지수
       //1)이전블럭 //4 >3, 11>10
       if(startPage >blockSize) { %> 
   <a href="MemberList.jsp?pageNum=<%=startPage-blockSize %>">[이전]</a>
    <% }  
      //2)현재블럭(1,2,[3]~10,11~20,21~30)
        for(int i=startPage;i<=endPage;i++) { %>
   <a href="MemberList.jsp?pageNum=<%=i %>">[<%=i%>]</a>
     <% }
      //3)다음블럭
      if(endPage < pageCount) {%>
  <a href="MemberList.jsp?pageNum=<%=startPage+blockSize %>">[다음]</a>
 <% 
      }
    }//if(count > 0)
%>
</center>
</body>
</html>






