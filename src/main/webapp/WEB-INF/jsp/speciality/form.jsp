<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>专业表单</title>
    <jsp:include page="../common/head.jsp"/>

    <style>
        /* ---- Page layout ---- */
        :root{
            --bg: #f6f7fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: #e5e7eb;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --focus-ring: rgba(37, 99, 235, .18);
        }

        body{
            margin: 0;
            background: var(--bg);
            color: var(--text);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue",
            Arial, "Noto Sans", "Liberation Sans", sans-serif;
            line-height: 1.5;
        }

        /* Keep nav unchanged; only style our content area */
        .page-wrap{
            max-width: 880px;
            margin: 28px auto;
            padding: 0 16px;
        }

        .form-card{
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 14px;
            box-shadow: 0 8px 22px rgba(17, 24, 39, .06);
            overflow: hidden;
        }

        .form-card__header{
            padding: 18px 20px;
            border-bottom: 1px solid var(--border);
            background: linear-gradient(180deg, #ffffff 0%, #fbfbff 100%);
        }

        .form-card__title{
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: .2px;
        }

        .form-card__body{
            padding: 20px;
        }

        /* ---- Form rows ---- */
        .form-row{
            display: flex;
            gap: 14px;
            align-items: flex-start;
            padding: 12px 0;
        }

        .form-row + .form-row{
            border-top: 1px dashed #eef0f5;
        }

        .form-row label{
            flex: 0 0 120px;
            padding-top: 9px;
            color: var(--muted);
            font-size: 14px;
            font-weight: 600;
        }

        .form-row br{
            display: none; /* preserve HTML but hide the line break */
        }

        .form-row input,
        .form-row select{
            width: 100%;
            height: 40px;
            padding: 8px 10px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: #fff;
            color: var(--text);
            outline: none;
            transition: border-color .15s ease, box-shadow .15s ease;
        }

        .form-row input:focus,
        .form-row select:focus{
            border-color: var(--primary);
            box-shadow: 0 0 0 4px var(--focus-ring);
        }

        .form-row select{
            cursor: pointer;
        }

        /* ---- Actions ---- */
        .form-actions{
            display: flex;
            justify-content: flex-end;
            padding-top: 16px;
        }

        .btn{
            appearance: none;
            border: 1px solid transparent;
            background: var(--primary);
            color: #fff;
            padding: 10px 16px;
            border-radius: 10px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color .15s ease, transform .06s ease;
        }

        .btn:hover{
            background: var(--primary-hover);
        }

        .btn:active{
            transform: translateY(1px);
        }

        /* ---- Responsive ---- */
        @media (max-width: 640px){
            .form-row{
                flex-direction: column;
                gap: 6px;
            }
            .form-row label{
                flex: 0 0 auto;
                padding-top: 0;
            }
            .form-actions{
                justify-content: stretch;
            }
            .btn{
                width: 100%;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../common/nav.jsp"/>

<div class="page-wrap">
    <div class="form-card">
        <div class="form-card__header">
            <c:choose>
                <c:when test="${empty speciality.id}">
                    <h3 class="form-card__title">新增专业</h3>
                    <c:url var="submitUrl" value="/speciality/add"/>
                </c:when>
                <c:otherwise>
                    <h3 class="form-card__title">编辑专业</h3>
                    <c:url var="submitUrl" value="/speciality/edit"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-card__body">
            <form method="post" action="${submitUrl}">
                <input type="hidden" name="id" value="${speciality.id}"/>

                <div class="form-row">
                    <label>专业名称：</label><br/>
                    <input name="name" value="${speciality.name}" required/>
                </div>

                <div class="form-row">
                    <label>专业代码：</label><br/>
                    <input name="code" value="${speciality.code}"/>
                </div>

                <div class="form-row">
                    <label>学院：</label><br/>
                    <select name="collegeId" required>
                        <option value="">请选择</option>
                        <c:forEach items="${colleges}" var="c">
                            <option value="${c.id}" <c:if test="${speciality.collegeId == c.id}">selected</c:if>>
                                    ${c.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-actions">
                    <button class="btn" type="submit">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
