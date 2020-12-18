<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<script src="https://use.fontawesome.com/1dec14be15.js"></script>
<style>


</style>
<title>Insert title here</title>
</head>
<body>
 <div class="view full-page-intro" style="background-image: url('https://www.google.com.np/imgres?imgurl=https%3A%2F%2Fwww.w3schools.com%2Fw3css%2Fimg_lights.jpg&imgrefurl=https%3A%2F%2Fwww.w3schools.com%2Fw3css%2Fw3css_images.asp&docid=R0KnAtfyBDsyiM&tbnid=kwgHAQqTiLQXLM%3A&vet=10ahUKEwj5z9nr277bAhWBbX0KHZzyAS8QMwitASgBMAE..i&w=600&h=400&bih=702&biw=1366&q=image&ved=0ahUKEwj5z9nr277bAhWBbX0KHZzyAS8QMwitASgBMAE&iact=mrc&uact=8'); background-repeat: no-repeat; background-size: cover;">
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
          <div class="container">
            <div class="row wow fadeIn">
              <div class="col-md-6 mb-4 white-text text-center text-md-left">
                <h1 class="display-4 font-weight-bold">Sign UP</h1>
                <hr class="hr-light">
                <p>
                  <strong>For the more information</strong>
                </p>
                <p class="mb-4 d-none d-md-block">
                  <strong>Quickly get information from new leads and customers by signing up .WIth their information, you can funnel them into new accounts in an instant.Follow us on FACEBOOK</strong>
                </p>
                <a href="http:/www.facebook.com" target="_blank"  class="btn btn-indigo btn-lg">Facebook
                  <i class="fa fa-facebook ml-2"></i>
                </a>
              </div>
              <div class="col-md-6 col-xl-5 mb-4">
                <div class="card">
                  <div class="card-body">
                    <form>
                      <p class="h4 text-center mb-4">Sign up</p>
                      <div class="md-form">
                         <i class="fa fa-user prefix grey-text"></i>
                         <input type="text" name="userid"id="userid" class="form-control">
                         <label for="materialFormRegisterNameEx">ID</label>
                      </div>
                      <div class="md-form">
                         <i class="fa fa-envelope prefix grey-text"></i>
                         <input type="email" name="useremail" id="useremail" class="form-control">
                         <label for="materialFormRegisterEmailEx"> email</label>
                      </div>
                      
                      <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="userpassword" name="userpassword" class="form-control">
                        <label for="materialFormRegisterPasswordEx"> password</label>
                      </div>
                      <div class="md-form">
                            <i class="fa fa-exclamation-triangle prefix grey-text"></i>
                            <input type="password" id="password2" name="password2" class="form-control">
                            <label for="materialFormRegisterPasswordEx">Confirm Your password</label>
                      </div>
                      
                      <div class="text-center mt-4">
                       <button class="btn btn-primary" id="submit"type="button" data-toggle="modal" data-target="#myModal">Register</button>
                      
                   </form> 
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
   
 
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language="javascript">
var p2 = $("#password2").val();
$(document)
.on("click","#submit",function(){
	if($("#userid").val()==""){
		alert("invalid id");
		
		return false;
	}
	if($("#useremail").val()==""){
		alert("invalid useremail");
		return false;
	}
	if($("#userpassword").val()==""){
		alert("invalid userpassword");
		return false;
	}
	
	if($("#userpassword").val()!=$("#password2").val()){
		console.log(p2);
		alert("not matching password please check your password");
		return false;
	}
	$.ajax({
	
		  url:'TrySignup',//호출될 서블릿의 경로(이름)
		  method:'post',//데이터 전송방식 get/post
		  //전송할 데이터(쿼리스트링)//
		  data:'userid='+$('input[name=userid]').val()+'&useremail='+$('input[name=useremail]').val()+'&userpassword='+$('input[name=userpassword]').val(),
		  dataType:'text',//반환받을 데이터 타입 
		  beforeSend:function(){},
		  success:function(txt){//호출 성공해서 완료하면 
			  
		},
		complete:function(txt){
			console.log(txt);
			alert("회원가입에 성공했습니다.")
			location.href = "http://localhost:8181/practice/firstpage1";
		} 
		
	    })
		 
	   
})
</script>