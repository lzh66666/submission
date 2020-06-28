<%@page pageEncoding="UTF-8" %>
<%@include file="/pages/login.jsp" %>
<%
    if (session.getAttribute("author") != null) {
        request.getRequestDispatcher("/pages/author.jsp").forward(request, response);
    } else if (session.getAttribute("reviewer") != null) {
        request.getRequestDispatcher("/pages/reviewer.jsp").forward(request, response);
    } else {
%>
        <%="<script type='text/javascript'> mdui.alert('用户名或者密码错误，请重新输入！');</script>"%>
<%
    }
%>
