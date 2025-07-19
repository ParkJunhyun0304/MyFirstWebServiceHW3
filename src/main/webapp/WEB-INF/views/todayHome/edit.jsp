<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>오늘의집 - 가구 수정</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 20px;
        }
        h1.title {
            text-align: center;
            color: #3399ff;
            font-weight: bold;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background: #e6f2ff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #0066cc;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #99ccff;
            border-radius: 6px;
            font-size: 1em;
            box-sizing: border-box;
        }
        .category-list {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        .category-list label {
            background: white;
            padding: 8px 14px;
            border-radius: 6px;
            border: 1px solid #99ccff;
            cursor: pointer;
            user-select: none;
            font-weight: 500;
            color: #004a99;
        }
        .category-list input[type="radio"] {
            margin-right: 6px;
            vertical-align: middle;
            cursor: pointer;
        }
        .button-group {
            text-align: right;
        }
        button {
            background-color: #3399ff;
            border: none;
            color: white;
            font-weight: bold;
            font-size: 1em;
            padding: 12px 28px;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 10px;
        }
        button:hover {
            background-color: #287acc;
        }
        button.cancel-btn {
            background-color: #ccc;
            color: #444;
        }
        button.cancel-btn:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>

<h1 class="title">오늘의집 - 가구 수정</h1>

<form action="edit" method="post">
    <input type="hidden" name="id" value="${furniture.id}" />

    <label for="price">가격 (원)</label>
    <input type="number" id="price" name="price" required min="0" value="${furniture.price}" />

    <label>카테고리 (하나 선택)</label>
    <div class="category-list">
        <c:forEach begin="0" end="10" var="i">
            <label>
                <input type="radio" name="category" value="${i}"
                       <c:if test="${furniture.category == i}">checked</c:if> />
                <c:choose>
                    <c:when test="${i == 0}">침대</c:when>
                    <c:when test="${i == 1}">매트리스 토퍼</c:when>
                    <c:when test="${i == 2}">테이블/식탁/책상</c:when>
                    <c:when test="${i == 3}">소파</c:when>
                    <c:when test="${i == 4}">서랍/수납장</c:when>
                    <c:when test="${i == 5}">행거/옷장</c:when>
                    <c:when test="${i == 6}">거울</c:when>
                    <c:when test="${i == 7}">화장대/콘솔</c:when>
                    <c:when test="${i == 8}">유아동기구</c:when>
                    <c:when test="${i == 9}">야외기구</c:when>
                    <c:when test="${i == 10}">가벽/파티션</c:when>
                </c:choose>
            </label>
        </c:forEach>
    </div>

    <label for="width">가로 (mm)</label>
    <input type="number" id="width" name="width" required min="0" value="${furniture.width}" />

    <label for="depth">세로 (mm)</label>
    <input type="number" id="depth" name="depth" required min="0" value="${furniture.depth}" />

    <label for="height">높이 (mm)</label>
    <input type="number" id="height" name="height" required min="0" value="${furniture.height}" />

    <div class="button-group">
        <button type="submit">수정</button>
        <button type="button" class="cancel-btn" onclick="location.href='list'">취소</button>
    </div>
</form>

</body>
</html>
