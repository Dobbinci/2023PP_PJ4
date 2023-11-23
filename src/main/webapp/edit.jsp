<%@ page import="com.example.pp2023_pj4_2.bean.MemberVO" %>
<%@ page import="com.example.pp2023_pj4_2.dao.MemberDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MemberDAO dao = new MemberDAO();
    MemberVO member = dao.getMember(id);
%>
<div class="container">
    <div class="py-5 text-center">
        <h2>Register</h2>
        <p class="lead">Please write in your information below</p>
    </div>

    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Profile Information</h4>
        <form class="needs-validation" name="registerForm" action="edit_ok.jsp" method="post">
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <div class="row g-3">

                <div class="col-sm-6">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" value=<%=member.getName()%>>
                </div>

                <div class="col-12">
                    <label for="local_planet" class="form-label">Local Planet</label>
                    <div class="input-group has-validation">
                        <input type="text" class="form-control" id="local_planet" name="local_planet" placeholder="Gliese 581", value=<%=member.getLocal_planet()%> >
                    </div>
                </div>

                <div class="col-12">
                    <label for="species" class="form-label">Species</label>
                    <input type="text" class="form-control" id="species" name="species" placeholder="Esparian", value=<%=member.getSpecies()%>>
                </div>

                <div class="col-sm-12">
                    <label for="purpose" class="form-label">Purpose For Visitation</label>
                    <textarea class="form-control" id="purpose" name="purpose" placeholder="write less than 100 characters" rows="4"><%=member.getPurpose()%>
                    </textarea>
                </div>

                <hr class="my-4">
                <button class="w-100 btn btn-primary btn-lg" type="submit">Complete</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>