<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/19 0019
  Time: 上午 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>BootStrop-View</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/static/dist/bootstrap-table.min.css">

    <script type="text/javascript" src="/static/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/dist/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="/static/dist/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-bordered table-hover table-striped"
                   data-toggle="table"
                   data-url="/UserServlet?method=findAll">
                <caption><h1 style="text-align: center;color: lightblue;font-weight: bold">用户信息表</h1></caption>
                <%--<caption><h1 style="color: lightblue;">欢迎${tempName.name}</h1></caption>--%>
                <thead>
                <tr>
                    <th data-field="uid">用户编号</th>
                    <th data-field="uname">用户姓名</th>
                    <th data-field="sex">用户性别</th>
                    <th data-field="birthday">用户生日</th>
                    <th data-field="cardid">身份证号</th>
                    <th data-field="addr">用户住址</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
