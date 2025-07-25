<%@page import="com.MainApp.Entity.Staff"%>
<%@page import="com.MainApp.Entity.ClubHouse"%>
<%@page import="com.MainApp.Entity.User"%>
<%@page import="com.MainApp.Entity.Complaint"%>
<%@page import="java.util.List"%>

<%@page import="com.MainApp.Entity.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Admin Home </title>

<style>
    
    /*Nav bar and body*/
	body
	{
	   background-image: url('image1/background.png');
	   background-repeat: no-repeat;
	   background-size: cover;
	   background-attachment: fixed;
	   background-position: center;
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
	
	
	
	/* Add Notice */

	
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
 

/*view Complaints*/


/* Complaints Table (Same style as Notice) */
#VComplaint {
  position: absolute;
  top: 100px; /* so it doesn't overlap with Notice */
  left: 50%;
  transform: translateX(-50%);
  width: 80%;
  max-width: 800px;
  background: transparent;
  border-radius: 10px;
  padding: 20px;
  display: none;
  z-index: 10;
}

#VComplaint .close-button {
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

#VComplaint .close-button:hover {
  color: #e74c3c;
}

#VComplaint h3 {
  text-align: center;
  margin-bottom: 20px;
  color: #000;
}

#VComplaint table {
  width: 100%;
  border-collapse: collapse;
  background: transparent;
}

#VComplaint th, #VComplaint td {
  padding: 12px 15px;
  text-align: left;
  color: #000;
  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
}

#VComplaint th {
  background-color: rgba(44, 62, 80, 0.6);
  color: #000;
  font-weight: bold;
}

#VComplaint tr:nth-child(even) {
  background-color: rgba(255, 255, 255, 0.3);
}

#VComplaint tr:hover {
  background-color: rgba(0, 0, 0, 0.05);
}


/* view Members-Manage members */

/* View Members Table (Same as Notice & Complaint, with thin border) */

	#VMember {
	  position: absolute;
	  top: 100px; /* adjust if needed */
	  left: 50%;
	  transform: translateX(-50%);
	  width: 80%;
	  max-width: 800px;
	  background: transparent;
	  border-radius: 10px;
	  padding: 20px;
	  display: none;
	  z-index: 10;
	}
	
	#VMember .close-button {
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
	
	#VMember .close-button:hover {
	  color: #e74c3c;
	}
	
	#VMember h3 {
	  text-align: center;
	  margin-bottom: 20px;
	  color: #000;
	}
	
	#VMember table {
	  width: 100%;
	  border-collapse: collapse;
	  background: transparent;
	  border: 1px solid rgba(0, 0, 0, 0.3); /* ✅ Thin outer border */
	}
	
	#VMember th, #VMember td {
	  padding: 12px 15px;
	  text-align: left;
	  color: #000;
	  border: 1px solid rgba(0, 0, 0, 0.2); /* ✅ Thin borders for cells */
	}
	
	#VMember th {
	  background-color: rgba(44, 62, 80, 0.6);
	  color: #000;
	  font-weight: bold;
	}
	
	#VMember tr:nth-child(even) {
	  background-color: rgba(255, 255, 255, 0.3);
	}
	
	#VMember tr:hover {
	  background-color: rgba(0, 0, 0, 0.05);
	}

	/*Club House Booking*/
	
	/* Club House Booking Table (Same as Complaints Table but with Thin Border) */
#vclubbooking {
  position: absolute;
  top: 120px; /* adjust as needed */
  left: 50%;
  transform: translateX(-50%);
  width: 80%;
  max-width: 900px;
  background: transparent;
  border-radius: 10px;
  padding: 20px;
  display: none;
  z-index: 10;
}

#vclubbooking .close-club-btn {
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

#vclubbooking .close-club-btn:hover {
  color: #e74c3c;
}

#vclubbooking h3 {
  text-align: center;
  margin-bottom: 20px;
  color: #000;
}

#vclubbooking table {
  width: 100%;
  border-collapse: collapse;
  background: transparent;
  border: 1px solid rgba(0, 0, 0, 0.3); /* ✅ Thin outer border */
}

#vclubbooking th, #vclubbooking td {
  padding: 12px 15px;
  text-align: left;
  color: #000;
  border: 1px solid rgba(0, 0, 0, 0.2); /* ✅ Thin cell borders */
}

