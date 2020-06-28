<%@ page import="submission_review_system.entity.Author" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% Author author = (Author) session.getAttribute("author");%>

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
<div class="flex mdui-col-md-12" style="--flex-direction: column; --justify-content: center; --align-items: center;">
    <form action="<%=host%>/api/author" method="post" class="flex" style="--flex-direction: column; --justify-content: center; --align-items: center;">
        <h1 class="doc-title mdui-text-color-theme">基本信息</h1>
        <input type="hidden" value="<%=author.getAccount_()%>" name="account_"/>
        密码：<input type="text" value="<%=author.getPassword_()%>" name="password_"/>
        姓名：<input type="text" value="<%=author.getName_()%>" name="name_"/>
        联系方式：<input type="text" value="<%=author.getContact()%>" name="contact"/>
        <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">提交修改</button>
    </form>
</div>
</body>
</html>