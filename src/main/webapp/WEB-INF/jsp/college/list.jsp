<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>学院管理</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        :root{
            --bg: #f6f8fb;
            --card: #ffffff;
            --text: #111827;
            --muted: #6b7280;
            --border: #e5e7eb;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --danger: #ef4444;
            --danger-hover: #dc2626;
            --shadow: 0 10px 25px rgba(17,24,39,.08);
            --radius: 14px;
        }

        * { box-sizing: border-box; }

        body{
            margin: 0;
            color: var(--text);
            background: var(--bg);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", sans-serif;
            line-height: 1.5;
        }

        /* 兼容已有 nav/head：不修改其结构，仅为页面主体留出舒适的内容区 */
        h3{
            margin: 18px auto 12px;
            max-width: 1100px;
            padding: 0 18px;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        /* 让“新增学院”看起来像主按钮，但不改动原 class="btn" */
        a.btn{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin: 0 auto 14px;
            max-width: 1100px;
            width: fit-content;
            margin-left: calc((100% - min(1100px, 100%)) / 2);
            padding: 10px 14px;
            border-radius: 10px;
            color: #fff;
            background: var(--primary);
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 6px 16px rgba(37,99,235,.22);
            transition: transform .12s ease, background-color .12s ease, box-shadow .12s ease;
        }
        a.btn:hover{
            background: var(--primary-hover);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37,99,235,.25);
        }
        a.btn:active{ transform: translateY(0); }

        /* 表格卡片容器：不新增 HTML 容器，直接让 table 自己像卡片 */
        table{
            width: min(1100px, calc(100% - 36px));
            margin: 0 auto 28px;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        thead th{
            text-align: left;
            font-size: 12px;
            letter-spacing: .3px;
            text-transform: uppercase;
            color: var(--muted);
            background: #f9fafb;
            border-bottom: 1px solid var(--border);
            padding: 12px 14px;
            white-space: nowrap;
        }

        tbody td{
            padding: 12px 14px;
            border-bottom: 1px solid var(--border);
            font-size: 14px;
            color: var(--text);
            vertical-align: middle;
        }

        tbody tr:last-child td{
            border-bottom: none;
        }

        tbody tr:hover td{
            background: #fbfdff;
        }

        /* 操作列更紧凑更易点 */
        td.actions{
            white-space: nowrap;
            text-align: right;
        }

        td.actions a{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 7px 10px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 13px;
            border: 1px solid transparent;
            transition: background-color .12s ease, border-color .12s ease, transform .12s ease;
            margin-left: 8px;
        }

        /* “编辑”按钮 */
        td.actions a:first-child{
            color: var(--primary);
            background: rgba(37,99,235,.10);
            border-color: rgba(37,99,235,.18);
        }
        td.actions a:first-child:hover{
            background: rgba(37,99,235,.14);
            border-color: rgba(37,99,235,.28);
            transform: translateY(-1px);
        }

        /* “删除”按钮：按 href 包含 /delete 做区分，不改动原链接功能 */
        td.actions a[href*="/delete"]{
            color: var(--danger);
            background: rgba(239,68,68,.10);
            border-color: rgba(239,68,68,.18);
        }
        td.actions a[href*="/delete"]:hover{
            background: rgba(239,68,68,.14);
            border-color: rgba(239,68,68,.28);
            transform: translateY(-1px);
        }

        /* 小屏适配：让表格能横向滚动，避免挤压变形 */
        @media (max-width: 820px){
            table{
                display: block;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            h3, a.btn{
                width: calc(100% - 36px);
                margin-left: 18px;
                margin-right: 18px;
                max-width: none;
            }
            td.actions{
                text-align: left;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>
<h3>学院列表</h3>
<a class="btn" href="<c:url value='/college/add'/>">新增学院</a>

<table>
    <thead>
    <tr>
        <th>ID</th><th>名称</th><th>代码</th><th>创建时间</th><th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="x">
        <tr>
            <td>${x.id}</td>
            <td>${x.name}</td>
            <td>${x.code}</td>
            <td>${x.createdAt}</td>
            <td class="actions">
                <a href="<c:url value='/college/edit?id=${x.id}'/>">编辑</a>
                <a href="<c:url value='/college/delete?id=${x.id}'/>" onclick="return confirm('确认删除？');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
