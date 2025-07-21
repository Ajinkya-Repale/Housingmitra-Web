<%@page import="com.MainApp.Service.NoticeService"%>
<%@page import="java.util.List"%>

<%@page import="com.MainApp.Entity.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    
    /*Nav bar and body*/
	body
	{
	   background-image: url('image1/background.png');
	   background-repeat: no-repeat;
	   background-size: cover;
	   opacity: 1.0;
	   margin: 0;
	}
	
	 .sidebar {
      height: 100vh;
      width: 200px;
      background-color: #2c3e50;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
      position: fixed;
    }

    .logo {
      width: 100px;
      height: 100px;
      margin-bottom: 30px;
      background-color: #ecf0f1;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }
    
     .logo img {
      width: 100%;
      height: auto;
    }

    .nav-button, .logout-button {
      width: 100%;
      padding: 15px 0;
      text-align: center;
      color: #ecf0f1;
      text-decoration: none;
      transition: background 0.3s;
    }

    .nav-button:hover {
      background-color: #34495e;
      cursor: pointer;
    }
    
    .logout-button {
      color: #e74c3c;
      background-color: #2c3e50;
      border-top: 1px solid #34495e;
    }

    .logout-button:hover {
      background-color: #c0392b;
      color: white;
    }
    
	.logo-title {
	  color: #ecf0f1;
	  font-size: 18px;
	  margin-top: 10px;
	  margin-bottom: 30px;
	  font-weight: bold;
	}
	
	
	
	/* Add Complaints */

	
	.form-container {
  position: absolute;
  top: 50px;
  left: 50%;
  transform: translateX(-50%);
  padding: 30px;
  width: 400px;
  background: transparent; /* ✅ Transparent like the table */
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  display: none;
  z-index: 10;
}

.form-container h3 {
  text-align: center;
  margin-bottom: 20px;
  color: #000; /* Black heading like table */
}

.form-container label {
  display: block;
  margin-bottom: 8px;
  font-weight: bold;
  color: #000; /* Black text */
}

.form-container input[type="text"],
.form-container input[type="date"],
.form-container input[type="number"],
.form-container textarea {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 6px;
  border: 1px solid rgba(0, 0, 0, 0.2);
  font-size: 15px;
  background: rgba(255, 255, 255, 0.3); /* ✅ Light transparent fields */
  color: #000; /* Black text */
}

.form-container textarea {
  resize: vertical;
}

.form-container button[type="submit"] {
  width: 100%;
  padding: 12px;
  background-color: rgba(44, 62, 80, 0.8); /* semi-transparent button */
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.form-container button[type="submit"]:hover {
  background-color: rgba(44, 62, 80, 1);
}

/* Close Button (same as View Notice) */
.form-container .close-button {
  position: absolute;
  top: 10px;
  right: 15px;
  background: none;
  border: none;
  font-size: 20px;
  font-weight: bold;
  color: #000;
  cursor: pointer;
  transition: color 0.2s ease;
}

.form-container .close-button:hover {
  color: #e74c3c;
}




 /*View Notice */
 
 
 
 #VNotice {
  position: absolute;
  top: 50px;
  left: 50%;
  transform: translateX(-50%);
  width: 80%;
  max-width: 800px;
  background: transparent; /* fully transparent */
  border-radius: 10px;
  padding: 20px;
  display: none;
  z-index: 10;
}

#VNotice .close-button {
  position: absolute;
  top: 10px;
  right: 15px;
  background: none;
  border: none;
  font-size: 20px;
  font-weight: bold;
  color: #000; /* black close button */
  cursor: pointer;
  transition: color 0.2s ease;
}

#VNotice .close-button:hover {
  color: #e74c3c;
}

#VNotice h3 {
  text-align: center;
  margin-bottom: 20px;
  color: #000; /* black heading */
}

/* Table Styling */
#VNotice table {
  width: 100%;
  border-collapse: collapse;
  background: transparent; /* ✅ no background */
}

