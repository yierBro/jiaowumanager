<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>课程管理</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        :root{
            --bg: #f6f7fb;
            --card: #ffffff;
            --text: #111827;
            --muted: #6b7280;
            --line: #e5e7eb;
            --primary: #2563eb;
            --danger: #ef4444;
            --shadow: 0 10px 25px rgba(17, 24, 39, .08);
            --radius: 12px;
        }

        /* Page base */
        body{
            margin: 0;
            background: var(--bg);
            color: var(--text);
            font: 14px/1.6 -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
        }

        /* Keep nav untouched; style the content area after nav */
        h3{
            max-width: 1100px;
            margin: 20px auto 12px;
            padding: 0 16px;
            font-size: 18px;
            font-weight: 700;
        }

        /* Primary button (your <a class="btn">) */
        a.btn{
            display: inline-block;
            max-width: 1100px;
            margin: 0 auto 12px;
            padding: 0 16px;
        }
        a.btn{
            margin-left: calc((100% - 1100px) / 2);
        }
        @media (max-width: 1132px){
            a.btn{ margin-left: 16px; }
        }

        a.btn{
            background: var(--primary);
            color: #fff;
            text-decoration: none;
            padding: 10px 14px;
            border-radius: 10px;
            box-shadow: 0 6px 14px rgba(37, 99, 235, .18);
            transition: transform .08s ease, box-shadow .15s ease, opacity .15s ease;
        }
        a.btn:hover{
            opacity: .95;
            box-shadow: 0 10px 18px rgba(37, 99, 235, .22);
        }
        a.btn:active{
            transform: translateY(1px);
        }

        /* Table container feel (without changing DOM, apply card-like style to table) */
        table{
            width: min(1100px, calc(100% - 32px));
            margin: 0 auto 24px;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        thead th{
            text-align: left;
            font-weight: 700;
            font-size: 13px;
            color: #0f172a;
            background: #f3f4f6;
            border-bottom: 1px solid var(--line);
            padding: 12px 14px;
            white-space: nowrap;
        }

        tbody td{
            padding: 12px 14px;
            border-bottom: 1px solid var(--line);
            vertical-align: middle;
            color: #111827;
        }

        /* Zebra stripes: improves readability using :nth-child(even) */
        tbody tr:nth-child(even){
            background-color: #fafafa;
        }
        tbody tr:hover{
            background: #eef2ff;
        }

        tbody tr:last-child td{
            border-bottom: none;
        }

        /* ID column tighter */
        tbody td:first-child{
            color: var(--muted);
            width: 80px;
        }

        /* Actions column */
        td.actions{
            white-space: nowrap;
        }
        td.actions a{
            display: inline-block;
            text-decoration: none;
            font-weight: 600;
            padding: 6px 10px;
            border-radius: 10px;
            border: 1px solid var(--line);
            background: #fff;
            color: #111827;
            margin-right: 8px;
            transition: background .15s ease, border-color .15s ease, transform .08s ease;
        }
        td.actions a:hover{
            background: #f9fafb;
            border-color: #d1d5db;
        }
        td.actions a:active{
            transform: translateY(1px);
        }

        /* Make the second action look like danger (delete) without changing the link text/JS */
        td.actions a:last-child{
            border-color: rgba(239, 68, 68, .35);
            color: var(--danger);
            background: rgba(239, 68, 68, .06);
        }
        td.actions a:last-child:hover{
            background: rgba(239, 68, 68, .10);
            border-color: rgba(239, 68, 68, .5);
        }

        /* Mobile: allow horizontal scroll if table is wide */
        @media (max-width: 768px){
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
<h3>课程列表</h3>
<a class="btn" href="<c:url value='/course/add'/>">新增课程</a>

<table>
    <thead>
    <tr>
        <th>ID</th><th>课程名</th><th>学分</th><th>授课教师</th><th>必修班级</th><th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="x">
        <tr>
            <td>${x.id}</td>
            <td>${x.name}</td>
            <td>${x.credit}</td>
            <td>${x.teacherName}（${x.teacherJobNo}）</td>
            <td>${x.classgroupName}（${x.classgroupCode}）</td>
            <td class="actions">
                <a href="<c:url value='/course/edit?id=${x.id}'/>">编辑</a>
                <a href="<c:url value='/course/delete?id=${x.id}'/>" onclick="return confirm('确认删除？');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
