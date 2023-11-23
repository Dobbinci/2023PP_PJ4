<%@ page import="com.example.pp2023_pj4_2.bean.MemberVO" %>
<%@ page import="com.example.pp2023_pj4_2.dao.MemberDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>
<body>
    <%
        MemberDAO dao = new MemberDAO();
        List<MemberVO> memberList= dao.listMember();
    %>
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">Welcome to Andromeda Galaxy Station!</h1>
            <p class="col-md-8 fs-4">Here, enjoy a variety of dishes and activities on the numerous planets of the Andromeda Galaxy, and relax in comfortable amenities and accommodations!</p>
            <a href="form.html"><button class="btn btn-primary btn-lg" type="button">Add visitor</button></a>
        </div>
    </div>
    <div>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th scope="col">Detail</th>
                <th scope="col" class="col-id">Name</th>
                <th scope="col">Local Planet</th>
                <th scope="col">Species</th>
                <th scope="col">Purpose</th>
            </tr>
            </thead>
            <tbody>
            <% for(MemberVO vo : memberList) { %>
            <tr>
                <td><a onclick="goToView(<%=vo.getId()%>)"><button class="btn btn-primary btn-lg" type="button">
                    <i class="fas fa-search"></i>
                </button></a></td>
                <td><%=vo.getName() %></td>
                <td><%=vo.getLocal_planet() %></td>
                <td><%=vo.getSpecies() %></td>
                <td><%=vo.getPurpose() %></td>
                <td><a onclick="confirmDelete(<%=vo.getId()%>)"><button class="btn btn-danger btn-lg" type="button">
                    <i class="fas fa-trash-alt"></i>
                </button></a></td>
                <td><a href="edit.jsp?id=<%=vo.getId()%>"><button class="btn btn-primary btn-lg" type="button">
                    <i class="fas fa-edit"></i>
                </button></a></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this data?")) {
                window.location.href = "delete.jsp?id=" + id;
            }
        }
        function goToView(id) {
            window.location.href = "view.jsp?id=" + id;
        }
    </script>
</body>
</html>
