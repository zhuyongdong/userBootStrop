<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/19 0019
  Time: 下午 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Userinfo-List</title>
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
        <caption><h1 style="text-align: center;color: lightblue;font-weight: bold">用户信息表</h1></caption>
        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-success"
                    onclick="openAddModal()">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-warning"
                    onclick="openEditModal()">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-danger"
                    onclick="openRemoveModal()">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
            <table class="table-bordered table-hover table-striped" id="grid">
<%--
                <%--<caption><h1 style="color: lightblue;">欢迎${tempName.name}</h1></caption>--%>
    <div class="container">
        <div class="row clearfix">
            <h4 class="text-left text-info">
                查询条件
            </h4>
            <form id="formSearch" class="form-horizontal">
                <div class="col-md-12 column">
                    <label class="col-md-1 text-right">编号：</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="search-uid">
                    </div>
                    <label class="col-md-1 text-right">姓名：</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="search-uname">
                    </div>
                    <label class="control-label col-md-1 text-right">性别：</label>
                    <div class="col-md-2">
                        <select id="search-sex" class="form-control">
                            <option value="">-- 请选择 --</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="col-md-2" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query"
                                onclick="doSearch()" class="btn btn-info">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<!-- 新增模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">新增用户信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form role="form" id="add-form">
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">姓名：</label>
                    <input id="add-uname" class="form-control" name="uname" style="width: 300px" type="text" /><br>
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">密码：</label>
                    <input id="add-pwd" class="form-control" name="pwd" style="width: 300px" type="password" /><br>
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">性别：</label>
                    <select id="add-sex" name="sex" class="form-control selectpicker show-tick" style="width: 300px">
                        <option value="">-- 请选择 --</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select><br><br>
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">出生日期：</label>
                    <input id="add-birthday" class="form-control" name="birthday" style="width: 300px" type="date" /><br>
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">身份证号：</label>
                    <input id="add-cardid" class="form-control" name="cardid" style="width: 300px" type="text" /><br>
                    <label class="col-md-2 control-label" style="text-align: right; width: 100px">住址：</label>
                    <input id="add-addr" class="form-control" name="addr" style="width: 300px" type="text" /><br>
                </form>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="doAdd()">提交</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

    <!-- 修改模态框 -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">修改用户信息</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form role="form" id="edit-form">
                        <input id="edit-uid" name="uid" type="hidden" />
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">姓名：</label>
                        <input id="edit-uname" class="form-control" name="uname" style="width: 300px" type="text" /><br>
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">密码：</label>
                        <input id="edit-pwd" class="form-control" name="pwd" style="width: 300px" type="password" /><br>
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">性别：</label>
                        <select id="edit-sex" name="sex" class="form-control selectpicker show-tick" style="width: 300px">
                            <option value="">-- 请选择 --</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select><br><br>
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">出生日期：</label>
                        <input id="edit-birthday" class="form-control" name="birthday" style="width: 300px" type="date" /><br>
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">身份证号：</label>
                        <input id="edit-cardid" class="form-control" name="cardid" style="width: 300px" type="text" /><br>
                        <label class="col-md-2 control-label" style="text-align: right; width: 100px">住址：</label>
                        <input id="edit-addr" class="form-control" name="addr" style="width: 300px" type="text" /><br>
                    </form>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="doEdit()">提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>

            </div>
        </div>
    </div>

    <!-- 删除模态框 -->
    <div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">删除用户信息</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form role="form" id="remove-form">
                        <label class="col-sm-2 control-label" style="text-align: center; width: 500px">
                            确定要删除选中的数据吗？</label>
                    </form>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="doRemove()">提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>

            </div>
        </div>
    </div>

