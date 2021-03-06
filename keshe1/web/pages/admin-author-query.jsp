<%@ page import="java.util.List" %>
<%@ page import="submission_review_system.dao.SubmissionDao" %>
<%@ page import="submission_review_system.entity.Submission" %>
<%@ page import="submission_review_system.dao.ContributionDao" %>
<%@ page import="submission_review_system.entity.Contribution" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String id = request.getParameter("id");
    //List<Submission> all = new ArrayList();
    //try {
    //    List<Contribution> contribution = new ContributionDao().findBy("author_id", id);
    //    for (Contribution c : contribution) {
    //        String submissionId = c.getSubmissionId();
    //        List<Submission> id1 = new SubmissionDao().findBy("id", submissionId);
    //        if (id1.size() != 0) {
    //            all.add(id1.get(0));
    //        }
    //    }
    //} catch (Exception e) {
    //    e.printStackTrace();
    //}

    List<Submission> all = null;
    try {
        all = new SubmissionDao().findByPro(id);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>

<div class="mdui-row" style="margin-right: 0px;
            margin-left: 0px; ">
    <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
        <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
        <a href="<%=host%>/pages/admin.jsp" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">管理员</a>
    </div>
</div>
<form action='<%=host%>/pages/admin-submission-insert.jsp' method='get'>
    <button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>增加</button>
</form>

<div class="mdui-table-fluid">
    <table class="mdui-table mdui-table-hoverable">
        <thead>
        <tr>
            <th>#</th>
            <th>ID</th>
            <th>名称</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            Integer index = 0;
            for (Submission submission : all) {
        %>
        <tr>
            <td><%=++index%></td>
            <td><%=submission.getId()%></td>
            <td><%=submission.getName_()%></td>
            <td><%=submission.getState()%></td>
            <%
                String a = "<form action='" + host + "/pages/admin-submission-modify.jsp' method='get'><input type='hidden' name='id' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>修改</button></form>" +
                    "<form action='" + host + "/pages/admin-submission-delete.jsp' method='get'><input type='hidden' name='id' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>删除</button></form>";
            %>
            <td class="flex" style="--flex-direction: row; --justify-content: space-around; --align-items: center;"><%=a%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>


</body>
</html>