#vclubbooking th {
  background-color: rgba(44, 62, 80, 0.6);
  color: #000;
  font-weight: bold;
}

#vclubbooking tr:nth-child(even) {
  background-color: rgba(255, 255, 255, 0.3);
}

#vclubbooking tr:hover {
  background-color: rgba(0, 0, 0, 0.05);
}
	
	/*Add Staff form*/
	
	/* Staff Form Styling (Similar to Notice Form) */
	
	
	#staffForm {
	  position: absolute;
	  top: 50px;
	  left: 50%;
	  transform: translateX(-50%);
	  padding: 30px;
	  width: 400px;
	  background: transparent; /* Transparent like Notice form */
	  border-radius: 10px;
	  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	  display: none;
	  z-index: 10;
	}
	
	#staffForm h3 {
	  text-align: center;
	  margin-bottom: 20px;
	  color: #000;
	}
	
	#staffForm label {
	  display: block;
	  margin-bottom: 8px;
	  font-weight: bold;
	  color: #000;
	}
	
	#staffForm input[type="text"],
	#staffForm input[type="number"],
	#staffForm input[type="date"],
	#staffForm input[type="time"],
	#staffForm input[type="tel"] {
	  width: 100%;
	  padding: 10px;
	  margin-bottom: 20px;
	  border-radius: 6px;
	  border: 1px solid rgba(0, 0, 0, 0.2);
	  font-size: 15px;
	  background: rgba(255, 255, 255, 0.3);
	  color: #000;
	}

	#staffForm button[type="submit"] {
	  width: 100%;
	  padding: 12px;
	  background-color: rgba(44, 62, 80, 0.8);
	  color: white;
	  font-size: 16px;
	  border: none;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: background 0.3s ease;
	}
	
	#staffForm button[type="submit"]:hover {
	  background-color: rgba(44, 62, 80, 1);
	}

	#staffForm .close-button {
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
	
	#staffForm .close-button:hover {
	  color: #e74c3c;
	}
	
	/*Staff Added by Admin*/
	
	/* Staff Table Styling (Same as Member Table) */
#vStaff {
  position: absolute;
  top: 120px; /* adjust as needed */
  left: 50%;
  transform: translateX(-50%);
  width: 80%;
  max-width: 900px;
  background: transparent;
  border-radius: 10px;
  padding: 20px;
  display: none;
  z-index: 10;
}

#vStaff .close-club-btn {
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

#vStaff .close-club-btn:hover {
  color: #e74c3c;
}

#vStaff h3 {
  text-align: center;
  margin-bottom: 20px;
  color: #000;
}

#vStaff table {
  width: 100%;
  border-collapse: collapse;
  background: transparent;
  border: 1px solid rgba(0, 0, 0, 0.3); /* ✅ Thin outer border */
}

#vStaff th, #vStaff td {
  padding: 12px 15px;
  text-align: left;
  color: #000;
  border: 1px solid rgba(0, 0, 0, 0.2); /* ✅ Thin cell borders */
}

#vStaff th {
  background-color: rgba(44, 62, 80, 0.6);
  color: #000;
  font-weight: bold;
}

#vStaff tr:nth-child(even) {
  background-color: rgba(255, 255, 255, 0.3);
}

#vStaff tr:hover {
  background-color: rgba(0, 0, 0, 0.05);
}
	
	
	
	
	
	



</style>


</head>
<body>

<%
String atoken=(String)session.getAttribute("atoken");

