<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>课程表单</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        /* ====== Page Base ====== */
        :root{
            --bg: #f6f7fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: #e5e7eb;
            --focus: #2563eb;
            --shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
            --radius: 12px;
        }

        body{
            margin: 0;
            background: var(--bg);
            color: var(--text);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", sans-serif;
            line-height: 1.5;
        }

        /* 给页面一个内容区（不影响 nav include） */
        .page-wrap{
            max-width: 920px;
            margin: 28px auto;
            padding: 0 16px;
        }

        /* ====== Title ====== */
        h3{
            margin: 0 0 14px 0;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 0.2px;
        }

        /* ====== Form Card ====== */
        form{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 18px 18px 16px;
        }

        /* ====== Form Rows ====== */
        .form-row{
            margin: 0 0 14px 0;
        }

        /* label 更紧凑、颜色更柔和 */
        .form-row label{
            display: block;
            margin-bottom: 6px;
            font-size: 13px;
            font-weight: 600;
            color: var(--muted);
        }

        /* 兼容你原本的 <br/>：隐藏其带来的多余空隙但不改结构 */
        .form-row br{
            display: none;
        }

        /* 输入控件统一样式 */
        input,
        select{
            width: 100%;
            box-sizing: border-box;
            height: 40px;
            padding: 8px 10px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: #fff;
            color: var(--text);
            font-size: 14px;
            outline: none;
            transition: border-color .15s ease, box-shadow .15s ease;
        }

        input:focus,
        select:focus{
            border-color: var(--focus);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.15);
        }

        /* select 的默认外观保持浏览器一致，避免过度定制导致兼容问题 */
        select{
            appearance: auto;
        }

        /* ====== Button ====== */
        .btn{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            padding: 0 16px;
            border: 1px solid transparent;
            border-radius: 10px;
            background: var(--focus);
            color: #fff;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: transform .05s ease, filter .15s ease;
        }

        .btn:hover{
            filter: brightness(0.95);
        }

        .btn:active{
            transform: translateY(1px);
        }

        /* ====== Responsive Enhancements ====== */
        @media (min-width: 720px){
            form{
                padding: 22px 22px 18px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page-wrap">
    <c:choose>
        <c:when test="${empty course.id}">
            <h3>新增课程</h3>
            <c:url var="submitUrl" value="/course/add"/>
        </c:when>
        <c:otherwise>
            <h3>编辑课程</h3>
            <c:url var="submitUrl" value="/course/edit"/>
        </c:otherwise>
    </c:choose>

    <form method="post" action="${submitUrl}">
        <input type="hidden" name="id" value="${course.id}"/>

        <div class="form-row">
            <label>课程名：</label><br/>
            <input name="name" value="${course.name}" required/>
        </div>

        <div class="form-row">
            <label>学分：</label><br/>
            <input type="number" name="credit" value="${course.credit}" required min="0"/>
        </div>

        <div class="form-row">
            <label>授课教师（course_task_id）：</label><br/>
            <select name="courseTaskId" required>
                <option value="">请选择</option>
                <c:forEach items="${teachers}" var="t">
                    <option value="${t.id}" <c:if test="${course.courseTaskId == t.id}">selected</c:if>>
                            ${t.name}（${t.jobNo}）
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-row">
            <label>必修班级（course_assign_id）：</label><br/>
            <select name="courseAssignId" required>
                <option value="">请选择</option>
                <c:forEach items="${classgroups}" var="cg">
                    <option value="${cg.id}" <c:if test="${course.courseAssignId == cg.id}">selected</c:if>>
                            ${cg.name}（${cg.code}）
                    </option>
                </c:forEach>
            </select>
        </div>

        <button class="btn" type="submit">提交</button>
    </form>
</div>
</body>
</html>
