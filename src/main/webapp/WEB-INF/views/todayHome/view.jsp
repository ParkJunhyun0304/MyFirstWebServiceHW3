<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>오늘의집 - 가구 상세보기</title>
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
            margin-bottom: 30px;
        }
        .detail-container {
            max-width: 600px;
            margin: 0 auto;
            background: #e6f2ff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 12px 10px;
            font-size: 1.1em;
            border-bottom: 1px solid #a3c2ff;
            color: #004a99;
        }
        th {
            width: 30%;
            font-weight: bold;
            background-color: #cce6ff;
        }
        td {
            background-color: #f7fbff;
        }
        .btn-back {
            display: block;
            margin: 25px auto 0 auto;
            padding: 12px 30px;
            background-color: #3399ff;
            color: white;
            font-weight: bold;
            font-size: 1em;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            width: 120px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #287acc;
        }
    </style>
</head>
<body>

<h1 class="title">오늘의집 - 가구 상세보기</h1>

<div class="detail-container">
    <table>
        <tr>
            <th>가구 이름</th>
            <td><c:out value="${furniture.name}" /></td>
        </tr>
        <tr>
            <th>가격</th>
            <td><c:out value="${furniture.price}" /> 원</td>
        </tr>
        <tr>
            <th>카테고리</th>
            <td>
                <c:choose>
                    <c:when test="${furniture.category == 0}">침대</c:when>
                    <c:when test="${furniture.category == 1}">매트리스 토퍼</c:when>
                    <c:when test="${furniture.category == 2}">테이블/식탁/책상</c:when>
                    <c:when test="${furniture.category == 3}">소파</c:when>
                    <c:when test="${furniture.category == 4}">서랍/수납장</c:when>
                    <c:when test="${furniture.category == 5}">행거/옷장</c:when>
                    <c:when test="${furniture.category == 6}">거울</c:when>
                    <c:when test="${furniture.category == 7}">화장대/콘솔</c:when>
                    <c:when test="${furniture.category == 8}">유아동기구</c:when>
                    <c:when test="${furniture.category == 9}">야외기구</c:when>
                    <c:when test="${furniture.category == 10}">가벽/파티션</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>크기 (W x D x H) (mm)</th>
            <td>
                <c:out value="${furniture.width}" /> x
                <c:out value="${furniture.depth}" /> x
                <c:out value="${furniture.height}" />
            </td>
        </tr>
    </table>

    <a href="<c:url value='/todayHome/list' />" class="btn-back">목록으로 돌아가기</a>
</div>

</body>
</html>
