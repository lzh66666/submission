<%@ page import="submission_review_system.entity.Author" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="submission_review_system.entity.Submission" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%ArrayList<Submission> contributionsList = (ArrayList) request.getAttribute("submissions");%>
<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>
<div class="mdui-row" style="margin-right: 0px;
            margin-left: 0px; ">
    <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
        <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
        <a href="<%=host%>/api/login" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">作家园</a>
    </div>
</div>
<div class="mdui-table-fluid">
    <table class="mdui-table mdui-table-hoverable">
        <thead>
        <tr>
            <th>#</th>
            <th>稿件名称</th>
            <th>分享码</th>
            <th>稿件状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            Integer index = 0;
            for (Submission submission : contributionsList) {
        %>
        <tr>
            <td><%=++index%></td>
            <td><%=submission.getName_()%></td>
            <td><%=submission.getId()%></td>
            <%
                String str = "";
                if (submission.getState() == 0) str = "未投递";
                if (submission.getState() == 1) str = "已投递";
                if (submission.getState() == 2) str = "待审核";
                if (submission.getState() == 3) str = "未通过";
                if (submission.getState() == 4) str = "审核通过";
            %>
            <td><%=str%></td>
            <% String a = "";
                if (submission.getState() == 0)
                    a = "<form action='" + host + "/api/modify' method='get'><input type='hidden' name='id' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>修改</button></form>" +
                        "<form action='" + host + "/api/submit' method='post'><input type='hidden' name='id' value='" + submission.getId() + "'/><input type='hidden' name='state' value='1'/><input type='hidden' name='content' value='" + submission.getContent() + "'/><input type='hidden' name='name_' value='" + submission.getName_() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>投递</button></form>" +
                        "<form action='" + host + "/api/submit' method='get'><input type='hidden' name='id' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>删除</button></form>";
                else if (submission.getState() == 4)
                    a = "<form action='" + host + "/api/pay' method='get'><input type='hidden' name='sid' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>递交审稿费</button></form>";
                else if (submission.getState() == 5)
                    a = "已交付";
                else
                    a = "<form action='" + host + "/api/submit' method='get'><input type='hidden' name='id' value='" + submission.getId() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>删除</button></form>";
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