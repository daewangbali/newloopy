  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
if(confirm("장바구니에 담겼습니다! 지금 바로 장바구니로 이동하시겠습니까? ")) {
	location.href="/cart/list";
}else {
	history.go(-1);
}
</script>
</head>
<body>

</body>
</html>