<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
Object mem_id = session.getAttribute("member_id"); 
session.putValue(session.getId(), mem_id);
String userid = (String)session.getValue(session.getId());
if(userid == null)
session.putValue(session.getId(), mem_id);
String sql="select * from member where id=?" ;
Connection con=null;
PreparedStatement pst=null; 
ResultSet rs=null;
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e){
out.println(e.getMessage());
}
try {
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
} catch (SQLException e) {
out.println(e);
}
try {
pst = con.prepareStatement(sql);
pst.setString(1,userid);
rs = pst.executeQuery(); 
if (!(rs.next())) {
out.println("�ش�Ǵ� ȸ���� �����ϴ�.");
} else {
String username = rs.getString("name");
String phone = rs.getString("phone_number");
%>
<html>
<head>
<title><%=username%> ȸ���� ���� ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<head>
<body>
<form name="join" method="post" >
<input type=hidden name="userid" value="<%=userid%>">
<input type=hidden name="mode" value="modify">
<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class=style2>
<tr align="center"> 
<td colspan="2"> <%=username%> ȸ������ ���������� ������ �����ϴ�.</td>
</tr>
<tr> 
<td width="30%" align="right">���̵�</td>
<td width="70%"><%=userid%></td>
</tr>
<tr> 
<td width="30%" align="right">�̸�</td>
<td width="70%"><%=username%></td>
</tr>
<tr> 
<td width="30%" align="right">����</td>
<td width="70%"><%=rs.getInt("age")%></td>
</tr>
<tr> 
<td width="30%" align="right">�޴���</td>
<td width="70%">
<% 
out.println(phone); 
%>
<tr> 
<td width="30%" align="right">E-MAIL</td>
<td width="70%"><%=rs.getString("mail")%></td>
</tr>
<tr> 
<td width="30%" align="right">��</td>
<td width="70%"><%=rs.getInt("classes")%></td>
</tr>

</td>
</tr>
<tr >
<td colspan="2" align="center">
<input type="button" value="Ȯ ��" onClick="location='right_Frame.html'">
<input type="button" value="�� ��" onClick="location='modify_session.jsp?mode=modify'">
<input type="button" value="ȸ�� Ż��" onClick="location='delete.jsp'">
</td>
</tr>
</table>
</form>
</body>
</html> 
<% 
}
rs.close();
con.close();
pst.close();
} catch (SQLException e) {
out.println(e);
}
%>