<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>
    <div class="mdui-row" style="margin-right: 0px;
                margin-left: 0px; ">
        <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
            <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
            <a href="<%=host%>/pages/admin" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">管理员</a>
        </div>
    </div>
    <form action="<%=host%>/api/add" method="post">
        <div class="mdui-textfield">
            <label class="mdui-textfield-label">名称</label>
            <input class="mdui-textfield-input" name="name_" value="" type="text"/>
        </div>
        <div class="mdui-textfield">
            <label class="mdui-textfield-label">状态</label>
            <input class="mdui-textfield-input" name="state" value="" type="text"/>
        </div>
        <div class="mdui-textfield">
            <label class="mdui-textfield-label">内容</label>
            <input class="mdui-textfield-input" name="content" value="" type="text"/>
        </div>
        <button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>执行</button>
    </form>
</body>
</html>