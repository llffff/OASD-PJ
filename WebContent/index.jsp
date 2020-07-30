<%@page import="com.Model.Image"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import=" com.DAO.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pics Store | 主页</title>
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<link href="css/index_css.css" rel="stylesheet">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

<% 

request.setCharacterEncoding("UTF-8");
if(request.getAttribute("carousel") == null){
	response.sendRedirect("./index.nav");
	
}else{
%>
<!--top navigation-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-001">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbar-001">
			
			<!--left nav bar-->
			<ul class="nav navbar-nav nav_menu">
				<li>
					<a class="navbar-brand" href="#">
						<span class="website_title" title="Pics Store">Pics Store</span>
					</a>
				</li>
				<li><a href="index.nav" class="navbar-brand" id="this_page"> 首页 </a></li>
				<li><a href="search.nav" class="navbar-brand"> 搜索 </a></li>
			</ul>

			<!--right nav account-->
			<% if (session.getAttribute("localuser") != null) { %>
			<ul class="nav navbar-nav nav-pills navbar-right" id="navbar-1">
				<li> 
				 
			  	<form class="bs-example bs-example-form" role="form" method="get" style="margin-top:10px;width:200px" action="./searchUser.pers">
						<div class="input-group input-group-sm">
							<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
							<input type="text" name="searchInfo" class="form-control" placeholder="Search User">
						</div>
				</form>
				
			 	</li>
				<li class="dropdown"><a class="dropdown-toggle nav-title"
					data-toggle="dropdown" href="#" role="button"> </span> ${localuser.get("username")}<b class="caret"> </b>
				</a> <!--下拉菜单-->
					<ul class="dropdown-menu" id="login_menu">
						<li><a class="green" href="#"><span
								class="glyphicon glyphicon-user"> </span> ${localuser.get("username")}</a></li>
						<li class="divider"></li>
						<li><a href="./upload.pers"><span
								class="glyphicon glyphicon-cloud-upload"> </span> 上传 </a></li>
						<li><a href="./mypics.pers"> <span
								class="glyphicon glyphicon-picture"> </span> 我的图片
						</a></li>
						<li><a href="./myfavourite.pers"> <span
								class="glyphicon glyphicon-star"> </span> 我的收藏
						</a></li>
						<li><a href="./myfriends.pers"> <span
								class="glyphicon glyphicon-comment"> </span> 我的好友
						</a></li>
						<li class="divider"></li>
						<li><a href="./logoutServlet"> <span
								class="glyphicon glyphicon-user"> </span> 登出
						</a></li>
					</ul></li>
			</ul>
			<% } else { %>
			<!--right2 nav account-->
			<ul class="nav navbar-nav navbar-right" id="navbar-2">
				<li><a href="./login.jsp" role="button"> <span
						class="glyphicon glyphicon-user"> 登入 </span></a></li>
			</ul>
			<% } %>
		</div>

	</nav>

	<!--右下固定悬浮按钮-->
	<div class="float_button">
		<ul>
			<li title="alert" onclick="location.reload();"><span
				class="glyphicon glyphicon-repeat"></span></li>
			<li title="page up"><a href="#pageup"><span
					class="glyphicon glyphicon-arrow-up"></span></a></li>
		</ul>
	</div>



	<section id="pageup">

   		<% ArrayList<Image> carouselImages = (ArrayList<Image>)request.getAttribute("carousel"); %>
   		
   		
	    <!--carousel-->
	    <% //div id="header-pic"%>
	    	<div id="carousel-example-generic" class="carousel slide header-pic" data-ride="carousel">
	    		<!-- Indicators -->
    			<ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<% for(int i = 1 ; i<carouselImages.size(); i++){ %>
			        <li data-target="#carousel-example-generic" data-slide-to="<%= i %>"></li>
				<% } %>    			
    			</ol>
	    	    <!--轮播项目-->
    		    <div class="carousel-inner" role="listbox">
    		    <% for( int i = 0 ; i<carouselImages.size();i++) { %>
    		    	<div class="item <% if(i==0) {%> active <% } %>">
    		    		<a href="./details.nav?id=<%= carouselImages.get(i).getImageID() %>" data-toggle="tooltip" 
			               data-placement="top" title="ImageID: <%= carouselImages.get(i).getImageID() %> ">
    		    			<img src="travel-images/large/<%= carouselImages.get(i).getPath() %>" alt="00<%= (i+1) %>">
    		    		</a>
    		    		<div class="carousel-caption">
    		    			<%= carouselImages.get(i).getTitle()+": <br>" %>
    		    			
    		    			<%= carouselImages.get(i).getDescription() %>
    		    		</div>
   		    		</div>
    		    <% } %>
    		    
    		    </div>
	    		
	    		<!-- Controls -->
    			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
    			</a>	
			    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			    </a>
	    	
	    	</div>
	    <%//div> %>
	
	    <!--images-->
	    <div class="pics_windows">
	        <!-- 1pic/article; 3pics/row; 2row totally-->
	        <div class="row">
	        
 			<% List<Image> showImages= (List<Image>)request.getAttribute("show"); %>
	    	  
	     	<% for(Image i : showImages){ %>
	      		<div class="col-lg-3 col-sm-4 col-xs-6">
			    	<article>
			        <div class="image_container">
			            <a href="./details.nav?id=<%= i.getImageID() %>" data-toggle="tooltip" 
			            	data-placement="top" title="ImageID: <%= i.getImageID() %> ">
			                <img src="travel-images/square-medium/<%= i.getPath() %>" class="image_self"></a>
			        </div>
			        <header class='image_description'>
			            <p class='h3 index-latest-img-title' data-toggle='tooltip' data-placement="top" title="<%= i.getTitle() %>">
			                <%= i.getTitle() %>
			            </p>
			            <p class='hei' data-toggle='tooltip' data-placement='top' title="<%= i.getUser().getUsername() %>">
				               via: <%= i.getUser().getUsername() %>
				               <span class="footer-time"><%= i.getDateUploadStr() %></span>
			            </p>
			        </header>
			
			    	</article>
				</div>
	      		
	      		
	      	<% } %>
			</div>
	    </div>
	</section>




<!--完整的脚注和版权信息-->
<footer class="bottom_footer">
    <div class="row">
        <div class="">
            <span class="website_title" title="Pics Store">Pics Store</span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3 "></div>
        <div class="col-xs-3 ">
            <span class="copyright">Copyright © 2020 lff, Inc. </span>
        </div>
        <div class="col-xs-3">
                <span class="footer_menu">
                    <ul>
                        <li>Privacy</li> |
                        <li>Help</li> |
                        <li>Contact</li> |
                        <li><a href="http://www.github.com/llffff">Blog</a></li>
                    </ul>
                </span>
        </div>
        <div class="col-xs-3 "></div>
    </div>

</footer>
<script>$(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>
<% } %>
</body>
</html>