<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
    <form class="flex mdui-col-md-6" style="--flex-direction: column; --justify-content: center; --align-items: center;" method="get" action="<%=host%>/api/partake">
        <div class="mdui-textfield mdui-col-md-6">
            <label class="mdui-textfield-label">分享码</label>
            <textarea class="mdui-textfield-input"  name="id"></textarea>
        </div>
        <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">确认参与</button>
    </form>
</div>
</body>
</html>