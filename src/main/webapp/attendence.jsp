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

li a:hover {
  background-color:#4374AB;
}
.active{
       background-color:#4374AB;
}
#attendence-border{
   width:1060px;
   height:550px;
   background-color:white;
   position:absolute;
   top:80px;
   left:210px;  
}
#inner-class-border
{
   width:350px;
   height:280px;
   background-color:white;
   position:absolute;
   top:80px;
   left:280px;
   box-shadow:0 20px 30px 0 rgba(0,0,0,0.25);
   border-radius: 5px;
}
#scanner-panner
{
   width:1060px;
   height:550px;
   background-color:white;
   position:absolute;
   top:80px;
   left:210px;
   display: none;
}
#ten-countdown {
    /* text-align: center; */
    border: 5px solid #004853;
    display:none;
    padding: 5px;
    color: #004853;
    font-family: Verdana, sans-serif, Arial;
    font-size: 40px;
    font-weight: bold;
    text-decoration: none;
    position:absolute;
    top:360px;
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
       <li><a href="Home.jsp">Home</a></li>
       <li class="active"><a href="attendence.jsp">Attendence</a></li>
       </ul>
</div>

<div id="attendence-border" >
       <div id="inner-class-border">
            <h3 style="text-align:center;background: linear-gradient(45deg, transparent 0%, transparent 57%, #423246 100%), linear-gradient(-45deg, #8f5046 0%, #A14436 0.3%, #4C2556 112%, transparent 11% ), linear-gradient(-90deg, #A14436 100%, #A14436 65%, transparent 20% );
           color: white;padding: 7px;padding:10px;">Scanner Attendence</h3>
           <h5 style="position:absolute;top:50px;left:10px;" >Accadamic Date</h5>
           <input style="position:absolute;top:90px;left:10px;width:300px;height:28px;" type="date" id="date" onblur="gettimings()">
            <h5 style="position:absolute;top:108px;left:10px;" >Select class</h5>
           <select style="position:absolute;top:148px;left:10px;width:305px;height:30px;" type="text" id="i12" ><option>Select section</option></select>
            <h5 style="position:absolute;top:160px;left:150px;" id="tlba">Timer</h5>
            <input style="position:absolute;top:200px;left:142px;width:50px;height:28px;" type="number" id="timer" name="quantity" min="1" max="5" placeholder="1 to 5"> 
            <button onclick="search()" style="position:absolute;top:240px;left:125px;width:100px;height:30px;background-color:#337ab7;border:none;border-radius:3px;color:white; ">search</button>
       </div>
</div>

<div id="scanner-panner">
    <h2 style="text-align:center;color:#CD2F7A;">Scanner Attendance</h2>
   <div style="display:flex;justify-content: center;"><h5 id="class-details" style="color:#CD2F7A;position:absolute;top:30px;"></h5>
       <h5 id="timer-details" style="color:#CD2F7A;position:absolute;top:50px;"></h5>
       <button id="startbutton" onclick="sel()" style="width:100px;height:25px;background-color:#337ab7;position:absolute;top:90px;border:none;border-radius:2px;box-shadow:0 5px 10px 0 rgba(0,0,0,0.25);color:white;">start</button>
       <button id="stopbutton" onclick="stopsel()" style="width:100px;height:25px;background-color:red;position:absolute;top:90px;border:none;border-radius:2px;box-shadow:0 5px 10px 0 rgba(0,0,0,0.25);color:white;display:none;">stop</button>      
       <button id="backbutton" onclick="backsel()" style="width:100px;height:25px;background-color:black;position:absolute;top:90px;border:none;border-radius:2px;box-shadow:0 5px 10px 0 rgba(0,0,0,0.25);color:white;display:none;">back</button>        
       <img id="scanme" alt="qrcode scanner" src="./images/qr.JPG" style="margin-top:60px;">
       <h1 id="ten-countdown"></h1>
   </div>
