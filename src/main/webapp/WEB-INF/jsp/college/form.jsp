<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>学院表单</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        /* Page base */
        :root{
            --bg: #f6f7fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: #e5e7eb;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --shadow: 0 10px 30px rgba(17, 24, 39, 0.08);
            --radius: 12px;
        }

        body{
            margin: 0;
            color: var(--text);
            background: var(--bg);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", sans-serif;
            line-height: 1.5;
        }

        /* Keep nav include as-is; only provide a content container */
        .page-wrap{
            max-width: 860px;
            margin: 24px auto;
            padding: 0 16px 48px;
        }

        .card{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 20px;
        }

        .page-title{
            margin: 0 0 14px 0;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 0.2px;
        }

        .subtle{
            margin: 0 0 18px 0;
            color: var(--muted);
            font-size: 13px;
        }

        form{
            margin-top: 8px;
        }

        /* Form rows */
        .form-row{
            margin-bottom: 14px;
        }

        .form-row label{
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text);
        }

        /* Inputs */
        .form-row input{
            width: 100%;
            box-sizing: border-box; /* ensure padding/border included in width */
            padding: 10px 12px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: #fff;
            color: var(--text);
            font-size: 14px;
            outline: none;
            transition: border-color .15s ease, box-shadow .15s ease, transform .02s ease;
        }

        .form-row input::placeholder{
            color: #9ca3af;
        }

        .form-row input:focus{
            border-color: rgba(37, 99, 235, 0.55);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
        }

        /* Button */
        .btn{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: 0;
            border-radius: 10px;
            padding: 10px 16px;
            background: var(--primary);
            color: #fff;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color .15s ease, transform .05s ease, box-shadow .15s ease;
            box-shadow: 0 8px 18px rgba(37, 99, 235, 0.18);
        }

        .btn:hover{
            background: var(--primary-hover);
        }

        .btn:active{
            transform: translateY(1px);
        }

        /* Layout tweaks on wider screens */
        @media (min-width: 720px){
            .card{
                padding: 26px 28px;
            }
            .page-title{
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page-wrap">
    <div class="card">
        <c:choose>
            <c:when test="${empty college.id}">
                <h3 class="page-title">新增学院</h3>
                <p class="subtle">请填写学院基本信息后提交。</p>
                <c:url var="submitUrl" value="/college/add"/>
            </c:when>
            <c:otherwise>
                <h3 class="page-title">编辑学院</h3>
                <p class="subtle">可修改学院信息并保存。</p>
                <c:url var="submitUrl" value="/college/edit"/>
            </c:otherwise>
        </c:choose>

        <form method="post" action="${submitUrl}">
            <input type="hidden" name="id" value="${college.id}"/>

            <div class="form-row">
                <label>学院名称：</label>
                <input name="name" value="${college.name}" required/>
            </div>

            <div class="form-row">
                <label>学院代码：</label>
                <input name="code" value="${college.code}"/>
            </div>

            <button class="btn" type="submit">提交</button>
        </form>
    </div>
</div>

</body>
</html>
