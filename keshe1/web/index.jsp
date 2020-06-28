<%-- 组件化开发转发页面 --%>
<%
    if (request.getAttribute("author") == null)
        response.sendRedirect("pages/login.jsp");
%>
