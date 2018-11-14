<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2 0002
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
    <!-- Reset Stylesheet -->
    <link rel="stylesheet" href="resources/css/reset.css" type="text/css"
          media="screen" />
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="resources/css/style.css" type="text/css"
          media="screen" />
    <link rel="stylesheet" href="resources/css/invalid.css" type="text/css"
          media="screen" />

    <!--                       Javascripts                       -->
    <!-- jQuery -->
    <script type="text/javascript"
            src="resources/scripts/jquery-1.8.3.min.js"></script>
    <!-- jQuery Configuration -->
    <script type="text/javascript"
            src="resources/scripts/simpla.jquery.configuration.js"></script>

    <!-- 时间日期插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/widget/My97DatePicker/WdatePicker.js"></script>

    <!-- dialog弹出框的导入 -->
    <%--下载的样式不能用才（改样式是网上在线样式）--%>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css"/>
    <script type="text/javascript" src="resources/widget/dialog/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="resources/js/plugin.js"></script>
    <script type="text/javascript" src="resources/js/firstdialog.js"></script>

    <%--导入zTree样式--%>
    <link rel="stylesheet" href="resources/widget/zTree/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="resources/widget/zTree/jquery.ztree.all.min.js"></script>

    <script type="text/javascript" >
        function treeOpen(div_id,title) {
             $.get("employeeController/listajax",function (data) {
                // alert(data)
                     var setting={
                         data: {
                             key: {
                                 name: "dname"
                             },

                             simpleData: {
                                 enable: true,
                                 pIdKey: "did",
                             }
                         },
                         view: {
                             showIcon: false
                         },


                     };
                     var zTreeNodes=data;
                    var ztreeObject=$.fn.zTree.init($("#div_ztree"), setting, zTreeNodes);
                     openDailog('ztree_dialog','父类名称');
                 ztreeObject.expandAll(true);

             },"json");
        }
    </script>
</head>
<body>
<div id="main-content">
    <div class="content-box">
        <!-- End .content-box-header -->
        <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
                <table>
                    <thead>
                    <tr>
                        <th><input class="check-all" type="checkbox" /></th>
                        <th>员工编号</th>
                        <th>邮箱</th>
                        <th>员工名称</th>
                        <th>员工性别</th>
                        <th>员工生日</th>
                        <th>员工图片</th>
                        <th>父部门名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${list}" var="emp">
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>${emp.id}</td>
                            <td>${emp.email}</td>
                            <td>${emp.name}</td>
                            <td>${emp.sex ==0 ? '女':'男'}</td>
                            <td><fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd:hh:ss:mm"></fmt:formatDate></td>
                            <td>${emp.image}</td>
                            <td>${emp.pname}</td>
                            <td><fmt:formatDate value="${dep.createtime}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <!-- Icons --> <a href="#" title="Edit"><img
                                    src="resources/images/icons/pencil.png" alt="Edit" /></a> <a
                                    href="#" title="Delete"><img
                                    src="resources/images/icons/cross.png" alt="Delete" /></a> <a
                                    href="#" title="Edit Meta"><img
                                    src="resources/images/icons/hammer_screwdriver.png"
                                    alt="Edit Meta" /></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                    <tfoot>
                    <tr>
                        <td colspan="6">
                            <div class="bulk-actions align-left">
                                <a class="mybutton" href="javascript:openDailog('div_dialog', '部门添加');">添加部门</a>
                            </div>

                            <!-- 分页导航 -->
                            <%@ include file="page.jsp"%>
                            <div class="clear"></div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <!-- End .content-box-content -->
    </div>
</div>
<!-- End #main-content -->
<%--弹出框--%>
<div id="div_dialog" style="display: none">
    <form action="#" method="post">
        <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
                <label>员工编号</label>
                <input type="text" id="1" name="id" />
            </p>

            <p>
                <label>邮箱</label>
                <input type="text" id="2" name="id" />
            </p>
            <p>
                <label>员工名称</label>
                <input type="text" id="3" name="id" />
            </p>
            <p>
                <label>员工性别</label>
                <input type="radio" name="sex" value="男"/>男
                <input type="radio"  name="sex" value="女"/>女
            </p>
            <p>
                <label>父部门</label>
                <button type="button" class="mybutton" onclick="treeOpen()" id="bt_id">无</button>
            </p>
            <p>
                <label>员工生日</label>
                <input
                        class="Wdate time-input " type="text" id="createtime_id"
                        name="createtime" onclick="WdatePicker()"/>
            </p>

            <p>
                <input class="mybutton" type="submit" value="提交" />
            </p>
        </fieldset>
        <div class="clear"></div>
        <!-- End .clear -->
    </form>
</div>
<%--弹出树形框--%>
<div id="ztree_dialog" style="display: none">
<div id="div_ztree" class="ztree">

</div>
</div>
<%--<!-- 弹出框 -->
<div id="div_dialog" style="display: none;">
    <form action="#" method="post">
        <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
                <label>员工编号</label>
                <input class="text-input input" type="text" id="dname_id"
                       name="dname" />
            </p>
            <p>
                <label>邮箱</label>
                <button class="mybutton">无</button>
            </p>
            <p>
                <label>员工名称</label>
                <input
                        class="Wdate time-input " type="text" id="createtime_id"
                        name="createtime" onclick="WdatePicker()"/>
            </p>

            <p>
                <label>员工性别</label>
                <textarea class="text-input textarea wysiwyg" id="dinfo_id"
                          name="dinfo" cols="79" rows="15"></textarea>
            </p>

            <p>
                <label>员工生日</label>
                <textarea class="text-input textarea wysiwyg" id="dinfo_id"
                          name="dinfo" cols="79" rows="15"></textarea>
            </p>

            <p>
                <label>员工图片</label>
                <textarea class="text-input textarea wysiwyg" id="dinfo_id"
                          name="dinfo" cols="79" rows="15"></textarea>
            </p>

            <p>
                <label>父部门名称</label>
                <textarea class="text-input textarea wysiwyg" id="dinfo_id"
                          name="dinfo" cols="79" rows="15"></textarea>
            </p>

            <p>
                <input class="mybutton" type="submit" value="提交" />
            </p>
        </fieldset>
        <div class="clear"></div>
        <!-- End .clear -->
    </form>
</div>--%>

</body>
</html>
