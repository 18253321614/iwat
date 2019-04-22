<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎查看</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .middle {
            position:relative;
            top:50%;
            transform:translateY(300%);
        }
    </style>
    

</head>
<body style="background-image:url(/img/login.jpg);background-size:100%">
        <div class="container">
            <div class="row middle">
                <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-12">
                    <form id="form1" runat="server">
                        <table border="0" style="">
                            <tr>
                                <th>
                                    <asp:TextBox ID="tbPasswd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入密码" style="width:300px;height:45px;margin-top:5px;" ></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Label runat="server" ID="lblTip" ForeColor="Red" Visible="False"></asp:Label>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Button ID="btnCheck" runat="server" Text="确认身份" CssClass="btn btn-primary btn-lg btn-block" style="width:300px;height:50px;margin-top:10px;" OnClick="btnCheck_Click" />
                                </th>
                            </tr>     
                       </table>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>
