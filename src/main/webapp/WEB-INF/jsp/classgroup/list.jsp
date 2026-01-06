<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>班级管理</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        :root{
            --bg: #f6f8fb;
            --card: #ffffff;
            --text: #1f2a37;
            --muted: #6b7280;
            --border: #e5e7eb;
            --border-strong: #d1d5db;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --danger: #ef4444;
            --danger-hover: #dc2626;
            --shadow: 0 6px 18px rgba(17, 24, 39, 0.08);
            --radius: 12px;
        }

        /* Page */
        body{
            margin: 0;
            color: var(--text);
            background: var(--bg);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", "PingFang SC", "Hiragino Sans GB",
            "Microsoft YaHei", sans-serif;
        }

        .page{
            max-width: 1100px;
            margin: 20px auto;
            padding: 0 16px 28px;
        }

        .page-header{
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            margin: 10px 0 14px;
        }

        .page-title{
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: 0.2px;
        }

        /* Button (keep existing class "btn") */
        a.btn{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 10px 14px;
            border-radius: 10px;
            text-decoration: none;
            background: var(--primary);
            color: #fff;
            font-weight: 600;
            border: 1px solid rgba(255,255,255,0.15);
            box-shadow: 0 8px 16px rgba(37, 99, 235, 0.18);
            transition: transform .05s ease, background .15s ease, box-shadow .15s ease;
            white-space: nowrap;
        }
        a.btn:hover{
            background: var(--primary-hover);
            box-shadow: 0 10px 18px rgba(29, 78, 216, 0.22);
        }
        a.btn:active{
            transform: translateY(1px);
        }

        /* Card */
        .card{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }
        .card-body{
            padding: 14px;
        }

        /* Table */
        .table-wrap{
            overflow-x: auto; /* mobile: allow horizontal scroll instead of squeezing */
            -webkit-overflow-scrolling: touch;
        }

        table{
            width: 100%;
            border-collapse: collapse;
            min-width: 760px; /* keep columns readable; scroll on small screens */
            background: transparent;
        }

        thead th{
            text-align: left;
            font-size: 12px;
            color: var(--muted);
            font-weight: 700;
            letter-spacing: 0.6px;
            padding: 12px 12px;
            border-bottom: 1px solid var(--border-strong);
            background: linear-gradient(#ffffff, #fbfdff);
            position: sticky;
            top: 0;
            z-index: 1;
        }

        tbody td{
            padding: 12px 12px;
            border-bottom: 1px solid var(--border);
            font-size: 14px;
            vertical-align: middle;
        }

        tbody tr:hover{
            background: #f9fafb;
        }

        /* Actions */
        td.actions{
            white-space: nowrap;
        }

        td.actions a{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 7px 10px;
            margin-right: 8px;
            border-radius: 10px;
            text-decoration: none;
            border: 1px solid var(--border);
            color: var(--text);
            background: #fff;
            transition: background .15s ease, border-color .15s ease, transform .05s ease;
            font-weight: 600;
            font-size: 13px;
        }

        td.actions a:hover{
            background: #f3f4f6;
            border-color: var(--border-strong);
        }

        td.actions a:active{
            transform: translateY(1px);
        }

        /* Make the "delete" link look dangerous without changing its URL/functionality */
        td.actions a:last-child{
            border-color: rgba(239, 68, 68, 0.35);
            color: var(--danger);
            background: rgba(239, 68, 68, 0.06);
        }

        td.actions a:last-child:hover{
            background: rgba(239, 68, 68, 0.10);
            border-color: rgba(239, 68, 68, 0.55);
            color: var(--danger-hover);
        }

        /* Small screens */
        @media (max-width: 768px){
            .page-header{
                flex-direction: column;
                align-items: stretch;
            }
            a.btn{
                width: 100%;
            }
            .card-body{
                padding: 10px;
            }
        }
    </style>
</head>

<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page">
    <div class="page-header">
        <h3 class="page-title">班级列表</h3>
        <a class="btn" href="<c:url value='/classgroup/add'/>">新增班级</a>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th><th>名称</th><th>代码</th><th>专业</th><th>学院</th><th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr>
                            <td>${x.id}</td>
                            <td>${x.name}</td>
                            <td>${x.code}</td>
                            <td>${x.specialityName}</td>
                            <td>${x.collegeName}</td>
                            <td class="actions">
                                <a href="<c:url value='/classgroup/edit?id=${x.id}'/>">编辑</a>
                                <a href="<c:url value='/classgroup/delete?id=${x.id}'/>" onclick="return confirm('确认删除？');">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
