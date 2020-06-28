<%@ page import="submission_review_system.entity.Submission" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<% Submission submission = (Submission) request.getAttribute("submission");%>
<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>

    <div class="mdui-row" style="margin-right: 0px; margin-left: 0px; ">
        <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
            <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
            <a href="<%=host%>/api/login" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">审稿人</a>
        </div>
    </div>
    <div class="flex mdui-col-md-12" style="--flex-direction: column; --justify-content: center; --align-items: center;">
        <div class="flex mdui-col-md-6">
            <div class="mdui-textfield mdui-col-md-12">
                <label class="mdui-textfield-label">稿件名称</label>
                <textarea class="mdui-textfield-input" name="name_" readonly="readonly"><%=submission.getName_()%></textarea>
            </div>

            <div class="mdui-textfield mdui-col-md-12">
                <textarea class="mdui-textfield-input" placeholder="Description"
                          name="content" readonly="readonly"><%=submission.getContent()%></textarea>
            </div>
        </div>
        <form method="get" action="<%=host%>/api/adopt">
            <input type="hidden" name="id" value="<%=submission.getId()%>"/>
            <div class="mdui-textfield mdui-col-md-12">
                <label class="mdui-textfield-label">稿费</label>
                <textarea class="mdui-textfield-input" name="payment"></textarea>
            </div>
            <div class="mdui-textfield mdui-col-md-12">
                <label class="mdui-textfield-label">审阅费</label>
                <textarea class="mdui-textfield-input" name="fee"></textarea>
            </div>
            <div class="mdui-textfield mdui-col-md-12">
                <label class="mdui-textfield-label">版面费</label>
                <textarea class="mdui-textfield-input" name="charge"></textarea>
            </div>
            <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">接稿审核</button>
        </form>
    </div>
</body>
</html>