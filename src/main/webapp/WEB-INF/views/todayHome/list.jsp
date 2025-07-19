<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>오늘의집 - 가구 리스트</title>
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
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        .button-container {
            text-align: right;
            margin-bottom: 15px;
        }
        .button-container button {
            background-color: #3399ff;
            border: none;
            color: white;
            font-weight: bold;
            font-size: 1em;
            padding: 10px 25px;
            margin-left: 10px;
            cursor: pointer;
            border-radius: 5px;
            width: 120px;
        }
        .button-container button:hover {
            background-color: #287acc;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #e6f2ff; /* 연하늘색 */
        }
        thead tr {
            background-color: #cce6ff;
            border-bottom: 3px solid #3399ff;
        }
        tbody tr {
            border-bottom: 1px solid #a3c2ff;
        }
        th, td {
            text-align: center;
            padding: 12px 10px;
            font-size: 1em;
        }
        th {
            font-weight: bold;
            color: #0066cc;
        }
        tbody tr:hover {
            background-color: #d0e7ff;
        }
        input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        a {
            color: #0066cc;
            text-decoration: none;
            font-weight: 600;
        }
        a:hover {
            text-decoration: underline;
        }
        th button {
            background: none;       /* 배경 제거 */
            border: none;           /* 테두리 제거 */
            color: white;           /* 화살표 색깔 흰색 */
            cursor: pointer;
            font-weight: bold;
            font-size: 1em;
            padding: 0 5px;
        }
    </style>
    <script>
        window.onload = function() {
            const checkAll = document.getElementById('checkAll');
            const checkboxes = document.querySelectorAll('.chk');

            checkAll.addEventListener('click', function(){
                checkboxes.forEach(chk => chk.checked = this.checked);
            });
        };

        // 삭제 버튼 클릭 시 선택된 id들로 폼 제출
        function submitDelete() {
            const form = document.getElementById('deleteForm');
            if ([...document.querySelectorAll('.chk')].some(chk => chk.checked)) {
                form.submit();
            } else {
                alert('삭제할 가구를 선택해주세요.');
            }
        }

        // 수정 버튼 클릭 시 선택된 id가 하나일 때 edit 페이지로 이동
        function submitEdit() {
            const checkedItems = [...document.querySelectorAll('.chk:checked')];
            if (checkedItems.length === 1) {
                const id = checkedItems[0].value;
                window.location.href = 'edit?id=' + id;
            } else if (checkedItems.length === 0) {
                alert('수정할 가구를 하나 선택해주세요.');
            } else {
                alert('수정은 한 가구만 선택할 수 있습니다.');
            }
        }

        // 추가 버튼 클릭 시 추가 페이지로 이동
        function goToAdd() {
            window.location.href = 'write';
        }
        function sortTable(columnIndex) {
            const table = document.querySelector('table tbody');
            const rows = Array.from(table.querySelectorAll('tr'));
            let ascending = table.getAttribute('data-sort-dir') !== 'asc';

            rows.sort((a, b) => {
                let cellA = a.children[columnIndex].textContent.trim();
                let cellB = b.children[columnIndex].textContent.trim();

                // 카테고리 정렬인 경우, 텍스트 비교
                if(columnIndex === 3) {
                    return ascending ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
                }

                // 가격 정렬인 경우 숫자 비교
                if(columnIndex === 2) {
                    cellA = parseInt(cellA.replace(/,/g, '')) || 0;
                    cellB = parseInt(cellB.replace(/,/g, '')) || 0;
                    return ascending ? cellA - cellB : cellB - cellA;
                }
            });

            // 정렬된 행 다시 붙이기
            rows.forEach(row => table.appendChild(row));
            table.setAttribute('data-sort-dir', ascending ? 'asc' : 'desc');
        }
    </script>
</head>
<body>

<h1 class="title">오늘의집</h1>

<div class="button-container">
    <button type="button" onclick="goToAdd()">추가</button>
    <button type="button" onclick="submitEdit()">수정</button>
    <button type="button" onclick="submitDelete()">삭제</button>
</div>

<form action="<c:url value='/todayHome/delete' />" method="get" id="deleteForm">
    <table>
        <thead>
        <tr>
            <th><input type="checkbox" id="checkAll" /></th>
            <th>가구 이름</th>
            <th>
                가격
                <button type="button" onclick="sortTable(2)">▲▼</button>
            </th>
            <th>
                카테고리
                <button type="button" onclick="sortTable(3)">▲▼</button>
            </th>
            <th>크기 (W x D x H) (mm)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr>
                <td><input type="checkbox" name="id" value="${item.id}" class="chk" /></td>
                <td>
                    <a href="<c:url value='/todayHome/view?id=${item.id}' />">
                        <c:out value="${item.name}" />
                    </a>
                </td>
                <td><c:out value="${item.price}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${item.category == 0}">침대</c:when>
                        <c:when test="${item.category == 1}">매트리스 토퍼</c:when>
                        <c:when test="${item.category == 2}">테이블/식탁/책상</c:when>
                        <c:when test="${item.category == 3}">소파</c:when>
                        <c:when test="${item.category == 4}">서랍/수납장</c:when>
                        <c:when test="${item.category == 5}">행거/옷장</c:when>
                        <c:when test="${item.category == 6}">거울</c:when>
                        <c:when test="${item.category == 7}">화장대/콘솔</c:when>
                        <c:when test="${item.category == 8}">유아동기구</c:when>
                        <c:when test="${item.category == 9}">야외기구</c:when>
                        <c:when test="${item.category == 10}">가벽/파티션</c:when>
                        <c:otherwise>기타</c:otherwise>
                    </c:choose>
                </td>
                <td><c:out value="${item.width}" /> x <c:out value="${item.depth}" /> x <c:out value="${item.height}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

</body>
</html>
