<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPEhtml>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        img, label {
            display: inline-block;
        }

        label {
            width: 130px
        }

        button {
            background-color: #82c1f5;
            color: white;
            font-size: 15px
        }
    </style>
</head>
<body>
<div style='width:100%;text-align:center;padding-top:100px'>
    <img width="481" alt="logo" src="https://github.com/SionLee21/project5/assets/121320706/bf601ede-5fca-40b3-8427-cac5b610e82f">
    <form method="post" action="loginOk">
        <div><label>User ID: </label>
            <input type='text' name='userid'/></div>
        <div><label>Password: </label>
            <input type='password' name='password'/></div>
        <button type='submit'>login</button>
    </form>
</div>
</body>
</html>