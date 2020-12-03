<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
Connection con= null;
Statement st =null;
ResultSet rs =null;
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e ) {
out.println(e);
}
try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
} catch (SQLException e) {
out.println(e);
}
try {
st = con.createStatement();
rs = st.executeQuery("select * from member order by id");
%>
<html>
<head>
<title>우리 회원 정보관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class=style2>
<TH>사용자 ID</TH>
<TH>이 름</TH>
<TH>나 이</TH>
<% if (!(rs.next())) {%>
<TR><TD colspan=4>등록된 회원이 없습니다.</TD></TR>
<% } else {
do {
out.println("<TR>");
out.println("<TD align='center'>" + rs.getString("id") + "</TD>");
out.println("<TD align='center'>" + rs.getString("name") + "</TD>");
out.println("<TD align='center'>" + rs.getString("age") + "</TD>");
out.println("</TR>");
}while(rs.next());
}
rs.close();
st.close();
con.close();
} catch (SQLException e) {
System.out.println(e);
}
%>
</TABLE>
</CENTER> 
</BODY>
</HTML>
