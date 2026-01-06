<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
<head>
    <title>教师管理</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        :root{
            --bg: #f6f8fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: rgba(31,41,55,.10);
            --shadow: 0 10px 30px rgba(16,24,40,.08);
            --radius: 14px;

            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --danger: #dc2626;
            --danger-hover: #b91c1c;

            --row-hover: rgba(37,99,235,.06);
            --zebra: rgba(31,41,55,.03);
        }

        * { box-sizing: border-box; }
        html, body { height: 100%; }
        body{
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "PingFang SC",
            "Hiragino Sans GB", "Microsoft YaHei", Arial, sans-serif;
            color: var(--text);
            background: radial-gradient(1200px 600px at 20% 0%, #eef3ff 0%, transparent 60%),
            radial-gradient(900px 500px at 90% 10%, #e9fbf2 0%, transparent 55%),
            var(--bg);
            line-height: 1.6;
        }

        /* 导航兼容：不依赖 nav.jsp 的具体类名 */
        body > nav,
        body > .nav,
        body > .navbar{
            position: sticky;
            top: 0;
            z-index: 50;
            backdrop-filter: blur(8px);
        }

        /* 标题与按钮：基于你的现有 h3 与 a.btn，不改DOM */
        h3{
            max-width: 1100px;
            margin: 24px auto 12px;
            padding: 18px 20px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            font-size: 18px;
        }

        a.btn{
            display: inline-block;
            max-width: 1100px;
            margin: 0 auto 14px;
            margin-left: calc((100% - min(1100px, 100% - 24px)) / 2);
            padding: 10px 14px;
            border-radius: 12px;
            background: var(--primary);
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            border: 1px solid rgba(0,0,0,.06);
            transition: background-color .15s ease, transform .05s ease, box-shadow .15s ease;
            box-shadow: 0 8px 18px rgba(37,99,235,.20);
        }
        a.btn:hover{ background: var(--primary-hover); }
        a.btn:active{ transform: translateY(1px); }

        /* 表格：卡片化 + 斑马纹 + hover */
        table{
            width: min(1100px, calc(100% - 24px));
            margin: 0 auto 26px;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        thead th{
            text-align: left;
            font-size: 13px;
            letter-spacing: .2px;
            color: #374151;
            background: rgba(31,41,55,.03);
            border-bottom: 1px solid var(--border);
            padding: 12px 12px;
            white-space: nowrap;
        }

        tbody td{
            padding: 12px 12px;
            border-bottom: 1px solid rgba(31,41,55,.06);
            vertical-align: middle;
        }

        /* 斑马纹：nth-child(even) 是经典写法 */
        tbody tr:nth-child(even){
            background: var(--zebra);
        } /* [web:21][web:22] */

        /* Hover 高亮：tr:hover */
        tbody tr:hover{
            background: var(--row-hover);
        } /* [web:22][web:23] */

        tbody tr:last-child td{
            border-bottom: none;
        }

        /* 操作列链接：保持“编辑/删除”是普通 a，不改功能 */
        td.actions{
            white-space: nowrap;
        }
        td.actions a{
            display: inline-block;
            padding: 6px 10px;
            border-radius: 10px;
            text-decoration: none;
            color: var(--primary);
            background: rgba(37,99,235,.08);
            border: 1px solid rgba(37,99,235,.15);
            margin-right: 8px;
            transition: background-color .15s ease, color .15s ease, border-color .15s ease;
        }
        td.actions a:hover{
            background: rgba(37,99,235,.14);
            border-color: rgba(37,99,235,.25);
        }

        /* 仅通过选择器区分“删除”链接（不加class也能生效） */
        td.actions a[onclick]{
            color: var(--danger);
            background: rgba(220,38,38,.08);
            border-color: rgba(220,38,38,.18);
        }
        td.actions a[onclick]:hover{
            background: rgba(220,38,38,.14);
            border-color: rgba(220,38,38,.28);
            color: var(--danger-hover);
        }

        /* 小屏：允许横向滚动，避免表格挤爆（常用做法：外层 overflow-x:auto）
           这里不改DOM，只对 table 自身做显示与滚动兼容 */
        @media (max-width: 720px){
            a.btn{
                margin-left: 12px;
            }
            table{
                display: block;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            thead th, tbody td{
                padding: 10px 10px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>
<h3>教师列表</h3>
<a class="btn" href="<c:url value='/teacher/add'/>">新增教师</a>

<table>
    <thead>
    <tr>
        <th>ID</th><th>姓名</th><th>工号</th><th>学院</th><th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="x">
        <tr>
            <td>${x.id}</td>
            <td>${x.name}</td>
            <td>${x.jobNo}</td>
            <td>${x.collegeName}</td>
            <td class="actions">
                <a href="<c:url value='/teacher/edit?id=${x.id}'/>">编辑</a>
                <a href="<c:url value='/teacher/delete?id=${x.id}'/>" onclick="return confirm('确认删除？');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
