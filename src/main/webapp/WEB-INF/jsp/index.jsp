<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
<head>
    <title>教务管理系统</title>
    <jsp:include page="common/head.jsp"/>

    <style>
        :root{
            --bg: #f6f8fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #6b7280;
            --border: rgba(31,41,55,.10);
            --shadow: 0 10px 30px rgba(16,24,40,.08);
            --radius: 14px;
        }

        /* 基础重置与排版 */
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

        /* 让页面在有 nav 的情况下更舒服：不假设 nav 的具体结构，仅做通用兼容 */
        body > nav,
        body > .nav,
        body > .navbar {
            position: sticky;
            top: 0;
            z-index: 50;
            backdrop-filter: blur(8px);
        }

        /* 主内容容器（不改你的DOM：通过选择 body 内的 h2/p 来“包裹感”呈现） */
        h2{
            max-width: 960px;
            margin: 28px auto 10px;
            padding: 18px 22px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            font-size: 22px;
            letter-spacing: .2px;
        }

        p{
            max-width: 960px;
            margin: 0 auto 24px;
            padding: 0 22px 18px;
            color: var(--muted);
        }

        /* 如果 nav.jsp 内部使用了常见 ul/li/a 导航结构，给它更现代的观感（不依赖具体类名） */
        nav ul{
            list-style: none;
            margin: 0;
            padding: 10px 16px;
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
            background: rgba(255,255,255,.75);
            border-bottom: 1px solid var(--border);
        }
        nav a{
            display: inline-block;
            padding: 8px 12px;
            border-radius: 10px;
            text-decoration: none;
            color: var(--text);
            transition: background-color .15s ease, transform .05s ease;
        }
        nav a:hover{
            background: rgba(31,41,55,.06);
        }
        nav a:active{
            transform: translateY(1px);
        }

        /* 小屏优化 */
        @media (max-width: 640px){
            h2{
                margin: 16px 12px 8px;
                padding: 14px 14px;
                font-size: 18px;
            }
            p{
                margin: 0 12px 18px;
                padding: 0 14px 14px;
            }
            nav ul{
                padding: 10px 12px;
                gap: 6px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="common/nav.jsp"/>
<h2>教务管理系统</h2>
<p>请选择上方菜单进入各模块管理。</p>
</body>
</html>
