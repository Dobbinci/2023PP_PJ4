<%@ page import="com.example.pp2023_pj4_2.bean.MemberVO" %>
<%@ page import="com.example.pp2023_pj4_2.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: vinci
  Date: 11/23/23
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link href="my.css" rel="stylesheet">
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  MemberDAO dao = new MemberDAO();
  MemberVO member = dao.getMember(id);
%>
<div class="container mt-5">
  <h2 class="text-center mb-4">Profile Details</h2>
  <div class="row h-100" >
    <div class="d-flex justify-content-center align-items-center mb-4">
      <div class="btn-group">
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="goToEdit(<%=id%>)">Edit</button>
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="confirmDelete(<%=id%>)">Delete</button>
      </div>
    </div>
    <div class="col-md-8 offset-md-2">
      <div class="card">
        <div class="card-header">
          Profile Information
        </div>
        <div class="card-body">
          <h5 class="card-title"><strong>Name: </strong><%=member.getName()%></h5>
          <p class="card-text"><strong>Local Planet: </strong><%=member.getLocal_planet()%></p>
          <p class="card-text"><strong>Species: </strong><%=member.getSpecies()%></p>
          <p class="card-text"><strong>Purpose For Visitation: </strong><%=member.getPurpose()%></p>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  function confirmDelete(id) {
    const result = confirm("Are you sure you want to delete the data?");
    if (result) {
      window.location.href = "delete.jsp?id=" + id;
    } else {
      alert("Canceled");
    }
  }
  function goToEdit(id) {
    window.location.href = "edit.jsp?id=" + id;
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

