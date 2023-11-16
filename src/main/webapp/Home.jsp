<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style type="text/css" >
#border{
width:1280px;
height:70px;
background-color:#E0E0E0;
border-top:2px solid #a51c24;
position:absolute;
top:2px;
left:0px; 
}
body{
 font-family: 'Muli',sans-serif;
}

#side-border{
  width:200px;
  height:550px;
  background-color:white;
   position:absolute;
  left:1px;
  top:75px;
  border-top:2px solid grey;
  border-right:2px solid grey;
  box-shadow:3px 3px 5px black;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  width: auto;
}

li a {
  background-color: #333333;
  display: block;
  color: white;
  text-align: center;
  padding: 10px;
  text-decoration: none;
  margin-bottom:2px;
  margin-top:2px;
}

.active{
       background-color:#4374AB;
}

li a:hover {
  background-color:#4374AB;
}

</style>
</head>
<body onload="loaderp()">
<div id="border">
   <img src="./images/klu.png" style="width:150px;height:50px;margin-left:10px;margin-top:10px;">
   <h2 style="position:absolute;left:560px;top:0px;color:#a51c24;">Faculity Portal</h2>
   <h5 id="rollno" style="position:absolute;left:1210px;top:0px;color:black;"></h5>
   <h5 id="Name" style="position:absolute;left:1210px;top:15px;color:black;"></h5>
</div>

<div id="side-border">
       <ul>
       <li class="active"><a href="Home.jsp">Home</a></li>
       <li><a href="attendence.jsp">Attendence</a></li>
       </ul>
</div>


</body>
<script type="text/javascript">
function loaderp()
{
	var xhtml = new XMLHttpRequest();
	var url = "http://localhost:8080/api/GetErp";
	xhtml.open("GET", url, true);
	xhtml.setRequestHeader('Content-Type','application/json');
	xhtml.send();
	xhtml.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
		{
			     if(this.responseText!="[]") 
		         {
			    	 var data = JSON.parse(this.responseText);
			    	 for(var x in data)
			    	 {
			    		 document.getElementById("rollno").innerHTML=data[x].rollno;
			    		 document.getElementById("Name").innerHTML=data[x].name;
			    	 }
		         }
			     else
			     window.location.replace("index.jsp");		
		}
	};
}

</script>

</html>