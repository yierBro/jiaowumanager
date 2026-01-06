<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>学生表单</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        /* ====== Page base ====== */
        :root{
            --bg: #f6f7fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: #e5e7eb;
            --focus: #2563eb;
            --shadow: 0 10px 30px rgba(17, 24, 39, .08);
            --radius: 14px;
        }

        body{
            margin: 0;
            color: var(--text);
            background: radial-gradient(1200px 600px at 10% 0%, #eef2ff 0%, transparent 60%),
            radial-gradient(900px 500px at 100% 10%, #ecfeff 0%, transparent 55%),
            var(--bg);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "PingFang SC", "Microsoft YaHei", sans-serif;
            line-height: 1.5;
        }

        /* Keep nav include untouched; only add spacing for main content */
        .page-wrap{
            max-width: 820px;
            margin: 28px auto 56px;
            padding: 0 16px;
        }

        .page-title{
            margin: 0 0 14px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        .card{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 22px 22px 18px;
        }

        .hint{
            margin: 0 0 16px;
            color: var(--muted);
            font-size: 13px;
        }

        /* ====== Form ====== */
        form{
            margin: 0;
        }

        .form-row{
            margin: 0 0 14px;
        }

        .form-row label{
            display: block;
            margin: 0 0 6px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text);
        }

        .form-row input,
        .form-row select{
            width: 100%;
            box-sizing: border-box; /* common responsive form pattern */ /* [web:1] */
            height: 42px;
            padding: 10px 12px;
            border-radius: 10px;
            border: 1px solid var(--border);
            background: #fff;
            color: var(--text);
            outline: none;
            transition: border-color .15s ease, box-shadow .15s ease, transform .05s ease;
        }

        .form-row input::placeholder{
            color: #9ca3af;
        }

        .form-row input:focus,
        .form-row select:focus{
            border-color: rgba(37, 99, 235, .55);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, .14);
        }

        .form-row input:active,
        .form-row select:active{
            transform: translateY(0.5px);
        }

        /* Make select arrow look nicer (safe defaults) */
        .form-row select{
            appearance: none;
            background-image:
                    linear-gradient(45deg, transparent 50%, #6b7280 50%),
                    linear-gradient(135deg, #6b7280 50%, transparent 50%);
            background-position:
                    calc(100% - 18px) 18px,
                    calc(100% - 12px) 18px;
            background-size: 6px 6px, 6px 6px;
            background-repeat: no-repeat;
            padding-right: 36px;
        }

        /* ====== Actions ====== */
        .actions{
            display: flex;
            gap: 12px;
            margin-top: 18px;
        }

        .btn{
            border: 0;
            cursor: pointer;
            height: 42px;
            padding: 0 18px;
            border-radius: 10px;
            font-weight: 700;
            letter-spacing: .2px;
            color: #fff;
            background: linear-gradient(135deg, #2563eb 0%, #4f46e5 100%);
            box-shadow: 0 10px 18px rgba(37, 99, 235, .18);
            transition: transform .12s ease, box-shadow .12s ease, filter .12s ease;
        }

        .btn:hover{
            filter: brightness(1.02);
            box-shadow: 0 12px 22px rgba(37, 99, 235, .22);
            transform: translateY(-1px);
        }

        .btn:active{
            transform: translateY(0px);
            box-shadow: 0 8px 14px rgba(37, 99, 235, .18);
        }

        /* ====== Mobile ====== */
        @media (max-width: 520px){
            .card{ padding: 18px 16px 14px; }
            .actions{ flex-direction: column; }
            .btn{ width: 100%; }
        }
    </style>
</head>

<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page-wrap">
    <c:choose>
        <c:when test="${empty student.id}">
            <h3 class="page-title">新增学生</h3>
            <c:url var="submitUrl" value="/student/add"/>
        </c:when>
        <c:otherwise>
            <h3 class="page-title">编辑学生</h3>
            <c:url var="submitUrl" value="/student/edit"/>
        </c:otherwise>
    </c:choose>

    <div class="card">
        <p class="hint">请填写学生基本信息后提交。</p>

        <form method="post" action="${submitUrl}">
            <input type="hidden" name="id" value="${student.id}"/>

            <div class="form-row">
                <label>姓名：</label><br/>
                <input name="name" value="${student.name}" required/>
            </div>

            <div class="form-row">
                <label>学号：</label><br/>
                <input name="studentNo" value="${student.studentNo}"/>
            </div>

            <div class="form-row">
                <label>班级：</label><br/>
                <select name="classgroupId" required>
                    <option value="">请选择</option>
                    <c:forEach items="${classgroups}" var="cg">
                        <option value="${cg.id}" <c:if test="${student.classgroupId == cg.id}">selected</c:if>>
                                ${cg.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="actions">
                <button class="btn" type="submit">提交</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
