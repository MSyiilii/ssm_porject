<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>数据 - AdminLTE2</title>
<meta name="description" content="AdminLTE2">
<meta name="keywords" content="AdminLTE2">

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

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
				用户管理 <small>添加角色表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
				<li class="active">添加角色表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form
				action="${pageContext.request.contextPath}/user/addRoleToUser.do"
				method="post">
				<!-- 正文区域 -->
				<section class="content"> 
				
				<input type="hidden" name="userId" value="${user.id}">
				
					<table id="dataList"
							class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th class="" style="padding-right: 0px">
									<input id="selall" 
										type="checkbox" class="icheckbox_square-blue"></th>
									<th class="sorting_asc">ID</th>
									<th class="sorting">角色名称</th>
									<th class="sorting">角色描述</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${roleList}" var="role">
									<tr>
										<td>
										
										<input name="ids" type="checkbox" value="${role.id}">
										
										</td>
										<td>${role.id}</td>
										<td>${role.roleName }</td>
										<td>${role.roleDesc}</td>
										
									</tr>
								</c:forEach>
							</tbody>

						</table>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- 底部导航 /-->

	</div>


	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/raphael/raphael-min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/morris/morris.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/knob/jquery.knob.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/fastclick/fastclick.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/iCheck/icheck.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/select2/select2.full.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/chartjs/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="https://cdn.jsdelivr.net/gh/MSyiilii/ssm_adminlte@1.0/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
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
	</script>


</body>

</html>