</body>
<script type="text/javascript">
    $(document).ready(loadTable());

    //加载table数据
    function loadTable(){
        $("#grid").bootstrapTable({
            url:'/UserServlet?method=queryByList',
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            pagination: true,
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: function(params){
                console.log("offset="+params.offset+","+"limit="+params.limit);
                return{
                    rows:params.offset,      //从数据库第几条记录开始
                    page: params.limit,        //找多少条
                    uid: $('#search-uid').val(),
                    uname: $('#search-uname').val(),     //获取查询条件
                    sex: $('#search-sex').val()
                }
            },         //传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页
            fit: true,
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 4,                       //每页的记录行数（*）
            pageList: [2, 3, 4, 5],           //可供选择的每页的行数（*）
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 300,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "uid",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns:[[
                {
                    checkbox: true
                },
                {
                    field: 'uid',
                    title: '编号',
                    width: 200
                },
                {
                    field: 'uname',
                    title: '真实姓名',
                    width: 200
                },
                {
                    field: 'pwd',
                    title: '密码',
                    width: 200
                },
                {
                    field: 'sex',
                    title: '性别',
                    width: 200
                },
                {
                    field: 'birthday',
                    title: '出生日期',
                    width: 200
                },
                {
                    field: 'cardid',
                    title: '身份证号',
                    width: 200
                },
                {
                    field: 'addr',
                    title: '地址',
                    width: 200
                }
            ]]
        });
    }
</script>
<!--模糊搜索-->
<script type="text/javascript">
    //按钮事件
    function doSearch(){
        $("#grid").bootstrapTable('refresh',
            {url: '/UserServlet?method=queryByList'});
    }
</script>
<!--新增-->
<script type="text/javascript">
    function openAddModal() {
        //清空输入框
        $("#add-uname").val("");
        $('#add-pwd').val('').removeAttr('checked');
        $('#add-sex').val('').removeAttr('checked');
        $('#add-birthday').val('').removeAttr('checked');
        $('#add-cardid').val('').removeAttr('checked');
        $('#add-addr').val('').removeAttr('checked');
        $("#addModal").modal('show');
    }
    function doAdd() {
        $.ajax({
            //几个参数需要注意一下
            type: "post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/UserServlet?method=insert" ,//url
            data: $('#add-form').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                console.log($('#add-form').serialize());
                if (result==1) {
                    alert("添加成功！");
                } else {
                    alert("添加失败！");
                }
                $("#addModal").modal('hide');
                $('#grid').bootstrapTable('refresh',
                    {url: '${pageContext.request.contextPath}/UserServlet?method=queryByList'});
            },
            error : function() {
                $("#addModal").modal('hide');
            }
        });
    }
</script>
<!--修改-->
<script type="text/javascript">
    function openEditModal() {
        var row=$("#grid").bootstrapTable('getSelections');
        if(row.length != 1) {
            alert("只能选择1行数据进行修改");
        } else {
            $('#edit-uid').val(row[0].uid);
            $('#edit-uname').val(row[0].uname);
            $('#edit-pwd').val(row[0].pwd);
            $('#edit-sex').val(row[0].sex);
            $('#edit-birthday').val(row[0].birthday);
            $('#edit-cardid').val(row[0].cardid);
            $('#edit-addr').val(row[0].addr);
            $("#editModal").modal('show');
        }
    }

    function doEdit() {
        $.ajax({
            //几个参数需要注意一下
            type: "post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/UserServlet?method=update" ,//url
            data: $('#edit-form').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)

                if (result==1) {
                    alert("修改成功！");
                } else {
                    alert("修改失败！");
                }
                $("#editModal").modal('hide');
                $('#grid').bootstrapTable('refresh',
                    {url: '${pageContext.request.contextPath}/UserServlet?method=queryByList'});
            },
            error : function() {
                $("#editModal").modal('hide');
            }
        });
    }
</script>
<!--删除-->
<script type="text/javascript">
    function openRemoveModal() {
        $("#removeModal").modal('show');
    }

    function doRemove() {
        var row=$("#grid").bootstrapTable('getSelections');
        var uids = new Array();
        for(i=0; i<row.length; i++) {
            uids[i] = row[i].uid;
            console.log("doRemove row["+i+"].uid=" + row[i].uid);
        }
        $.ajax({
            //几个参数需要注意一下
            type: "post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/UserServlet?method=delete" ,//url
            data: "uids=" + uids,
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)

                if (result == 0) {
                    console.log("aaa");
                    alert("删除成功");
                } else {
                    alert("删除失败");
                }
                $("#removeModal").modal('hide');
                $('#grid').bootstrapTable('refresh',
                    {url: '${pageContext.request.contextPath}/UserServlet?method=queryByList'});
            },
            error : function() {
                $("#removeModal").modal('hide');
            }
        });
    }

</script>
</html>
