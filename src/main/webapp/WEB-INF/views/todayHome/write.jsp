<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>오늘의집 - 가구 등록</title>
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
        .category-group {
            margin-bottom: 20px;
        }
        .category-group label {
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
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

<h1 class="title">오늘의집 - 가구 등록</h1>

<form action="${pageContext.request.contextPath}/todayHome/write" method="post">

    <label for="name">가구 이름</label>
    <input type="text" id="name" name="name" required placeholder="가구 이름을 입력하세요" />

    <label for="price">가격 (원)</label>
    <input type="number" id="price" name="price" required min="0" placeholder="가격을 입력하세요" />

    <div class="category-group">
        <label>카테고리 (하나 선택)</label>
        <div class="category-list">
            <label><input type="radio" name="category" value="0" required /> 침대</label>
            <label><input type="radio" name="category" value="1" /> 매트리스 토퍼</label>
            <label><input type="radio" name="category" value="2" /> 테이블/식탁/책상</label>
            <label><input type="radio" name="category" value="3" /> 소파</label>
            <label><input type="radio" name="category" value="4" /> 서랍/수납장</label>
            <label><input type="radio" name="category" value="5" /> 행거/옷장</label>
            <label><input type="radio" name="category" value="6" /> 거울</label>
            <label><input type="radio" name="category" value="7" /> 화장대/콘솔</label>
            <label><input type="radio" name="category" value="8" /> 유아동기구</label>
            <label><input type="radio" name="category" value="9" /> 야외기구</label>
            <label><input type="radio" name="category" value="10" /> 가벽/파티션</label>
        </div>
    </div>

    <label for="width">가로 (mm)</label>
    <input type="number" id="width" name="width" required min="0" placeholder="가로 길이(mm)" />

    <label for="depth">세로 (mm)</label>
    <input type="number" id="depth" name="depth" required min="0" placeholder="세로 길이(mm)" />

    <label for="height">높이 (mm)</label>
    <input type="number" id="height" name="height" required min="0" placeholder="높이(mm)" />

    <div class="button-group">
        <button type="submit">등록</button>
        <button type="button" class="cancel-btn" onclick="window.location.href='list'">취소</button>
    </div>

</form>

</body>
</html>
