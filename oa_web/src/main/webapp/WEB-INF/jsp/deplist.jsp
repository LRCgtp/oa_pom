<%--
  Created by IntelliJ IDEA.
  User: ken
  Date: 2018/11/1
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
    <script type="text/javascript" src="resources/scripts/jquery-1.8.3.min.js"></script>
    <!-- jQuery Configuration -->
    <script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>

    <!-- 时间日期插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/widget/My97DatePicker/WdatePicker.js"></script>

    <!-- dialog弹出框的导入 -->
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css"/>
    <script type="text/javascript" src="resources/widget/dialog/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="resources/js/plugin.js"></script>

    <style>
        .time-input {
            padding: 6px;
            font-size: 13px;
            border: 1px solid #d5d5d5;
            color: #333;
        }
    </style>

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
                        <th>编号</th>
                        <th>部门名称</th>
                        <th>父部门</th>
                        <th>部门描述</th>
                        <th>成立时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${deps}" var="dep">
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td>${dep.id}</td>
                                <td>${dep.dname}</td>
                                <td>${dep.pname}</td>
                                <td>${dep.dinfo}</td>
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
                                <a class="mybutton" href="javascript:openDialog('div_dialog', '部门添加');">添加部门</a>
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

<!-- 弹出框 -->
<div id="div_dialog" style="display: none;">
    <form action="#" method="post">
        <fieldset>
            <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            <p>
                <label>部门名称</label>
                <input class="text-input input" type="text" id="dname_id"
                    name="dname" />
            </p>
            <p>
                <label>父部门</label>
                <button class="mybutton">无</button>
            </p>
            <p>
                <label>成立时间</label>
                <input
                    class="Wdate time-input " type="text" id="createtime_id" name="createtime" onclick="WdatePicker()"/>
            </p>

            <p>
                <label>部门描述</label>
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
</div>

</body>
</html>