</div>

</body>
<script type="text/javascript">
let id;
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

function gettimings()
{
	var xhtml = new XMLHttpRequest();
	var url = "http://localhost:8080/api/ReadTimings/"+date.value;
	xhtml.open("GET", url, true);
	xhtml.setRequestHeader('Content-Type','application/json');
	xhtml.send();
	var E = document.getElementById("i12");
	xhtml.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
		{
			var data = JSON.parse(this.responseText);
			E.innerHTML="";
			for(var x in data)
			{
				if(data[x].status==false){
				var option = document.createElement("option");
				option.value = data[x].id;
				option.text = " "+data[x].section +" "+ data[x].time;
				E.add(option);
				}
			}
		}
	};	
	
}

function search()
{
   if(timer.value>=1 && timer.value<=5)
   {
	   document.getElementById("tlba").style.color = "green";
	   document.getElementById("timer").style.border = "1px solid black";
	   document.getElementById("tlba").innerHTML = "valid";
	   if(i12.value>0)
	   {
		   document.getElementById("scanner-panner").style.display = "block";
		   document.getElementById("class-details").innerHTML = i12.options[i12.selectedIndex].text;
		   document.getElementById("timer-details").innerHTML = "timer : "+" "+timer.value+" min";
		   
		   var xhtml = new XMLHttpRequest();
			var url = "http://localhost:8080/api/anthecation";
			xhtml.open("POST", url, true);
			xhtml.setRequestHeader('Content-Type','application/json');	
			xhtml.send(JSON.stringify({
					details : i12.options[i12.selectedIndex].text,
				}));
		   
	   }
	   else
		   alert("Already done/no timetable");
	   
	   
   }
   else
   {
	   document.getElementById("tlba").style.color = "red";
	   document.getElementById("timer").style.border = "1px solid red";
	   document.getElementById("tlba").innerHTML = "Invalid";
   }
}

function makeid(length) {
    let result = '';
    const characters = 'ABCDEFGMNOPQRSTUVWXYZabcdeHI%^&*()_+~JKLfghijklmnopqrstuvwxyz0123456789!@#$`:""|}{}[]></?,=-';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}
let codebe;
function startcode()
{
	codebe = coderandom();
	var url= 'https://api.qrserver.com/v1/create-qr-code/?size=251×256&data='+codebe;
	document.getElementById("scanme").src = url;
}
function coderandom()
{
	    var p =  Math.floor((Math.random() * 100000000) + 1);	
		return p;
}
function sel(){
    document.getElementById("startbutton").style.display = "none";
    document.getElementById("stopbutton").style.display = "block";
    document.getElementById("ten-countdown").style.display = "inline";
    countdown("ten-countdown",timer.value, 0 );
   id =  setInterval(startcode,2000);
}
let poi;
function stopsel(){
	var url= 'https://api.qrserver.com/v1/create-qr-code/?size=251×256&data='+"Here is your code for students! Time is UP";
	document.getElementById("scanme").src = url;
	document.getElementById("backbutton").style.display = "block";
	document.getElementById("stopbutton").style.display = "none";
	clearInterval(id);
	clearInterval(poi);
}
function backsel(){
	 window.location.replace("attendence.jsp");	
}
 

function countdown( elementName, minutes, seconds )
{
var element, endTime, hours, mins, msLeft, time;

function twoDigits( n )
{
    return (n <= 9 ? "0" + n : n);
    
}

function updateTimer()
{
    msLeft = endTime - (+new Date);
    if ( msLeft < 1000 ) {
    	 element.innerHTML = "Time is up!";
    	 stopsel();
    } else {
        time = new Date( msLeft );
        hours = time.getUTCHours();
        mins = time.getUTCMinutes();
        element.innerHTML = (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
        poi = setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
    }
}

element = document.getElementById( elementName );
endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
updateTimer();
}

</script>

</html>