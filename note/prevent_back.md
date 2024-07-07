```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Input Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 입력 페이지로 다시 돌아왔는지 확인
            if (sessionStorage.getItem('visited')) {
                // 리디렉션할 URL 설정 (예: 홈 페이지)
                window.location.href = 'https://www.example.com/home';
            } else {
                // 세션 스토리지에 방문 기록 저장
                sessionStorage.setItem('visited', 'true');
            }
        });
    </script>
</head>
<body>
    <h1>Input Page</h1>
    <form id="inputForm">
        <!-- 입력 폼 내용 -->
        <input type="text" name="exampleInput" />
        <button type="submit">Submit</button>
    </form>
</body>
</html>
```