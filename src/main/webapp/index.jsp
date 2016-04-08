<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%	
	String ipAddress = "It's not very nice to hide from Cthulhu!";
	StringBuffer exMsg = new StringBuffer();
	try {
	 	ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
	} catch (Exception ex) {
		exMsg.append("<div class='error'>");
		StackTraceElement[] ste = ex.getStackTrace();
		int counter = 0;
		out.println(ex.getMessage() + "<br>");
		while (counter < ste.length && counter < 15) {
			out.println(ste[counter] + "<br>");
			counter++;
		}
		out.println("</div>");
	}
%>

<html>
<head>
<title>myIP</title>
<style>
.image { 
   position: relative; 
}
.error { 
	text-align: left;
	color: #FFFF00;
	font-weight: bold;
}
h2 {
	position: absolute;
	top: 270px;
	left: 0;
	width: 850px;
	text-align: right;
	color: #FFFF00;
	font-weight: bold;
}
</style>
</head>

<body>

<div class="image">
      <img src="cthulhu.jpg" alt="" />      
      <h2>Your IP Address: <%= ipAddress %></h2>
</div>
<p class="image"></p>
</body>

</html>
