<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="table.css">
<title>Work History Check</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					<img src="Images/CheezburgerHR_HDZ_Logo.png" height="30">
				</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="LogoutServlet">Logout</a></li>
				<li><a href="ApplicationListServlet">Application List</a></li>	
				<li><a href="ApplicationActivityListServlet">Activity List</a></li>
				<li><a href="NewApplicationFormServlet">New Application</a></li>
			</ul>
		</div>
	</nav>

<h2>Work History and Reference Check</h2>
<!--  this is page 1 -->
<!-- Show user info and list incomplete dependent activity -->
<p> User: <c:out value="  ${user.username}" />        <br> HR Role: <c:out value="  ${user.chUserRoles[0].chHrrole.roleDescription}" /></p>
<br><br>
<p>
<c:if test="${depflag == \"1\"}">
	<table>
	  <tr>
	    <th> Incomplete Dependent Activities</th>
	  </tr>
	  <c:forEach items="${depactlist}" var="depact">
		<tr>
			<td><c:out value="  ${depact.chActivity.actdescription}" /></td>
		</tr>
	  </c:forEach>
	</table>
</c:if>
<br/>
<br/>

<table>
<tr>
<th> Application ID</th>
<th> Applicant Name</th>
<th> Application Status</th>
<th> Work  History</th>
<th> Reference</th>
</tr>

			<tr>
				<td><c:out value="  ${application.appid}" /></td>
				<td><c:out value="  ${application.name}" /></td>
				<td>
					<c:choose>
						<c:when test="${applicant.appstatus ==  \"P\"}">
							<img src="Images/burger.png" alt="Pass" title="Pass" height="40">
						</c:when>
						
						<c:when test="${applicant.appstatus ==  \"F\"}">
							<img src="Images/sad_cat.png" alt="Fail" title="Fail" height="40">
						</c:when>
						
						<c:otherwise>
							<img src="Images/cat.png" alt="In Process" title="In Process" height="40">
						</c:otherwise>
					</c:choose>
				</td>
				<td><c:out value="  ${application.jobhistory }"></c:out></td>
				<td><c:out value="  ${application.appref }"></c:out></td>
				</tr>
			</table>
		
		
		
	<!--  			<td> <form action="SessionApplicationServlet" method="Post">
						<input type="submit" value="view">
						<input type="hidden" name="appid" value="${applicant.appid}">
					</form></td>
	-->
	<c:if test="${application.appstatus != \"F\" && depflag == \"0\"}">
	<!--	<form action="UpdateNationalityServlet" method="Post">
						<input type="submit" value="Confirm">
						<input type="hidden" name="status" value="P">
					</form>
					
		<form action="UpdateNationalityServlet" method="Post">
						<input type="submit" value="Reject">
						<input type="hidden" name="status" value="F">
					</form>			-->
		<form action="UpdateWorkHistoryServlet" method="post">
			<input type="radio" name="status" value="P">Confirm<br>
			<input type="radio" name="status" value="F">Reject<br>
			<input type="radio" name="status" value="I" checked>In process<br>
			<br>
			Comments: <br><textarea name="workhistorycomment" rows="8" cols="40" maxlength="255"><c:out value="${workhistorycomment}" /></textarea><br>
			<input type="submit" value="Submit">
		</form>	
	</c:if>

</body>
</html>