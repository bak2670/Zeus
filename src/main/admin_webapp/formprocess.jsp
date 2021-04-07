<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
	String[] checks = request.getParameterValues("check");

	int checklen = checks.length;

	try {
		for (int i = 0; i < checklen; i++) {
			out.println(checks[i] + ";");
		}
	} catch (Exception ex) {
		out.println("exception occured");
	}
%>
</body>
</html>