#VNotice th, #VNotice td {
  padding: 12px 15px;
  text-align: left;
  color: #000; /* ✅ black text */
  border-bottom: 1px solid rgba(0, 0, 0, 0.2); /* light gray separators */
}

#VNotice th {
  background-color: rgba(44, 62, 80, 0.6); /* light semi-transparent for contrast */
  color: #000; /* ✅ black heading text */
  font-weight: bold;
}

#VNotice tr:nth-child(even) {
  background-color: rgba(255, 255, 255, 0.3); /* very light gray shading */
}

#VNotice tr:hover {
  background-color: rgba(0, 0, 0, 0.05); /* subtle hover highlight */
}
 

</style>


</head>
<body>

<%
String utoken=(String)session.getAttribute("utoken");

if(utoken != null)
{
%>

 <div class="sidebar">
    
    <div class="logo"> 
      <img src="image1/person2.jpg" alt="Logo">
    </div>
    <p class="logo-title">User,<%=utoken %></p>

    
    <a class="nav-button" onclick="showViewNotice()">View Notice</a>
    <a class="nav-button" onclick="AddComplaints()">Add Complaints</a>
    <a href="#" class="nav-button">View Complaints</a>
    <a href="#" class="nav-button">Club House Booking</a>
    <a class="nav-button" onclick="showStaff()">Staff Management</a>
     

    <a href="user-logout" class="logout-button">Logout</a>
  </div>









<!-- View notice Section Start-->
<%
  List<Notice> ln=(List<Notice>)request.getAttribute("lan");
%>

<section id="VNotice">
  <button class="close-button" onclick="closeViewNotice()">✖</button>
  <h3>Notice</h3>
  <table>
      <thead>
         <tr>
            <th>Notice Id</th>
            <th>Notice Name</th>
            <th>Type</th>
            <th>Date</th> 
            <th>Message</th>        
         </tr>    
      </thead>
      <tbody>
       <%
       for(Notice n:ln)
       {
    	 %>
    	    <tr>
    	       <td><%=n.getNid()%></td>
    	       <td><%=n.getNoticeName() %></td>
    	       <td><%=n.getNoticeType() %></td>
    	       <td><%=n.getNoticeDate() %></td>
    	       <td><%=n.getNoticeMessage() %></td>
    	    </tr>
    	 <%   
       } 
       %>      
      </tbody> 
  </table>


</section>

<!-- View notice Section Ends-->


<!-- Add Complaints form starts -->
<div class="form-container" id="AddComplaint">
  <button class="close-button" onclick="CloseComplaints()">✖</button>
  <form action="add-notice" method="post">
    <h3>Create Complaints</h3>
    
    <label>Notice Id:</label>
    <input type="number" name="nid" required>

    <label>Notice Name:</label>
    <input type="text" name="noticeName" placeholder="Notice Name" required>

    <label>Notice Type:</label>
    <input type="text" name="noticeType" placeholder="Notice Type(water crises,meting)" required>

    <label>Notice Date:</label>
    <input type="date" name="noticeDate" required>

    <label>Notice Message:</label>
    <textarea name="noticeMessage" rows="5" placeholder="Write notice here..." required></textarea>

    
    
    <button type="submit">Send</button>
  </form>
</div>



<!-- Add Complaints form starts -->


























<script type="text/javascript">

  //Add Notice Section Script
  
  function AddComplaints()
  {
	  document.getElementById("AddComplaint").style.display="block";
  }

  function CloseComplaints()
  {
	  document.getElementById("AddComplaint").style.display="none";
  }
  
  
  function showViewNotice()
  {
	  document.getElementById("VNotice").style.display="block";
  }

  function closeViewNotice()
  {
	  document.getElementById("VNotice").style.display = "none";
  }

  
  
  

</script>   
 











<%	
}
else
{
	response.sendRedirect("userlogin.jsp");
	session.setAttribute("msg", "Login then access home");
}
%>

</body>
</html>