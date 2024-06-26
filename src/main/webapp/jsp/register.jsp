<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Register Account</title>
      <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
         rel="stylesheet">
      <link href="../styles/style-login-register.css" rel="stylesheet"
         type="text/css" />
   </head>
   <body>
      <%@ include file="headerlog.jsp"%>
      <div class="container">
         <div class="regbox box">
            <h1>Register Account</h1>
            <form id="form" method="post">
               <label for="role" required>UserRole:</label> 
               <select id="role"
                  name="role">
                  <option value="Student">Student</option>
                  <option value="Teacher">Teacher</option>
               </select>
               <br> &nbsp;
               <p>FirstName</p>
               <input type="text" placeholder="FirstName" id="firstname" required>
               <p>LastName</p>
               <input type="text" placeholder="LastName" id="lastname" required>
               <p>UserName</p>
               <input type="text" placeholder="Username" id="username" required>
               <p>Useremail</p>
               <input type="text" placeholder="Useremail" id="email" required>
               <p>Password</p>
               <input type="password" placeholder="Password" id="password" required>
               <input type="submit" value="Register"> <a href="login.jsp">Already
               have Account?</a>
            </form>
         </div>
      </div>
      <br>
      <%@ include file="footer.jsp"%>
   </body>
	<script type="text/javascript">
	    var form=document.getElementById('form');
	    form.addEventListener('submit', function(e){
	    	e.preventDefault()
		 	var firstname=document.getElementById('firstname').value;
	        var lastname=document.getElementById('lastname').value;
	       
			var roles=document.getElementById('role').value;
	        var username=document.getElementById('username').value;
	
	        var email=document.getElementById('email').value;
	        
	        var pwdObj = document.getElementById('password').value;
	       	if (roles=='Student'){
	    	   var isactive=true;
	       	}
	       <%--  var hashObj = new jsSHA("SHA-512", "TEXT", {numRounds: 1});
	        hashObj.update(pwdObj.value);
	        var hash = hashObj.getHash("HEX");
	        pwdObj.value = hash;
	        console.log(pwdObj)--%>
	
	      <%--  var role=[];
	        for(var i=0;i<roles.length;i++){
	        	role.push({roles[i]})
	        }--%>
	        
	
	     <%--   var isStudent=false;
	
	        if(role=="Student"){
	
	            isStudent=true;
	
	        }
	
	        console.log(isStudent)--%>
	
	        console.log([roles])
	
	        //fetch post request
	
	        fetch("https://onlinelpk12node.azurewebsites.net/api/auth/signup",{
	            method:'POST',
	            body: JSON.stringify({
					"firstname":firstname,
					"lastname":lastname,
	                "username":username,
	                "email":email,
					"role":roles,
					"isactive":isactive,
					"roles":[roles],
	                "password":pwdObj,
	            }),
		        headers:{
		            "Content-Type":"application/json"
		        }
	        }).then(function(response){
	            var resp=response.json();
	       		if(response.status==200){
	       			//US-13
	       			resp.then((data)=>{       			 
	       			 var userid = data.userId;
	       			 var createRootFolderApi = new URL('https://onlinelpk12dotnetapi.azurewebsites.net/api/SparcFileSystem/createrootfolder');
	       			 var params = {userId:userid} // or:
	       			 createRootFolderApi.search = new URLSearchParams(params).toString();
					 console.log(createRootFolderApi);
	       			 fetch(createRootFolderApi,{
	       				 method:'POST'
	       			 }).then(function(response){
	       				if(response.status==200){
	       					console.log(data)
							location.href="login.jsp"
	       				}
	       			 });	       			
	       			});
	           	}
	            else{
	                if(response.status==400){
	                	resp.then((data)=>{
	                		alert(data.message)
	                        location.href="register.jsp"
	                    })
	                }
	            }   
	            return response.json();
	        }).then(function(data){
	            console.log(data);
	        })
	    })
	</script>
</html>
