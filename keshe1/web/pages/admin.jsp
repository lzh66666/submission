<%@ page import="submission_review_system.entity.Author" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


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
<div class="flex mdui-col-md-12" style="--flex-direction: column; --justify-content: center; --align-items: center;">
    <h1 class="doc-title mdui-text-color-theme">管理界面</h1>

    <div class="mdui-col-md-6 flex" style="--flex-direction: row; --justify-content: space-around; --align-items: center;">
        <form method="get" action="<%=host%>/pages/admin-author.jsp">
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">作者管理</button>
        </form>
        <form method="get" action="<%=host%>/pages/admin-submission.jsp">
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">稿件管理</button>
        </form>
        <form method="get" action="<%=host%>/pages/admin-reviewer.jsp">
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">审阅人管理</button>
        </form>
        <form method="get" action="<%=host%>/db/back">
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">数据库备份</button>
        </form>
        <form method="post" action="<%=host%>/db/back">
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">数据库还原</button>
        </form>
    </div>
</div>
</body>
</html>