<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
<head>
    <title>教师表单</title>
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
            --focus-ring: rgba(37,99,235,.18);
        }

        *{ box-sizing: border-box; }
        html, body{ height: 100%; }
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

        /* 导航兼容：不依赖 nav.jsp 具体结构 */
        body > nav,
        body > .nav,
        body > .navbar{
            position: sticky;
            top: 0;
            z-index: 50;
            backdrop-filter: blur(8px);
        }

        /* 标题卡片 */
        h3{
            width: min(900px, calc(100% - 24px));
            margin: 24px auto 14px;
            padding: 18px 20px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            font-size: 18px;
        }

        /* 表单卡片 */
        form{
            width: min(900px, calc(100% - 24px));
            margin: 0 auto 26px;
            padding: 18px 20px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }

        .form-row{
            margin: 12px 0;
        }

        .form-row label{
            display: inline-block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 6px;
        }

        /* 输入控件：统一风格（宽度/边框/圆角/内边距为常见做法） */
        input, select, button{
            font: inherit;
        }

        .form-row input,
        .form-row select{
            width: 100%;
            padding: 10px 12px;
            border-radius: 12px;
            border: 1px solid rgba(31,41,55,.18);
            background: #fff;
            outline: none; /* 结合 :focus-visible 做可访问的可视焦点 */
            transition: border-color .15s ease, box-shadow .15s ease;
        } /* [web:42] */

        .form-row input:focus,
        .form-row select:focus{
            border-color: rgba(37,99,235,.55);
            box-shadow: 0 0 0 4px var(--focus-ring);
        } /* [web:46] */

        .form-row input:focus-visible,
        .form-row select:focus-visible,
        button:focus-visible{
            outline: 2px solid rgba(37,99,235,.65);
            outline-offset: 2px;
        }

        /* 提交按钮：保持你原 class=btn，不改功能 */
        button.btn{
            margin-top: 10px;
            padding: 10px 16px;
            border: 1px solid rgba(0,0,0,.06);
            border-radius: 12px;
            background: var(--primary);
            color: #fff;
            font-weight: 700;
            cursor: pointer;
            transition: background-color .15s ease, transform .05s ease, box-shadow .15s ease;
            box-shadow: 0 8px 18px rgba(37,99,235,.20);
        }
        button.btn:hover{ background: var(--primary-hover); }
        button.btn:active{ transform: translateY(1px); }

        /* 小屏优化 */
        @media (max-width: 640px){
            h3, form{
                margin-top: 16px;
                padding: 14px 14px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<c:choose>
    <c:when test="${empty teacher.id}">
        <h3>新增教师</h3>
        <c:url var="submitUrl" value="/teacher/add"/>
    </c:when>
    <c:otherwise>
        <h3>编辑教师</h3>
        <c:url var="submitUrl" value="/teacher/edit"/>
    </c:otherwise>
</c:choose>

<form method="post" action="${submitUrl}">
    <input type="hidden" name="id" value="${teacher.id}"/>

    <div class="form-row">
        <label>姓名：</label><br/>
        <input name="name" value="${teacher.name}" required/>
    </div>

    <div class="form-row">
        <label>工号：</label><br/>
        <input name="jobNo" value="${teacher.jobNo}"/>
    </div>

    <div class="form-row">
        <label>学院：</label><br/>
        <select name="collegeId" required>
            <option value="">请选择</option>
            <c:forEach items="${colleges}" var="c">
                <option value="${c.id}" <c:if test="${teacher.collegeId == c.id}">selected</c:if>>
                        ${c.name}
                </option>
            </c:forEach>
        </select>
    </div>

    <button class="btn" type="submit">提交</button>
</form>
</body>
</html>
