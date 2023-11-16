<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#border{
    width:1290px;
    height:80px;
    background-color:white;
    box-shadow : 3px 1px 5px black;
    position:absolute;
    left:-10px;
    top:0px;
}
#imf{
   position: absolute;
   top:10px;
   left:600px;
}
#login-box{
      width:500px;
      height:400px;
      background-color: white;
      position:absolute;
      top:130px;
      left:400px;
      box-shadow:3px 3px 8px black;
      border-radius:5px;
}
.login-inner-block{
     width:470px;
     height:250px;
     background-color: #eee;
     position:absolute;
     top:90px;
     left:15px;
     border-radius:4px;
}
body{
 font-family: 'Muli',sans-serif;
 color:white;
}
</style>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="border">
      <img src="./images/klu.png" id=imf> 
</div>

<div id="login-box" > 
     <img src="./images/klu.png" style="position:absolute;top:8px;left:20px;"> 
     <div class="login-inner-block">
         <input id="rollno"  type="text" placeholder=" Enter Roll No" style="width:420px;height:40px;border:none;position:absolute;top:30px;left:20px;" >
          <input id="pass"  type="password" placeholder=" Enter Password" style="width:420px;height:40px;border:none;position:absolute;top:90px;left:20px;" >
           <button onclick="login()" style="width:420px;height:40px;border:none;position:absolute;top:150px;left:20px;background-color:#A83E3E;color:white;">Log in</button>  
           <a href="#" style="text-decoration:none;color:orange;font-size:13px;position:absolute;top:200px;left:180px;">Forgot password</a>
           <button onclick="register()" style="width:100px;height:30px;border:none;position:absolute;top:230px;left:180px;background-color:green;color:white;">Register</button>  
           <p id="error" style="display:none;color:red;position:absolute;top:250px;left:180px;"></p>  
     </div>
</div>



</body>



<script type="text/javascript">
              function register()
              {
            	  window.location.replace('register.jsp');
              }
              function login()
              {
            	  var xhtml = new XMLHttpRequest();
            	  var url = "http://localhost:8080/api/LoginFaculity/"+rollno.value+"/"+pass.value;
            		xhtml.open("GET", url, true);
            		xhtml.setRequestHeader('Content-Type','application/json');
            		xhtml.send();
            		xhtml.onreadystatechange = function() 
            		{
            			if(this.readyState == 4 && this.status == 200)
            			{
            				if(this.responseText != "error"){
            					window.location.replace('Home.jsp');
            			       }
            				else{
            				 document.getElementById("error").style.display = "block";
           					 document.getElementById("error").innerHTML="Wrong password!";
            				}
            			}
            		};
              }
              
</script>
</html>