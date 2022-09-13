<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
let result = confirm("로그아웃 하시겠습니까?");
if(result){		
	alert("Logout Success!")
	location.href="/";
}
</script>
</head>
<body>

</body>

</html>