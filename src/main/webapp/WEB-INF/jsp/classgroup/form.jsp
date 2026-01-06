<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>班级表单</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        /* ====== Page base ====== */
        :root{
            --bg: #f6f8fb;
            --card: #ffffff;
            --text: #111827;
            --muted: #6b7280;
            --border: #e5e7eb;
            --focus: #2563eb;
            --shadow: 0 10px 30px rgba(17, 24, 39, .08);
            --radius: 12px;
        }

        body{
            margin: 0;
            color: var(--text);
            background: linear-gradient(180deg, #f8fafc 0%, var(--bg) 100%);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", sans-serif;
        }

        /* ====== Title (h3) ====== */
        h3{
            max-width: 860px;
            margin: 22px auto 12px;
            padding: 0 16px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        /* ====== Form card ====== */
        form{
            max-width: 860px;
            margin: 0 auto 28px;
            padding: 18px 16px 22px;
        }

        form::before{
            content: "";
            display: block;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 18px 18px 20px;
        }

        /* put all form children visually inside the card created by ::before */
        form > *{
            position: relative;
            z-index: 1;
        }

        /* create spacing inside the card */
        form::before{
            position: absolute;
            left: 16px;
            right: 16px;
            top: 0;
            bottom: 0;
            z-index: 0;
        }
        form{
            position: relative;
        }

        /* ====== Rows ====== */
        .form-row{
            margin: 14px 0;
        }

        .form-row label{
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: var(--muted);
            font-weight: 600;
        }

        /* remove the visual need for <br/> by making label block; keep br harmless */
        .form-row br{
            display: none;
        }

        /* ====== Controls ====== */
        input, select{
            width: 100%;
            box-sizing: border-box; /* typical responsive form base */
            padding: 10px 12px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: #fff;
            color: var(--text);
            font-size: 14px;
            outline: none;
            transition: border-color .15s ease, box-shadow .15s ease, transform .05s ease;
        }

        input:focus, select:focus{
            border-color: var(--focus);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, .15);
        }

        /* ====== Submit button (keeps original class .btn) ====== */
        .btn{
            margin-top: 10px;
            width: 100%;
            border: 0;
            border-radius: 12px;
            padding: 11px 14px;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: #fff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 10px 18px rgba(37, 99, 235, .18);
            transition: transform .06s ease, filter .15s ease, box-shadow .15s ease;
        }

        .btn:hover{
            filter: brightness(1.02);
            box-shadow: 0 14px 22px rgba(37, 99, 235, .22);
        }

        .btn:active{
            transform: translateY(1px);
        }

        /* ====== Desktop layout enhancement ====== */
        @media (min-width: 720px){
            form{
                padding: 22px 16px 32px;
            }
            .form-row{
                display: grid;
                grid-template-columns: 140px 1fr;
                column-gap: 16px;
                align-items: center;
                margin: 12px 0;
            }
            .form-row label{
                margin: 0;
                text-align: right;
            }
            .btn{
                width: auto;
                min-width: 160px;
                float: right;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<c:choose>
    <c:when test="${empty classgroup.id}">
        <h3>新增班级</h3>
        <c:url var="submitUrl" value="/classgroup/add"/>
    </c:when>
    <c:otherwise>
        <h3>编辑班级</h3>
        <c:url var="submitUrl" value="/classgroup/edit"/>
    </c:otherwise>
</c:choose>

<form method="post" action="${submitUrl}">
    <input type="hidden" name="id" value="${classgroup.id}"/>

    <div class="form-row">
        <label>班级名称：</label><br/>
        <input name="name" value="${classgroup.name}" required/>
    </div>

    <div class="form-row">
        <label>班级代码：</label><br/>
        <input name="code" value="${classgroup.code}"/>
    </div>

    <div class="form-row">
        <label>所属专业：</label><br/>
        <select name="specialityId" required>
            <option value="">请选择</option>
            <c:forEach items="${specialities}" var="s">
                <option value="${s.id}" <c:if test="${classgroup.specialityId == s.id}">selected</c:if>>
                        ${s.name}
                </option>
            </c:forEach>
        </select>
    </div>

    <button class="btn" type="submit">提交</button>
</form>
</body>
</html>
