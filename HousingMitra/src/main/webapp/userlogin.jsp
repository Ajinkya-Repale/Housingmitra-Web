<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>
  body {
    font-family: Arial, sans-serif;
    background: url('image1/buliding3.jpg') no-repeat center center/cover;
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
  }

  /* Overlay to reduce opacity of background */
  body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4); /* Adjust opacity */
    z-index: 0;
  }

  .form-container {
    position: relative;
    z-index: 1;
    background: rgba(255, 255, 255, 0.95);
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    width: 350px;
    text-align: center;
  }

  h2 {
    margin-top: 0;
    margin-bottom: 20px;
    color: #333;
  }
  
  p
  {
    color:red;
    text-align:center;
  }

  label {
    display: block;
    font-weight: 600;
    margin-bottom: 6px;
    text-align: left;
    color: #555;
  }

  input[type="text"],
  input[type="email"],
  input[type="password"],
  input[type="tel"],
  input[type="number"] {
    width: 100%;
    padding: 10px 12px;
    margin-bottom: 15px;
    border: 1.5px solid #ccc;
    border-radius: 6px;
    font-size: 1rem;
    box-sizing: border-box;
  }

  input:focus {
    border-color: #007BFF;
    outline: none;
    box-shadow: 0 0 4px rgba(0,123,255,0.4);
  }

  button {
    width: 100%;
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 12px;
    font-size: 1rem;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #0056b3;
  }

  /* Responsive */
  @media (max-width: 400px) {
    .form-container {
      width: 90%;
      padding: 20px;
    }
  }
</style>

</head>
<body>

<%
String msg=(String)session.getAttribute("msg");
if(msg == null)
{
	msg="";
}

session.removeAttribute("msg");
%>


<div class="form-container">
  <form action="user-login" method="post">
    <h2>User Login</h2>
    
    <p><%=msg%></p>

    <label for="userName">User Name:</label>
    <input type="text" name="userName" id="userName" required>

    <label for="userpass">User Password:</label>
    <input type="password" name="userpass" id="userpass" required>

    <button type="submit">Login</button>
  </form>
</div>

</body>
</html>
