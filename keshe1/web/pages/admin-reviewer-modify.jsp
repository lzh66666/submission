<%@ page import="java.util.List" %>
<%@ page import="submission_review_system.entity.Reviewer" %>
<%@ page import="submission_review_system.dao.ReviewerDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    Reviewer reviewer = null;
    String id = request.getParameter("id");
    try {
        List<Reviewer> id1 = new ReviewerDao().findBy("id", id);
        if (id1.size() != 0) {
            reviewer = id1.get(0);
        }
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

<form action="<%=host%>/pages/admin-reviewer-modify-do.jsp" method="post">
    <input name="id" type="hidden" value="<%=reviewer.getId()%>">
    <div class="mdui-textfield">
        <label class="mdui-textfield-label">账户</label>
        <input class="mdui-textfield-input" name="account_" value="<%=reviewer.getAccount_()%>" type="text"/>
    </div>
    <div class="mdui-textfield">
        <label class="mdui-textfield-label">密码</label>
        <input class="mdui-textfield-input" name="password_" value="<%=reviewer.getPassword_()%>" type="text"/>
    </div>
    <div class="mdui-textfield">
        <label class="mdui-textfield-label">姓名</label>
        <input class="mdui-textfield-input" name="name_" value="<%=reviewer.getName_()%>" type="text"/>
    </div>
    <div class="mdui-textfield">
        <label class="mdui-textfield-label">联系方式</label>
        <input class="mdui-textfield-input" name="contact" value="<%=reviewer.getContact()%>" type="text"/>
    </div>
    <input class="mdui-textfield-input" name="total" value="<%=reviewer.getTotal()%>" type="hidden"/>
    <button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>执行</button>
</form>
</body>
</html>