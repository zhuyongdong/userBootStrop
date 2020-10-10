<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20 0020
  Time: 下午 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert-User</title>
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
            <form role="form" action="/UserServlet?method=insert" method="post" style="border: 3px dashed red">
                <div class="form-group">
                    <label for="exampleInputEmail1">用户姓名</label><input type="text" class="form-control" id="exampleInputEmail1" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">用户密码</label><input type="password" class="form-control" id="exampleInputPassword1" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">用户性别</label><input type="text" class="form-control" id="sex" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">用户生日</label><input type="date" class="form-control" id="birthday" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">员工身份证号</label><input type="text" class="form-control" id="tell" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">员工住址</label><input type="text" class="form-control" id="adree" />
                </div>
                <div class="col-md-12 column" style="text-align: center">
                    <button type="submit" class="btn btn-info btn-default">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
