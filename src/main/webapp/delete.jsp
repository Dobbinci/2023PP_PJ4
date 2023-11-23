<%@ page import="com.example.pp2023_pj4_2.bean.MemberVO" %>
<%@ page import="com.example.pp2023_pj4_2.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: vinci
  Date: 11/22/23
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleted</title>
</head>
<body>
    <h1 class="display-5 fw-bold">Deleted completely</h1>
    <%
        int memberId = Integer.parseInt(request.getParameter("id"));
        System.out.println("deleted id = " + memberId);
        MemberDAO dao = new MemberDAO();
        dao.deleteMember(memberId);

        response.sendRedirect("index.jsp");
    %>
</body>
</html>
