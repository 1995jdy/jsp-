<%@ page info="left_Frame" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=euc-kr" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
<!-- 
 function login_check() {
  if (!document.login.userid.value) {
   alert("ID를 입력하세요!");
   document.login.userid.focus();	
   return;
  }  
  if (!document.login.password.value) {
   alert("패스워드를 입력하세요!");
   document.login.password.focus();	
   return;
  }
-->
document.login.submit();
 }
</script>
<style type="text/css">
<!--
 .style3 {color: #FF0000}
-->
</style>
<form name ="login" method="post" action="login_process.jsp"> 
 <tr bgcolor='#ffffff'> 
  <td height="90"> 
   <table>
                <tr>
                    <td bgcolor="skyblue">ID</td>
                    <td><input type="text" maxlength="16" name="userid" size='10' class="input_style1"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">PASSWORD</td>
                    <td><input type="password" maxlength="12" name="password" size='10' class="input_style1"></td>
                </tr>
            </table>
			            <br>
            <input type="submit" value="로그인" onclick="javascript:login_check()" />
            <input type="button" value="회원가입" onclick="parent.location.href='insert.html'" />
        </form>
  </td>
 </tr>
</form>
<% } 
else{ 
%>
<link rel="stylesheet" href="style.css" type="text/css">
 <tr> 
  <td height="90" bgcolor='#F5F5F5'> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr align="center"> 
     <td width="4%" class="style2"><%=mem_name%> 님 <br>환영합니다.</td>
    </tr>
   </table>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
     <td height="5"></td>
    </tr>
 <tr> 
     <td align="center"><font  class="style2"><a href="logout.jsp">로그아웃</a></font></td>
     <td width="5">&nbsp;</td>
    </tr>
    <tr>
     <td align="center" class="style2"><a href="select.jsp" target="mainFrame">개인 정보 조회</a></td>
    </tr>
    <tr> 
     <td align="center"><font  class="style2"><a href="admin.jsp" target="mainFrame">전체 목록보기</a></font></td>
     <td wdth="5">&nbsp;</td>
    </tr>
   </table>
<%
 }
%>
