<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
  body {
    font-family: Arial, sans-serif;
    background-image: url('image1/buliding3.jpg'); /* Update path if needed */
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    height: 100vh;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .container {
    display: flex;
    gap: 80px; /* space between image and form */
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
  }

  .box {
    width: 350px;
    height: 450px; /* fixed height for both */
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    overflow: hidden;
  }

  .image-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    border-radius: 12px;
  }

  form {
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.95);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 30px;
    box-sizing: border-box;
  }

  form h2 {
    margin-top: 0;
    margin-bottom: 20px;
    text-align: center;
  }

  form div {
    margin-bottom: 15px;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  label {
    font-weight: 600;
    margin-bottom: 6px;
    text-align: center;
  }

  input[type="text"],
  input[type="email"],
  input[type="password"] {
    width: 90%;
    padding: 8px 12px;
    border: 1.5px solid #ccc;
    border-radius: 6px;
    font-size: 1rem;
    text-align: center;
  }

  input:focus {
    border-color: #007BFF;
    outline: none;
  }

  button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 90%;
  }

  button:hover {
    background-color: #0056b3;
  }

  /* Responsive layout */
  @media (max-width: 800px) {
    .container {
      flex-direction: column;
      gap: 40px;
    }

    .box {
      width: 90%;
      max-width: 350px;
      height: auto;
    }
    
    .p
    {
     text-color: red;
     text-align: center;
    }

    .image-box img {
      height: auto;
    }

    form {
      height: auto;
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


<div class="container">

  <!-- Image Box -->
  <div class="box image-box">
    <img src="image1/building1.jpg" alt="Building">
  </div>

  <!-- Form Box -->
  <div class="box">
    <form action="admin-login" method="post">
      <h2>Admin Login</h2>
      <p class="p"><%=msg %></p>

      <div>
        <label for="aname"> Admin Name:</label>
        <input type="text" name="name" id="aname" required>
      </div>
      
      <div>
        <label for="apass"> Admin Password:</label>
        <input type="password" name="pass" id="apass" required>
      </div>

      <div>
        <button type="submit">Login</button>
      </div>
    </form>
  </div>

</div>

</body>
</html>
