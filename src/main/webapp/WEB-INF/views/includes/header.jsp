<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>


<!-- dd -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 -->
    <script type="text/javascript" src="resources/js/bootstrap.js"></script>
    <%--부트스트랩 CSS--%>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
    <%-- index css 커스텀--%>
     <link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">
    <%-- TH css 커스텀--%>
    <link rel="stylesheet" type="text/css" href="resources/css/THStyle.css">
    <%-- ssh css 커스텀--%>
    <link rel="stylesheet" type="text/css" href="resources/css/sshStyle.css">

    <!--부트스트랩 와치-->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css" rel="stylesheet" integrity="sha384-D/7uAka7uwterkSxa2LwZR7RJqH2X6jfmhkJ0vFPGUtPyBMF2WMq9S+f9Ik5jJu1" crossorigin="anonymous">
    <!-- 카카오 js -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- 카카오 init -->
    <script>Kakao.init('34800e916b17799e85bcefde72c06423')</script>
    <!-- 네이버 js -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  
    <%--구글 로그인 커스텀--%>
 <script src="https://apis.google.com/js/api:client.js"></script>

 
    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <%-- 아이콘--%>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <!-- 카카오 지도 -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3c4fdcbe2ae096fbd9562312c53b316&libraries=services,clusterer,drawing"></script>

    <%-- chart 생성 위한 Chart.js --%>
    <script type="text/javascript" src="resources/js/Chart.js"></script>
    <script type="text/javascript" src="resources/js/Chart.bundle.js"></script>
    <title>홈</title>
</head>

<body>

<!-- 세션받아오기 -->
    <% String user = (String) session.getAttribute("user");%>
    <% String name = (String) session.getAttribute("name");%>
	<% String grade = (String) session.getAttribute("grade");%>
	
<input id="session" type="hidden" value="<%=user%>">  <!-- 로그인 세션파라미터 -->
<input id="name" type="hidden" value="<%=name%>">  <!-- 유저 이름 세션파라미터 -->
<input id="grade" type="hidden" value="<%=grade%>">  <!-- 유저 등급 세션파라미터 -->

<!-- 로그인 인터셉터 (로그인창을 띄어주는 스크립트 임시호출)-->
    <% String ltr = (String) request.getAttribute("ltr");
if(user==null){
	if(ltr != null){  
%>
    <%=ltr%>
    <%
	}
}
%>


  
<header class="header-fixed"> <!-- 헤더 고정 태그 시작 -->
 <nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
 	<div class="container-fluid" >
	    <div class="navbar-header">
	      <a class="navbar-brand" href="${path}/"> <img src="${path}/resources/img/logo.png" height="36" width="69" alt=""> </a>		
    	  <button type="button" class="navbar-toggler" aria-expanded="false" data-toggle="collapse" data-target="#navbarNav">
    	   <i class="material-icons" style="size:24px">search</i>
    	  </button>
	  	 </div>
	  	 
	  	 <div class="collapse navbar-collapse" id="navbarNav" style="width:70%;">
		  	<form action="search" class="form-inline " role="search" class="navbar-toggle" data-toggle="collapse">
	           <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="기업명을 검색해주세요">
	           <button type="submit" class="btn btn-dark">검색</button>
	        </form>
        </div>
        
  		<div class="nav navbar-nav navbar-right" >
     	 <button type="button" class="navbar-right navbar-toggler" aria-expanded="false" data-toggle="collapse" data-target="#navbarNav2">
    	   <span class="navbar-toggler-icon"></span>
    	 </button>
	 	</div>
	 	
