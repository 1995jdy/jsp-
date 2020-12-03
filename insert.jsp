<%@ page info="insert" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page language="java" import="java.sql.*,java.text.*,java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String userid	= request.getParameter("userid");
String password	= request.getParameter("password");
String username	= request.getParameter("name");
int age		= Integer.parseInt(request.getParameter("age"));
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String mail		= request.getParameter("email");
String phone	= phone1+"-"+phone2+"-"+phone3;
int classes = 1;
String query		= new String();
Connection conn = null;
ResultSet rs= null;
PreparedStatement pstmt = null;
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
query = "insert into member values (?, ?, ?, ?, ?, ?, ?, 0)";
//                                  1  2  3  4  5  6  7  8
pstmt = conn.prepareStatement(query);
pstmt.setString(1, userid);
pstmt.setString(2, password); 
pstmt.setString(3, username);
pstmt.setInt(4, age);
pstmt.setString(5, phone1+"-"+phone2+"-"+phone3);
pstmt.setString(6, mail);
pstmt.setInt(7, classes);
pstmt.executeUpdate();
} catch(SQLException e){
  out.println("<script>alert('가입처리가 되지 않았습니다. 다시 시도해 주세요.'); history.back();</script>");
} finally {
conn.close();
}
%>
<html>
<head>
<title>가입 완료</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
<!--
function doSubmit() {
form = document.join;
if(!form.userid.value){
alert('아이디를 입력하지 않았습니다.');
form.userid.focus();
return;
}
form.submit();
}
</script>
</head>
<body text="#000000" bgcolor="#FFFFFF">
<br>
<br>
<form name="join" method="post" action="modify.jsp">
<input type=hidden name="userid" value="<%=userid%>">
<input type=hidden name="username" value="<%=username%>">
<input type=hidden name="password" value="<%=password%>">
<input type=hidden name="phone1" value="<%=phone1%>">
<input type=hidden name="phone2" value="<%=phone2%>">
<input type=hidden name="phone3" value="<%=phone3%>">
<input type=hidden name="age" value="<%=age%>">
<input type=hidden name="mode" value="modify">
<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
<tr align="center"> 
<td colspan="2" background="image/sky_bar.gif">가입을 축하드립니다. 입력하신 내용을 확인하세요.</td>
</tr>
<tr> 
<td width="15%" align="right">아이디</td>
<td width="75%"><%=userid%></td>
</tr>
<tr> 
<td width="15%" align="right">이름</td>
<td width="75%"><%=username%></td>
</tr>
<tr> 
<td width="15%" align="right">나이</td>
<td width="75%"><%=age%></td>
</tr>
<tr> 
<td width="15%" align="right">휴대폰</td>
<td width="75%">
<% 
if(phone.equals("--")) {
out.println("<font color='blue'>선택하지 않았습니다.</font>");
}else{
out.println(phone); 
} 
%>
 </td>
</tr>
 <tr> 
<td width="15%" align="right">EMAIL</td>
<td width="75%"><%=mail%></td>
</tr>
 <tr> 
<td width="15%" align="right">반</td>
<td width="75%"><%=classes%></td>
</tr>
<tr >
<td colspan="2" align="center">
<input type="button" value="확 인" onClick="location='index.html'">
<input type="button" value="수 정" onClick="doSubmit()"></td>
</tr>
</table>
</body>
</html>
