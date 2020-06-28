<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% String str = (String) request.getAttribute("share");%>

<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>
<div class="mdui-row" style="margin-right: 0px; margin-left: 0px; ">
    <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
        <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
        <a href="<%=host%>/api/login" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">作家园</a>
    </div>
</div>
<div class="flex mdui-col-md-12" style="--flex-direction: column; --justify-content: center; --align-items: center;">
    <h1>文章分享码：<%=str%><br>
        将分享码分享给其他作者即可多人创作文章.<br>
        在我的创作中可以提交审稿.
    </h1>
    <form method="get" action="<%=host%>/pages/author.jsp">
        <button class="mdui-btn mdui-color-pink-accent mdui-ripple"  type="submit">返回首页</button>
    </form>
</div>
</body>
</html>

