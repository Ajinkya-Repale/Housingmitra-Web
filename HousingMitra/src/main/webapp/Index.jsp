<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  * {
    margin: 0;
    padding: 0;   
     box-sizing: border-box; 
  }

  body {
    font-family: Arial, sans-serif;
    background-image: url('image1/buliding3.jpg'); /* Make sure the path is correct */
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    height: 100vh; 
    padding: 20px;
    display:flex;
    justify-content:center;
    align-items: center;
    
  }
  
  img {
  width: 200px;
  height: 200px;
  object-fit: cover; /* Ensures the image fills the area without distortion */
  margin: 10px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  margin-bottom: 10px;
   
}

 .container {
    display: flex;
    gap: 40px; /* space between images */
  }
  
   .card {
    text-align: center;
  }
  
    button {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #0055aa;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #003f88;
  }

</style>
</head>
<body>


 <div class="container">
    <div class="card">
      <img alt="Admin" src="image1/person1.jpg">
      <form action="aregister" method="post">
        <button type="submit">Admin</button>
      </form>
    </div>

    <div class="card">
      <img alt="User" src="image1/person2.jpg">
      <form action="uregister" method="post">
        <button type="submit">User</button>
      </form>
    </div>
  </div>


  

</body>
</html>