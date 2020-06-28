<%@ page import="submission_review_system.entity.Author" %>
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
        <a href="<%=host%>/api/login" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">作家园</a>
    </div>
</div>
<div class="flex mdui-col-md-12" style="--flex-direction: column; --justify-content: center; --align-items: center;">
    <form class="flex mdui-col-md-6" method="post" action="<%=host%>/api/modify">
        <div class="mdui-textfield mdui-col-md-12">
            <label class="mdui-textfield-label">Subject</label>
            <textarea class="mdui-textfield-input" name="name_"><%=submission.getName_()%></textarea>
        </div>
        <div class="mdui-textfield mdui-col-md-12">
            <textarea class="mdui-textfield-input" placeholder="Description" name="content"><%=submission.getContent()%></textarea>
        </div>
        <input type="hidden" name="state" value="0"/>
        <input type="hidden" name="id" value="<%=submission.getId()%>"/>
        <button class="mdui-btn mdui-color-pink-accent mdui-ripple" type="submit">存为草稿</button>
    </form>
</div>
</body>
</html>