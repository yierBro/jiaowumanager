<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>学生管理</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        :root{
            --bg:#f6f8fb;
            --card:#ffffff;
            --text:#1f2937;
            --muted:#6b7280;
            --primary:#2563eb;
            --danger:#dc2626;
            --border:#e5e7eb;
            --shadow: 0 10px 25px rgba(17,24,39,.08);
            --radius: 12px;
        }

        * { box-sizing: border-box; }
        body{
            margin:0;
            background: var(--bg);
            color: var(--text);
            font: 14px/1.6 -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,
            "PingFang SC","Hiragino Sans GB","Microsoft YaHei",Arial,sans-serif;
        }

        /* 主体容器（不影响 nav.jsp） */
        .page{
            max-width: 1180px;
            margin: 22px auto;
            padding: 0 16px;
        }

        .card{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 18px 18px 14px;
        }

        .page-title{
            margin: 0 0 12px;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        .toolbar{
            display:flex;
            align-items:center;
            justify-content: space-between;
            gap: 12px;
            margin-bottom: 12px;
        }

        /* 你的 a.btn 保留类名，仅美化 */
        a.btn{
            display:inline-flex;
            align-items:center;
            gap:8px;
            padding: 9px 12px;
            background: var(--primary);
            color:#fff;
            text-decoration:none;
            border-radius: 10px;
            border: 1px solid rgba(0,0,0,.06);
            box-shadow: 0 6px 14px rgba(37,99,235,.18);
            transition: transform .08s ease, filter .15s ease;
            white-space: nowrap;
        }
        a.btn:hover{ filter: brightness(0.98); }
        a.btn:active{ transform: translateY(1px); }

        .hint{
            color: var(--muted);
            font-size: 12px;
        }

        /* 表格外层：小屏可横向滚动，避免挤爆布局 [web:10] */
        .table-wrap{
            width:100%;
            overflow-x:auto;
            border-radius: 10px;
            border: 1px solid var(--border);
        }

        table{
            width: 100%;
            border-collapse: collapse;
            min-width: 860px; /* 列较多时，保证可读性；小屏通过外层滚动展示 */
            background: #fff;
        }

        thead th{
            text-align:left;
            padding: 12px 12px;
            font-size: 12px;
            letter-spacing: .6px;
            color: #374151;
            background: #f3f4f6;
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0; /* 如果页面滚动，表头更易读 */
            z-index: 1;
        }

        tbody td{
            padding: 12px 12px;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
            color: #111827;
        }

        /* 斑马纹与悬停提升可读性（常见表格样式写法）[web:1] */
        tbody tr:nth-child(even){ background: #fafafa; }
        tbody tr:hover{ background: #f0f7ff; }

        td.actions{
            white-space: nowrap;
        }

        td.actions a{
            display:inline-flex;
            align-items:center;
            padding: 6px 10px;
            border-radius: 8px;
            text-decoration:none;
            border: 1px solid var(--border);
            background: #fff;
            color: #111827;
            margin-right: 8px;
            transition: background .15s ease, border-color .15s ease;
        }
        td.actions a:hover{
            background: #f9fafb;
            border-color: #d1d5db;
        }

        /* 让“删除”更醒目但不改功能 */
        td.actions a:last-child{
            color: var(--danger);
            border-color: rgba(220,38,38,.25);
            background: rgba(220,38,38,.04);
        }
        td.actions a:last-child:hover{
            background: rgba(220,38,38,.07);
            border-color: rgba(220,38,38,.35);
        }

        /* 小屏微调 */
        @media (max-width: 640px){
            .toolbar{
                flex-direction: column;
                align-items: flex-start;
            }
            .page-title{ font-size: 16px; }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page">
    <div class="card">
        <h3 class="page-title">学生列表</h3>

        <div class="toolbar">
            <a class="btn" href="<c:url value='/student/add'/>">新增学生</a>
            <div class="hint">提示：可左右滑动查看完整表格</div>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>ID</th><th>姓名</th><th>学号</th><th>班级</th><th>专业</th><th>学院</th><th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="x">
                    <tr>
                        <td>${x.id}</td>
                        <td>${x.name}</td>
                        <td>${x.studentNo}</td>
                        <td>${x.classgroupName}</td>
                        <td>${x.specialityName}</td>
                        <td>${x.collegeName}</td>
                        <td class="actions">
                            <a href="<c:url value='/student/edit?id=${x.id}'/>">编辑</a>
                            <a href="<c:url value='/student/delete?id=${x.id}'/>"
                               onclick="return confirm('确认删除？');">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
