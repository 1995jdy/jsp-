<%@ page info="member modify" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*, java.io.*, java.net.*, java.util.*, java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
String mode		= request.getParameter("mode");
String userid = (String)session.getValue(session.getId());
String username	= request.getParameter("username");
String password	= request.getParameter("password");
String email = request.getParameter("email")==null?"":request.getParameter("email");
int age		= Integer.parseInt(request.getParameter("age"));
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String query = new String();
StringTokenizer st_phone	= null;
 java.util.Date yymmdd = new java.util.Date() ;
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
String regdate=myformat.format(yymmdd);
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e ) {
out.println(e);
}
try {
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
stmt = conn.createStatement();
if(mode.equals("null") || mode.equals("modify")){
query = "select * from member where id='"+userid+"'";
rs = stmt.executeQuery(query);
if(rs.next()){
username	= rs.getString("username");
password	= rs.getString("password");
email		= rs.getString("email");
st_phone = new StringTokenizer(rs.getString("phone"), "-");
if(st_phone.hasMoreTokens()){
phone1 = st_phone.nextToken();
} 
if(st_phone.hasMoreTokens()){
phone2 = st_phone.nextToken();
} 
if(st_phone.hasMoreTokens()){
phone3 = st_phone.nextToken();
}
}
rs.close();
}else if(mode.equals("update")){
query = "update member set password=?, name=?, age=?, phone_number=?, mail=? where id='"+userid+"'";
pstmt = conn.prepareStatement(query);
pstmt.setString(1, password);
pstmt.setString(2, username);
pstmt.setInt(3, age);
pstmt.setString(4, phone1+"-"+phone2+"-"+phone3);
pstmt.setString(5, email);
pstmt.executeUpdate();
response.sendRedirect("index.html");
}
} catch(SQLException e) {
} finally {
conn.close();
}
%>
<html>
<head>
<title>** 회원정보 수정 **</title>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="style.css" type="text/css">
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) {
window.open(theURL,winName,features);
}

function doSubmit() {
form = document.join;
if(!form.username.value){
alert('이름을 입력하지 않았습니다.');
form.username.focus();
return;
 }
 if(!form.password.value){
alert('비밀번호를 입력하지 않았습니다.');
form.password.focus();
return;
}

if(form.password.value != form.password2.value){
alert('비밀번호가 일치하지 않았습니다.');
form.password.value = "";
form.password2.value = "";
form.password.focus();
return;
}

if(!form.age.value){
alert('나이를 입력하지 않았습니다.');
form.age.focus();
return;
}

if(!form.phone2.value){
alert('핸드폰번호를 입력하지 않았습니다.');
form.phone2.focus();
return;
}

if(isNaN(form.phone2.value)){
alert('핸드폰 번호는 숫자로 입력해주세요.');
form.phone2.focus();
return;
}

if(!form.phone3.value){
alert('핸드폰번호를 입력하지 않았습니다.');
form.phone3.focus();
return;
}

if(isNaN(form.phone3.value)){
alert('핸드폰번호는 숫자로 입력해주세요.');
form.phone3.focus();
return;
}

if(form.email.value){
if(form.email.value.indexOf("@") < 0){
alert('Email주소 형식이 틀립니다.');
form.email.focus();
return;
}

if(form.email.value.indexOf(".") < 0){
alert('Email 도메인 주소가 틀립니다.');
form.email.focus();
return;
}
}

form.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
<form name="join" method="post" action="modify_session.jsp">
<table width="622" height="536" border="1" cellspacing="0" cellpadding="0" bordercolor="#A3C2F6">
<tr> 
<td width="15%" align="right"><font color="#FF0000" class="style2"> <font color="#FF0000" size=1>★</font></font><font class="style2">아이디&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp;
<input type="text" name="userid" size="10" maxlength="10" class="box" value="<%=userid%>" readonly></font></font></td>
</tr>
<tr> 
<td width="15%" align="right" ><font color="#FF0000" size=1>★</font><font class="style2">비밀번호&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp; 
<input type="text" name="password" size="12" maxlength="12" class="box">
<font class="style2">다시한번&nbsp;&nbsp; </font>
<input type="password" name="password2" size="12" maxlength="12" class="box">
<font class="style2">(영문+숫자 4~12자리)</font></td>
</tr> 
<tr > 
<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">이름&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp; 
<input type="text" name="username" size="10" maxlength="10" class="box" value="<%=username%>"></td>
</tr>
<tr > 
<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">나이&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp; 
<input type="number" name="age" size="10" maxlength="10" class="box" value="<%=age%>"></td>
</tr>
<tr > 
<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">핸드폰&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp; 
<input type="text" name="phone1" size="4" maxlength="4" class="box" value="<%=phone1%>"> -
<input type="text" name="phone2" size="4" maxlength="4" class="box" value="<%=phone2%>"> - 
<input type="text" name="phone3" size="4" maxlength="4" class="box" value="<%=phone3%>"></td>
</tr>
<td width="15%" align="right"><font class="style2">EMAIL&nbsp;&nbsp;</font></td>
<td width="75%">&nbsp;
<input type="text" name="email" size="20" maxlength="50" class="box" value="<%=email%>"></td>
</tr>
</table>
<br>
<table width="614" border="0" cellspacing="0" cellpadding="0" align="center" >
<tr>
<td width=100% align="center"> 
<input type="hidden" name="mode" value="update">
<input type="button" value="등 록" onClick="doSubmit()">&nbsp;
<input type="button" value="취 소" onClick="javascript:history.go(-1);">
</td>
</tr>
</table>

</form>
</TD></TR></TABLE>
</div>
<div align="center">
<table width="638" border="0" cellpadding="0" cellspacing="0">
</table>
</div>
</body>
</html>
