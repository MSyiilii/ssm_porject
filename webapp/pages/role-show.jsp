<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                角色管理
                <small>全部用户</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/role/findAll.do">角色管理</a></li>

                <li class="active">全部用户</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content"> <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">


                        <!--数据列表-->
                        <div class="tab-pane" id="tab-treetable">
                            <table id="collapse-table"
                                   class="table table-bordered table-hover dataTable">
                                <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>描述</th>
                                </tr>
                                </thead>
                                <tr data-tt-id="0">
                                    <td colspan="2">${role.roleName}</td>
                                </tr>

                                <tbody>
                                <c:forEach items="${role.permissions}" var="permission" varStatus="vs1">
                                    <tr data-tt-id="${vs1.index+1}" data-tt-parent-id="0">
                                        <td>${permission.permissionName }</td>
                                        <td>${permission.url }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                <!-- /.box-body -->


            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- 底部导航 /-->

</div>

<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/raphael/raphael-min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/morris/morris.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/knob/jquery.knob.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/daterangepicker.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/fastclick/fastclick.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/iCheck/icheck.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/adminLTE/js/app.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/treeTable/jquery.treetable.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/select2/select2.full.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/chartjs/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $(document).ready(function () {
        /*table tree*/
        $("#collapse-table").treetable({
            expandable: true
        });
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });

    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>