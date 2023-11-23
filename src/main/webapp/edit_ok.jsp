<%@ page import="com.example.pp2023_pj4_2.bean.MemberVO" %>
<%@ page import="com.example.pp2023_pj4_2.dao.MemberDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String localPlanet = request.getParameter("local_planet");
    String species = request.getParameter("species");
    String purpose = request.getParameter("purpose");

    MemberVO member = new MemberVO(id, name, localPlanet, species, purpose);

    MemberDAO dao = new MemberDAO();
    dao.updateMember(member);

    response.sendRedirect("index.jsp");
%>


