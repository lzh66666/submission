<%@ page import="java.util.ArrayList" %>
<%@ page import="submission_review_system.entity.Order" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%ArrayList<Order> orders = (ArrayList) request.getAttribute("orders");%>
<!DOCTYPE html>
<html>
<%@include file="/components/head.jsp" %>
<body>
<div class="mdui-row" style="margin-right: 0px;
            margin-left: 0px; ">
    <div class="mdui-appbar mdui-ripple background-color height" style="--color:rgb(63,81,181);--height: 4rem">
        <a href="<%=host%>" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;"><%=siteName%></a>
        <a href="<%=host%>/api/login" class="mdui-typo-headline mdui-text-color-white" style="margin: 1rem;padding:0rem;">审稿人</a>
    </div>
</div>
<div class="mdui-table-fluid">
    <table class="mdui-table mdui-table-hoverable">
        <thead>
            <tr>
                <th>#</th>
                <th>稿件ID</th>
                <th>稿费</th>
                <th>审稿费</th>
                <th>版面费</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <%
            Integer index = 0;
            for (Order order : orders) {
        %>
        <tr>
            <td><%=++index%></td>
            <td><%=order.getSubmission_id()%></td>
            <td><%=order.getPayment()%></td>
            <td><%=order.getFee()%></td>
            <td><%=order.getCharge()%></td>
            <%
                String a = null;
                if(order.getState()==0) {
                            a = "<form action='" + host + "/api/pass' method='get'><input type='hidden' name='oid' value='" + order.getId() + "'/><input type='hidden' name='id' value='" + order.getSubmission_id() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>通过</button></form>"
                            + "<form action='" + host + "/api/unpass' method='get'><input type='hidden' name='oid' value='" + order.getId() + "'/><input type='hidden' name='id' value='" + order.getSubmission_id() + "'/><button class='mdui-btn mdui-color-pink-accent mdui-ripple' type='submit'>不通过</button></form>";
                }else if(order.getState()==1){
                    a = "已通过";
                }else{
                    a = "未通过";
                }%>
            <td class="flex" style="--flex-direction: row; --justify-content: space-around; --align-items: center;"><%=a%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>