<div class="nav navbar-nav navbar-right collapse navbar-collapse" id="navbarNav2" > 
	<div> <!-- 묶기 -->
	 	<button type="button" class="btn btn-light navbar-btn mr-2" onclick="location.href='${path}/list'">
	 	<i class="material-icons">create</i>취뽀게시판</button>
		<button type="button" id="loginmd" class="btn btn-dark navbar-btn " data-toggle="modal" data-target="#loginModal" >
	 	<i class="material-icons ">account_circle</i> <b>Login</b></button>
		  
	
	 	<div class="btn-group usermodal mr-2"><!--usermodal 시작 -->
        <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    		 <b id="ucon">${name} </b>
    		 <i class="material-icons" style="text:35px">face</i>
        </button>
        <ul class="dropdown-menu text-center" role="menu">
            <li id="preauth"><a href="#"><b>정회원 인증</b></a></li>
            <li id="admauth"><a href="#"><b>관리모드</b></a></li>
            <li><a href="myPage_menu"><b>마이페이지</b></a></li>
            <li><a href="logout"><b>로그아웃</b></a></li>
        </ul>
	   </div><!--usermodal 끝 -->
	</div> <!-- 묶기 끝 -->
</div>

	</div>
   </nav>
</header> <!-- 헤더 고정 태그 끝 --> 

	



<!-- 모달 div -->
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" >
    <div class="modal-dialog loginmodal-dialog">
        <div class="modal-content loginmodal-content">
            <div class="modal-header loginmodal-header">
                <h5 class="modal-title loginmodal-title">LOGIN</h5>
                <button type="button" id="close lmclose" class="close lmclose" data-dismiss="modal" aria-hidden="true" style="color:#F5F5F5">×
                </button>
            </div>
            <div class="modal-body loginmodal-body">

            </div>
            <div class="modal-footer loginmodal-footer">
                <button id="login" class="btn btn-light"><i class="material-icons">account_circle</i>&nbsp 로그인</button>
                <button id="signup" class="btn btn-light "><i class="material-icons">how_to_reg</i>&nbsp 회원가입</button>
                <button id="pwfind" class="btn btn-light"><i class="material-icons">help</i>&nbsp 비밀번호를 잊으셨습니까?</button>
            </div>
        </div>
    </div>
</div>
<!-- 모달 div 끝 -->

<br/>
<br/>

<script>

var grade = $('#grade').val(); 
$('#preauth').css("display", "block");  
 $('#admauth').css("display", "none");  
 	if(grade==1){
 	$('#preauth').css("display", "none");  
	 $('#admauth').css("display", "block");  
	}

	


    $("#loading-bar").hide(); // 평상시 감춤


    //로그인 후 유저 이름표시
    if ($('#name').val() == 'null') {
        $("#ucon").hide();
    }
    if ($('#name').val() != 'null') {
        $("#ucon").show();
    }

    // 세션이 있을시 로그인 메뉴를 감추고 회원메뉴를 show
    if ($('#session').val() == 'null') {
        $(".usermodal").hide();
        $("#loginmd").show();
    }
    if ($('#session').val() != 'null') {
        $(".usermodal").show();
        $("#loginmd").hide();
    }

    //최초 modal-body에 로드되는 로그인 페이지
    $("#loginModal").on("show.bs.modal", function () {
        $(".loginmodal-body").load("login");
        $('.loginmodal-title').html('<i class="material-icons mt-1">account_circle</i>&nbsp Login');
        $("#login").hide();
        $("#signup").show();
        $("#pwfind").show();
    });

    //클릭시 modal-body에 해당 url로드
    $("#login").click(function () {
    	$('.loginmodal-title').empty();
		$('.loginmodal-title').html('<i class="material-icons mt-1">account_circle</i>&nbsp Login');
        $(".loginmodal-body").load("login");
    });

    $("#signup").click(function () {
    	$('.loginmodal-title').empty();
		$('.loginmodal-title').html('<i class="material-icons mt-1">how_to_reg</i>&nbsp Sign-Up');
        $(".loginmodal-body").load("signup");
    });

    $("#pwfind").click(function () {
      	$('.loginmodal-title').empty();
		$('.loginmodal-title').html('<i class="material-icons mt-1">help</i>&nbsp Forgot Your Password?');
        $(".loginmodal-body").load("pwfind");
    });
  
    // modal-footer
    $("#login").click(function () {
        $("#login").hide();
        $("#signup").show();
        $("#pwfind").show();
    });

    $("#signup").click(function () {
        $("#login").show();
        $("#signup").hide();
        $("#pwfind").show();
    });

    $("#pwfind").click(function () {
        $("#login").show();
        $("#signup").show();
        $("#pwfind").hide();
    });

    
    
</script>
