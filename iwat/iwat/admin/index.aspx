<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link href="../Content/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
    <script src="../Content/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="../Content/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>

    <script src="../JavaScript/InitEchart.js"></script>
    <script src="../JavaScript/InitTable.js"></script>
    <script>
        $(function () {
            InitEchart();

            $("#btnSub").click(function () {    
                let weight = $("#weight").val();
                //console.log(weight, typeof weight);
                let reg = /^[4-7][0-9]\.?[0-9]?$/;
                if (weight === '') {
                    alert("输些东西试试！");
                }
                else if (reg.test(weight)) {
                    if (confirm("确认提交？")) {
                        $.ajax({
                            type: 'GET',
                            url: "/ashx/Handler.ashx?data=" + weight,
                            success: function (res) {
                                if (res == "success") {
                                    //location.reload();
                                    //console.log(res);
                                    //添加成功后刷新图表
                                    InitEchart();
                                    $("#weight").val("");
                                }
                                else {
                                    alert("服务器错误，请稍后再试......");
                                }
                            }
                        });
                    }
                }
                else {
                    alert("你是这个体重吗");  
                 }
            });
        });
    </script>
</head>
<body style="background-image:url();background-size:cover">
    <noscript>
        <h1>请使用支持JavaScript的电脑打开本页面！</h1>
    </noscript>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px;width:1000px;margin:150px auto;"></div>
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-12">
                <table border="0" class="center-block">
                   <tr>
                       <td>
                           <input id="weight" type="text" name="name" value="" placeholder="单位：kg" class="form-control" />
                       </td>
                       <td style="margin-left:3px"><button id="btnSub" class="btn btn-primary">提交</button></td>
                   </tr>
               </table>
            </div>
        </div>
    </div>
    
    <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_departmentname">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_statu">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
        <table id="tb_departments"></table>
    </div>
</body>
</html>
