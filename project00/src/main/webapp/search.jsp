<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���԰˻�</title>
</head>
<body>
	<h1>���� �˻�</h1>
	<form action="search.jsp" method="post">
		<input type="text" name="keyword" placeholder="�˻��� �Է�">
		<input type="submit" value="�˻�">
	</form>
	
<%
Connection conn = null;

String url = "jdbc:oracle:thin:@localhost:1521/xe";
String user = "system";
String password = "123456";

Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, user, password);

//�˻��� ó��
String keyword = request.getParameter("keyword");

// SQL ���� �ۼ�
String sql = "SELECT * FROM namecard";
if (keyword != null && !keyword.isEmpty()){
	sql += " WHERE name LIKE '%" + keyword + "%' OR telno LIKE '%" + keyword + "%' OR mail LIKE '%" + keyword + "%'";
}

// Statement ���� �� ����
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1">
	<tr>
		<th>����</th>
		<th>�̸�</th>
		<th>����ȣ</th>
		<th>����</th>
	</tr>
	<%
	int count =1;
	while (rs.next()){
	%>
	<tr>
		<td><%= count++%></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("telno") %></td>
		<td><%= rs.getString("mail") %></td>
	</tr>
	<%
	}
	rs.close();
	stmt.close();
	conn.close();
	%>
</table>
</body>
</html>