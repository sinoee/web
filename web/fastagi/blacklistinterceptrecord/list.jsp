<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>黑名单拦截记录</title>
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="demo.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript" src="jquery.easyui.min.js"></script>
	<script type="text/javascript" src="locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="base-loading.js"></script>
	<script type="text/javascript">
		//数据列表赋值
		
		$(function(){
			
			$("#blacklistInterceptRecordDg").datagrid({
				pageSize:15,
				pagination:true,      
				fit:true,
				singleSelect:true,
				rowrap:true,
				striped: true,
				rownumbers: true,
				pageList:[10,15,20],
				url:'blacklistInterceptRecord/datagrid'
			});

		});

		function findData() {
			$("#blacklistInterceptRecordDg").datagrid("load",{
				clientTelephone:$("#clientTelephone").numberbox('getValue'),
				clientName:$("#clientName").val(),
				startTime:$("#startTime").datebox("getValue"),
				endTime:$("#endTime").datebox("getValue")
			});
		}
					
	</script>	
</head>

<body>
	<!-- 页面加载效果 -->
	<%@ include file="/base_loading.jsp" %>
	<div class="easyui-panel" title="黑名单拦截记录查询" data-options="fit:true" style="padding:1px;">
		<div data-options="fit:true" class="easyui-layout">
			<!-- 查询区部分 -->
			<div data-options="region:'north',split:true,border:true" style="height:40px">
				<table>
								<tr>
									<td>客户号码</td>
									<td>
										<input id="clientTelephone" style="width:150px;" name="clientTelephone" class="easyui-numberbox"/>
										
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;
										客户姓名</td>
									<td>
										<input id="clientName" style="width:150px;" name="clientName" class="easyui-textbox"/>
									</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;
										拦截时间</td>
									<td>
										<input id="startTime" name="startTime" style="width:150px;" class="easyui-datebox" />
											至
										<input id="endTime" name="endTime" style="width:150px;" class="easyui-datebox" />
									</td>
									<td>&nbsp;&nbsp;&nbsp;<a href="javascript:findData()"  class="easyui-linkbutton" data-options="iconCls:'icon-search',width:135">查询</a></td>
								</tr>
							</table>
			</div>
			<!-- 编辑区下半部分列表 -->
			<div data-options="region:'center',split:true,border:false">
					<table id="blacklistInterceptRecordDg">
							<thead>  
								<tr style="height:12px;">                
									<th data-options="field:'CLIENT_TELEPHONE',width:200,align:'center'">客户号码</th>                
									<th data-options="field:'CLIENT_NAME',width:150,align:'center'">客户姓名</th>
									<th data-options="field:'CALLDATE',width:200,align:'center'">拦截时间</th>
									<th data-options="field:'REASON',width:400,align:'center'">拦截原因</th>                
								</tr>        
							</thead>
					</table>					

			</div>

		</div>
	</div>
</body>
</html>

