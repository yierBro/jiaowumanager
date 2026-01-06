<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>专业管理</title>
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
            --danger: #dc2626;
            --danger-hover: #b91c1c;
            --shadow: 0 8px 24px rgba(17,24,39,.08);
            --radius: 12px;
        }

        /* Page base */
        body{
            margin: 0;
            background: var(--bg);
            color: var(--text);
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "PingFang SC",
            "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
            line-height: 1.5;
        }

        /* Keep nav include untouched; just add a comfortable content area */
        h3{
            max-width: 1100px;
            margin: 20px auto 12px;
            padding: 0 16px;
            font-size: 18px;
            font-weight: 650;
            letter-spacing: .2px;
        }

        /* Button */
        a.btn{
            display: inline-flex;
            align-items: center;
            gap: 8px;
            max-width: 1100px;
            margin: 0 auto 12px;
            margin-left: calc((100% - min(1100px, 100%)) / 2);
            background: var(--primary);
            color: #fff;
            text-decoration: none;
            padding: 10px 14px;
            border-radius: 10px;
            font-weight: 600;
            box-shadow: 0 6px 16px rgba(37, 99, 235, .18);
            transition: background .15s ease, transform .05s ease;
        }
        a.btn:hover{ background: var(--primary-hover); }
        a.btn:active{ transform: translateY(1px); }

        /* Table */
        table{
            width: min(1100px, calc(100% - 32px));
            margin: 0 auto 24px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        thead th{
            text-align: left;
            font-size: 13px;
            color: var(--muted);
            background: #f9fafb;
            padding: 12px 14px;
            border-bottom: 1px solid var(--border);
            white-space: nowrap;
        }

        tbody td{
            padding: 12px 14px;
            border-bottom: 1px solid var(--border);
            font-size: 14px;
            vertical-align: middle;
        }

        tbody tr:nth-child(even){
            background: #fcfcfd; /* zebra stripe for readability */
        }

        tbody tr:hover{
            background: #f3f6ff;
        }

        tbody tr:last-child td{
            border-bottom: none;
        }

        /* Actions column */
        td.actions{
            white-space: nowrap;
        }
        td.actions a{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 30px;
            padding: 0 10px;
            border-radius: 999px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid var(--border);
            color: var(--text);
            background: #fff;
            transition: background .15s ease, border-color .15s ease, color .15s ease;
            margin-right: 8px;
        }
        td.actions a:hover{
            background: #f9fafb;
            border-color: #d1d5db;
        }
        td.actions a:last-child{
            margin-right: 0;
            border-color: rgba(220, 38, 38, .25);
            color: var(--danger);
            background: rgba(220, 38, 38, .06);
        }
        td.actions a:last-child:hover{
            background: rgba(220, 38, 38, .10);
            border-color: rgba(220, 38, 38, .35);
            color: var(--danger-hover);
        }

        /* Small screens: allow horizontal scroll rather than breaking layout */
        @media (max-width: 720px){
            a.btn{
                margin-left: 16px;
                margin-right: 16px;
            }
            table{
                display: block;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            thead th, tbody td{
                padding: 10px 12px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>
<h3>专业列表</h3>
<a class="btn" href="<c:url value='/speciality/add'/>">新增专业</a>

<table>
    <thead>
    <tr>
        <th>ID</th><th>名称</th><th>代码</th><th>学院</th><th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="x">
        <tr>
            <td>${x.id}</td>
            <td>${x.name}</td>
            <td>${x.code}</td>
            <td>${x.collegeName}</td>
            <td class="actions">
                <a href="<c:url value='/speciality/edit?id=${x.id}'/>">编辑</a>
                <a href="<c:url value='/speciality/delete?id=${x.id}'/>" onclick="return confirm('确认删除？');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
