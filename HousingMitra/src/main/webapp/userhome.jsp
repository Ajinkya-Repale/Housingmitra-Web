<%@page import="com.MainApp.Entity.Complaint"%>
<%@page import="com.MainApp.Entity.Staff"%>
<%@page import="com.MainApp.Service.NoticeService"%>
<%@page import="java.util.List"%>

<%@page import="com.MainApp.Entity.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>

<style>
    
    /*Nav bar and body*/
	body
	{
	   background-image: url('image1/background.png');
	   background-repeat: no-repeat;
	   background-size: cover;
	   background-attachment: fixed;
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


	/*View  Complaints Table*/
	
	#viewComplaints
	{
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
	
	#viewComplaints th,
	#viewComplaints td
	{
		padding: 12px 15px;
	  text-align: center;
	  color: #000; /* ✅ black text */
	  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	}
	
	#viewComplaints th
	{
		background-color: rgba(44, 62, 80, 0.6); /* light semi-transparent for contrast */
	  color: #000; /* ✅ black heading text */
	  font-weight: bold;
	}
	
	#viewComplaints h3
	{
	  text-align: center;
	  margin-bottom: 20px;
	  color: #000; 
	}

	.btn-close-complaints
	{
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


	.btn-close-complaints:hover
	{
		color: #e74c3c;
	}

	  #viewComplaints table {
	  width: 100%;
	  border-collapse: collapse;
	  background: transparent; /* ✅ no background */
	}
	
	#viewComplaints th, #viewComplaints td {
	  padding: 12px 15px;
	  text-align: left;
	  color: #000; /* ✅ black text */
	  border-bottom: 1px solid rgba(0, 0, 0, 0.2); /* light gray separators */
	}
	
	#viewComplaints th {
	  background-color: rgba(44, 62, 80, 0.6); /* light semi-transparent for contrast */
	  color: #000; /* ✅ black heading text */
	  font-weight: bold;
	}
	
	#viewComplaints tr:nth-child(even) {
	  background-color: rgba(255, 255, 255, 0.3); /* very light gray shading */
	}
	
	#viewComplaints tr:hover {
	  background-color: rgba(0, 0, 0, 0.05); /* subtle hover highlight */
	}


	/* Apply thin black border to complaint table */
	table.complaint-table {
	    width: 100%;
	    border-collapse: collapse;
	    border: 1px solid black;
	    background-color: transparent;
	}
	
	table.complaint-table th,
	table.complaint-table td {
	    border: 1px solid black;
	    padding: 8px;
	    text-align: left;
	}


	table.complaint-table tr:nth-child(even) {
	    background-color: rgba(0, 0, 0, 0.03);
	}
	

	/*delete button*/
	
	
	.delete-btn {
    background-color: transparent;
    color: #e74c3c;
    border: 1px solid #e74c3c;
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
	}

	.delete-btn:hover {
	    background-color: #e74c3c;
	    color: white;
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
	  text-align: center;
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
	
	
	.notice-table {
    border-collapse: collapse;
    width: 100%;
    border: 1px solid black;
	}

	.notice-table th,
	.notice-table td {
	    border: 1px solid black;
	    padding: 8px;
	    text-align: center;
	}
	
	 
/*Club House Booking form */

	
	.club-form-container {
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  width: 400px;
	  padding: 20px; /* Reduced from 30px */
	  background: transparent;
	  border-radius: 10px;
	  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	  display: none;
	  z-index: 10;
	}
	
	.club-form-container h3 {
	  text-align: center;
	  margin-bottom: 10px; /* Reduced from 20px */
	  color: #000;
	}
	
	.club-form-container input[type="text"],
	.club-form-container input[type="date"],
	.club-form-container input[type="time"],
	.club-form-container input[type="number"],
	.club-form-container textarea {
	  width: 100%;
	  padding: 8px; /* Slightly smaller */
	  margin-bottom: 12px; /* Reduced from 20px */
	  border-radius: 6px;
	  border: 1px solid rgba(0, 0, 0, 0.2);
	  font-size: 14px;
	  background: rgba(255, 255, 255, 0.3);
	  color: #000;
	}

	.club-form-container textarea {
	  resize: vertical;
	  min-height: 50px; /* Ensures it’s not too tall */
	}
	
	.club-form-container button[type="submit"] {
	  width: 100%;
	  padding: 10px; /* Slightly smaller */
	  background-color: rgba(44, 62, 80, 0.8);
	  color: white;
	  font-size: 15px; /* Slightly smaller */
	  border: none;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: background 0.3s ease;
	}

	.club-form-container button[type="submit"]:hover {
	  background-color: rgba(44, 62, 80, 1);
	}




	/*Show Staff */
	
	
	#Vstaff {
	  position: absolute;
	  top: 50px;
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
	
	#Vstaff .close-button {
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
	
	#Vstaff .close-button:hover {
	  color: #e74c3c;
	}
	
	#Vstaff h3 {
	  text-align: center;
	  margin-bottom: 20px;
	  color: #000;
	}
	
	#Vstaff table {
	  width: 100%;
	  border-collapse: collapse;
	  background: transparent;
	}
	
	#Vstaff th, #Vstaff td {
	  padding: 12px 15px;
	  text-align: center;
	  color: #000;
	  border-bottom: 1px solid rgba(0, 0, 0, 0.2); /* Thin light border */
	}
	
	#Vstaff th {
	  background-color: rgba(44, 62, 80, 0.6);
	  color: #000;
	  font-weight: bold;
	}
	
	#Vstaff tr:nth-child(even) {
	  background-color: rgba(255, 255, 255, 0.3);
	}
	
	#Vstaff tr:hover {
	  background-color: rgba(0, 0, 0, 0.05);
	}
	
	/*staff table style*/
	
	.staff-table {
	  border-collapse: collapse;
	  width: 100%;
	  border: 1px solid black;
	}

	.staff-table th, .staff-table td {
	  border: 1px solid black;
	  padding: 8px;
	  text-align: center;
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
    <p class="logo-title">User, <%=utoken %></p>

    <a href="/userhome" class="nav-button">Home</a>
    <a class="nav-button" onclick="showViewNotice()">View Notice</a>
    <a class="nav-button" onclick="AddComplaints()">Add Complaints</a>
    <a class="nav-button" onclick="ViewComplaintsTable()">View Complaints</a>
    <a class="nav-button" onclick="openClubBookingForm()">Club House Booking</a>
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
  <table class="notice-table">
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
  <form action="add-complaint" method="post">
    <h3>Create Complaints</h3>

    <label>Complaint Name:</label>
    <input type="text" name="complaintName" placeholder="Complaint Name" required>

    <label>Complaint Type:</label>
    <input type="text" name="complaintType" placeholder="Complaint Type(water crises,meting)" required>

    <label>Complaint Date:</label>
    <input type="date" name="complaintDate" required>

    <label>Complaint Message:</label>
    <textarea name="complaintMessage" rows="7" placeholder="Write Complaint here..." required></textarea>

    <input type="hidden" name="userName"  value="<%=utoken%>" >
    
    <button type="submit">Send</button>
  </form>
</div>


<!-- Add Complaints form Ends -->

<!-- View Complaints Table Start -->

<%
List<Complaint> lc =(List<Complaint>) request.getAttribute("lc");
%>


<section id="viewComplaints">
  <button class="btn-close-complaints" onclick="closeViewComplaints()">✖</button>
  <h3>Complaints</h3>
  <table class="complaint-table">
  	<thead>
  		<tr>
  			<th>Complaint ID</th>
  			<th>Complaint Name</th>
  			<th>Complaint Type</th>
  			<th>Complaint Date</th>
  			<th>Complaint Message</th>
  			<th>Status</th>
  			<th>Delete</th>
  		</tr>	
  	</thead>
  	<tbody>
  		<%
  		for(Complaint c:lc)
  		{
  		%>
  			<tr>
  				<td><%=c.getComplaintid() %></td>
  				<td><%=c.getComplaintName() %></td>
  				<td><%=c.getComplaintType() %></td>
  				<td><%=c.getComplaintDate() %></td>
  				<td><%=c.getComplaintMessage() %></td>
  				<td></td>
  				<td>
  					<form action="delete-complaint" method="post">
  						<input type="hidden" name="complaintid" value="<%=c.getComplaintid()%>">
  						<button class="delete-btn" type="submit">Delete</button>
  					</form>
  				</td>
  			</tr>	
  		<%
  		}
  		%>
  	</tbody>
</table>

</section>







<!-- Club House Booking Section Start -->
	


<div class="club-form-container" id="clubBookingForm">
  <button class="close-button" onclick="closeClubBookingForm()">✖</button>
  <form action="add-club-booking" method="post">
    <h3>Club House Booking</h3>

    <label>Your Name:</label>
    <input type="text" name="UserName" placeholder="Enter your name" required>

    <label>Contact Number:</label>
    <input type="text" name="UserPhone" placeholder="Enter phone number" required>

    <label>Flat Number:</label>
    <input type="text" name="UserFlatNo" placeholder="Enter flat number" required>

    <label>Booking Date:</label>
    <input type="date" name="bookingDate" required>

    <label>Start Time:</label>
    <input type="time" name="eventStartTime" required>

    <label>End Time:</label>
    <input type="time" name="eventEndTime" required>

    <label>Purpose:</label>
    <input type="text" name="bookingPurpose" placeholder="Birthday, Meeting, etc." required>

    <label>Number of Guests:</label>
    <input type="number" name="guestCount" placeholder="Enter guest count" required>

    <input type="hidden" name="adminApproval" value="Pending">

    <button type="submit">Book Now</button>
  </form>
</div>



<!-- Club House Booking Form End -->

	
	
<%
List<Staff> last =(List<Staff>)request.getAttribute("last");
%>	
	
	
<!-- Show Staff  section Start-->	

<section id="Vstaff">
  <button class="close-button" onclick="closeStaff()">✖</button>
  <h3>Staff</h3>
  <table class="staff-table">
      <thead>
         <tr>
            <th>Staff Id</th>
		  	<th>Staff Name</th>
		  	<th>Staff Role</th>
		  	<th>Assigned Area</th>
		  	<th>Contact No</th>
		  	<th>Join Date</th>
		  	<th>Shift Start Time</th>
		  	<th>Shift End Time</th>       
         </tr>    
      </thead>
      <tbody>
       <%
       for(Staff ls:last)
       {
    	 %>
    	    <tr>
    	       <td><%=ls.getStaffId() %></td>
	    		<td><%=ls.getStaffName() %></td>
	    		<td><%=ls.getStaffRole() %></td>
	    		<td><%=ls.getStaffArea() %></td>
	    		<td><%=ls.getStaffPhone() %></td>
	    		<td><%=ls.getSaffJoiniDate() %></td>
	    		<td><%=ls.getShiftStartTime() %></td>
	    		<td><%=ls.getShiftEndTime() %></td>
    	    </tr>
    	 <%   
       } 
       %>      
      </tbody> 
  </table>


</section>


	
	
	
	
<!-- Show Staff  section Ends-->	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	











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
  
  //view Complaints
  
  function ViewComplaintsTable()
  {
	  document.getElementById("viewComplaints").style.display="block";
  }
  
  function closeViewComplaints()
  {
	  document.getElementById("viewComplaints").style.display="none";
  }

  //view notice
  
  function showViewNotice()
  {
	  document.getElementById("VNotice").style.display="block";
  }

  function closeViewNotice()
  {
	  document.getElementById("VNotice").style.display = "none";
  }

  
  //club house booking form
  
  function openClubBookingForm()
  {
	  document.getElementById("clubBookingForm").style.display = "block";
  }
  
  
  function closeClubBookingForm()
  {
	  document.getElementById("clubBookingForm").style.display = "none";
  }
  
  
  
  //show staff
  
  function showStaff()
  {
	  document.getElementById("Vstaff").style.display = "block";
  }
  
  
  function closeStaff()
  {
	  document.getElementById("Vstaff").style.display = "none";
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