if(atoken != null)
{
%>

 <div class="sidebar">
    
    <div class="logo"> 
      <img src="image1/person1.jpg" alt="Logo">
    </div>
    <p class="logo-title">Admin, <%=atoken %></p>

    <a class="nav-button" onclick="openMembers()">Manage Members</a>
    <a class="nav-button" onclick="showNotice()">Add Notice</a>
    <a class="nav-button" onclick="showViewNotice()">View Notice</a>
    <a class="nav-button" onclick="showComplaints()">View Complaints</a>
    <a class="nav-button" onclick="showclubbooking()">Club House Booking</a>
    <a class="nav-button" onclick="showStaff()">Staff Management-Add Staff</a>
    <a class="nav-button" onclick="showStaffTable()">Staff Table</a>

    <a href="admin-logout" class="logout-button">Logout</a>
  </div>




<!-- Manage Members view Start-->

<%
  List<User> ul =(List<User>)request.getAttribute("lau");
%>
 
 <section id="VMember">
  <button class="close-button" onclick="closeMembers()">✖</button>
  <h3>User Information</h3>
  <table>
      <thead>
         <tr>
            <th>User Id:</th>
            <th>User Name:</th>
            <th>User Email:</th>
            <th>User FlatNo:</th> 
            <th>User Phone no:</th>
            <th>User Family members no:</th>
            <th>User Password:</th>        
         </tr>    
      </thead>
      <tbody>
       <%
       for(User u:ul)
       {
    	 %>
    	    <tr>
    	       <td><%=u.getUserid() %></td>
    	       <td><%=u.getUserName() %></td>
    	       <td><%=u.getUserEmail() %></td>
    	       <td><%=u.getUserFlatno() %></td>
    	       <td><%=u.getUserPhoneno() %></td>
    	       <td><%=u.getUserFamno() %></td>
    	       <td><%=u.getUserpass() %></td>
    	    </tr>
    	 <%   
       } 
       %>      
      </tbody> 
  </table>


</section>
 



<!-- Manage Members view Ends-->







<!-- Add notice Section/Form Start-->


<div class="form-container" id="noticeForm">
  <button class="close-button" onclick="closeNotice()">✖</button>
  <form action="add-notice" method="post">
    <h3>Create Notice</h3>
    
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

    <input type="hidden" name="adminName" value="<%=atoken%>">
    
    <button type="submit">Send</button>
  </form>
</div>


<!-- Add notice Section/Form End-->


<!-- View notice Section Start-->
<%
List<Notice> l=(List<Notice>) request.getAttribute("ln");
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
       for(Notice n:l)
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



<!-- View Complaints  Start-->
<%
List<Complaint> lac=(List<Complaint>) request.getAttribute("lac");
%>

<section id="VComplaint">
	<button class="close-button" onclick="closeComplaints()">✖</button>
	<h3>Complaints</h3>
	<table>
	    <thead>
		 	<tr>
		 		<th>Complaint Id</th>
	            <th>Complaint Name</th>
	            <th>Complaint Type</th>
	            <th>Complaint Date</th> 
	            <th>Complaint Message</th>
		 	</tr>	
	    </thead>
	    <tbody>
	          <%
	            for(Complaint lc:lac)
	            {
	            	%>
	            	<tr>
	            	    <td><%=lc.getComplaintid() %></td>
	            	    <td><%=lc.getComplaintName() %></td>
	            	    <td><%=lc.getComplaintType() %></td>
	            	    <td><%=lc.getComplaintDate() %></td>
	            	    <td><%=lc.getComplaintMessage() %></td>
	            	</tr>
	            	<%
	            }
	          %>
	    
	    </tbody>
	
	</table>

</section>


<!-- View Complaints  Ends-->


<!-- clubHouse booking view Start -->

<%
  List<ClubHouse> lab=(List)request.getAttribute("lab");
%>


<section id="vclubbooking">
	<button class="close-club-btn" onclick="closeclubbooking()">✖</button>
	<h3>club house booking</h3>
	<table>
		<thead>
		  <tr>
		  	<th>Booking Id</th>
		  	<th>Member Name</th>
		  	<th>Contact No</th>
		  	<th>Flat No</th>
		  	<th>Booking Date</th>
		  	<th>Start Time</th>
		  	<th>End Time</th>
		  	<th>Purpose</th>
		  	<th>No of Guest</th>
		  </tr>
		</thead>
	    <tbody>
	    <%
	      for(ClubHouse lb:lab)
	      {
	    	%>
	    	<tr>
	    		<td><%=lb.getBookingId() %></td>
	    		<td><%=lb.getUserName() %></td>
	    		<td><%=lb.getUserPhone() %></td>
	    		<td><%=lb.getUserFlatNo() %></td>
	    		<td><%=lb.getBookingDate() %></td>
	    		<td><%=lb.getEventStartTime() %></td>
	    		<td><%=lb.getEventEndTime() %></td>
	    		<td><%=lb.getBookingPurpose() %></td>
	    		<td><%=lb.getGuestCount() %></td>	
	    	</tr>   
	    	
	    	<%  
	      }
	    %>
	    </tbody>
	</table>	
</section>



<!-- clubHouse booking view Ends -->



<!-- Add Staff Section/Form Start-->

<div class="form-container" id="staffForm">
  <button class="close-button" onclick="closeStaffTable()">✖</button>
  <form action="add-staff" method="post">
    <h3>Add Staff</h3>

    <label>Staff Name:</label>
    <input type="text" name="StaffName" placeholder="Enter staff name" required>

    <label>Staff Role:</label>
    <input type="text" name="StaffRole" placeholder="e.g. Security, Cleaner, Gardener" required>

	<label>Assigned Area:</label>
    <input type="text" name="StaffArea" placeholder="e.g. wing,mian gate" required>

    <label>Contact No:</label>
    <input type="text" name="StaffPhone" placeholder="Enter contact number" pattern="[0-9]{10}" required>

    <label>Joining Date:</label>
    <input type="date" name="SaffJoiniDate" required>

    <label>Shift Start Time:</label>
    <input type="time" name="ShiftStartTime" required>

	<label>Shift End Time:</label>
    <input type="time" name="ShiftEndTime" required>
    
    <input type="hidden" name="adminName" value="<%=atoken%>">

    <button type="submit">Add Staff</button>
  </form>
</div>

<!-- Add Staff Section/Form End-->


<!-- Show Staff Start-->

<%

List<Staff> lstaff=(List<Staff>)request.getAttribute("lstaff");

%>

<section id="vStaff">
	<button class="close-club-btn" onclick="closeStaffTable()">✖</button>
	<h3>Staff</h3>
	<table>
		<thead>
		  <tr>
		  	<th>Staff Id</th>
		  	<th>Staff Name</th>
		  	<th>Staff Role</th>
		  	<th>Assigned Area</th>
		  	<th>Contact No</th>
		  	<th>Join Date</th>
		  	<th>Shift Start Time</th>
		  	<th>Shift Start Time</th>
		  </tr>
		</thead>
	    <tbody>
	    <%
	      for(Staff lst:lstaff)
	      {
	    	%>
	    	<tr>
	    		<td><%=lst.getStaffId() %></td>
	    		<td><%=lst.getStaffName() %></td>
	    		<td><%=lst.getStaffRole() %></td>
	    		<td><%=lst.getStaffArea() %></td>
	    		<td><%=lst.getStaffPhone() %></td>
	    		<td><%=lst.getSaffJoiniDate() %></td>
	    		<td><%=lst.getShiftStartTime() %></td>
	    		<td><%=lst.getShiftEndTime() %></td>
	    			
	    	</tr>   
	    	
	    	<%  
	      }
	    %>
	    </tbody>
	</table>	
</section>









<!-- Show Staff Ends-->


























<script type="text/javascript">

  //Add Notice Section Script
  
  function showNotice()
  {
	  document.getElementById("noticeForm").style.display="block";
  }

  function closeNotice()
  {
	  document.getElementById("noticeForm").style.display="none";
  }
  
  
  function showViewNotice()
  {
	  document.getElementById("VNotice").style.display="block";
  }

  function closeViewNotice()
  {
	  document.getElementById("VNotice").style.display = "none";
  }

  // complaints section
  
  function showComplaints()
  {
	  document.getElementById("VComplaint").style.display = "block";
  }
  
  function closeComplaints()
  {
	  document.getElementById("VComplaint").style.display = "none";
  }
  
  //User infromation 
  
  function openMembers()
  {
	  document.getElementById("VMember").style.display = "block";
  }
  
  function closeMembers()
  {
	  document.getElementById("VMember").style.display = "none";
  }
  
  
  //club house booking
  
  function showclubbooking()
  {
	  document.getElementById("vclubbooking").style.display = "block";
  }
  
  function closeclubbooking()
  {
	  document.getElementById("vclubbooking").style.display = "none";
  }
  
  
  //staff form contoller
  
  function showStaff() 
  {
  	document.getElementById("staffForm").style.display = "block";
  }

  function closeStaff() 
  {
	  document.getElementById("staffForm").style.display = "none";
  }
  
  //staff table
  
  function showStaffTable() 
  {
  	document.getElementById("vStaff").style.display = "block";
  }

  function closeStaffTable() 
  {
	  document.getElementById("vStaff").style.display = "none";
  }
  

  
  

</script>   
 











<%	
}
else
{
	response.sendRedirect("adminlogin.jsp");
	session.setAttribute("msg", "Login then access home");
}
%>

</body>
</html>