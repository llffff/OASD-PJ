<%@page import="com.Model.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import=" com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pics Store | My Message</title>
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<link href="css/index_css.css" rel="stylesheet">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

<% 
request.setCharacterEncoding("UTF-8");

if(session.getAttribute("localuser") == null){
	response.sendRedirect("./login.jsp");
}else{
	
}
ArrayList<TravelUser> users = null;
//查找user界面
if(request.getAttribute("uncheckedMessageList") == null)
	System.out.println("uncheckedMessageList is null");
else
	users = (ArrayList<TravelUser>)request.getAttribute("uncheckedMessageList");

System.out.println("");
System.out.println("=================>users!");
System.out.println(users);
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
				<li><a href="index.nav" class="navbar-brand"> 首页 </a></li>
				<li><a href="search.nav" class="navbar-brand"> 搜索 </a></li>
				<li><a href="#" class="navbar-brand" id="this_page"> 我的消息 </a></li>
			</ul>

			<!--right nav account-->
			<% if (session.getAttribute("localuser") != null) { %>
			

			<ul class="nav navbar-nav nav-pills navbar-right" id="navbar-1">
				 <li> 
				 
				<form class="bs-example bs-example-form" role="form" method="get" style="margin-top:10px;width:200px" action="./searchUser.pers">
					<div class="input-group input-group-sm">
						<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
						<input type="text" name="searchInfo" class="form-control" placeholder="Search User" value="${ searchInfo }">
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
		<div class="row">
        <!--左侧边栏，包括一个搜索栏和三个热门栏-->
        <aside class="col-sm-3 col-xs-12 left_aside" id="left_aside">
			<!-- 左邊邊欄的row佈局 -->
            <div class="row">
            	<!-- 左上角用戶框 -->
                <div class="col-xs-12">
           		    <table class="table table-bordered table-hover">
	                    <thead><tr><th>Local User</th></tr></thead>
	                    <tbody>
	                        <tr><td>
	                            <div  class="block-center">
	                        	<span class="glyphicon glyphicon-user" style="font-size:50px"> </span> 
            	<% 
            	Map<String,String> localuser = null;
            	if(session.getAttribute("localuser") != null){
            		localuser = (Map<String,String>)session.getAttribute("localuser"); 
           		%>
           						<span class="username-search">
	                        	${ localuser.get("username") }
	                        	</span>
	                            <hr/>
	                            </div><!-- end center block -->
	                            </td></tr>
	                            <div><!-- end 多余的div -->
	                            <tr><td>
	                            > Email: ${ localuser.get("email") }
	                            </td></tr>
	                            <tr><td>
	                            > UserId:  ${ localuser.get("uid") }
	                            </td></tr>
	                            
	                            <tr><td>
	                            > State: ${ localuser.get("state") }
	                            </td></tr>
	          
	                            <tr><td><!-- end 多余的 -->
	                            <a href="./myfavourite.pers" class="full-length btn btn-default">
	                            		我的收藏
	                            </a>
	                            <a href="./mypics.pers" class="full-length btn btn-default">
	                            		我的图片
	                            </a>
	                            <a href="./myfriends.pers"  class="full-length btn btn-default">
	                            		我的好友	
	                            </a>
	                            
	                             <a href="./mymessage.pers"  class="full-length btn btn-default">
	                            		我的消息	
	                            </a>
            	<% }else{ %>
	                        	<p> <a href='./login.jsp' class=''>未登录</a></p>
	                            <hr/>
	                            <h6><a href='./login.jsp' class=''>点击登录</a></h6>
								

				<% } %>
	                            </div><!-- d多余的div 为了end block-center -->
	                        </td></tr>
	                    </tbody>
                    </table>
                    </div><!-- end table外的col-12 -->

            		
<% 
if(session.getAttribute("myTrack") != null){
	System.out.println("==================================my Strack========================================");
MyTrack myTrack = (MyTrack)session.getAttribute("myTrack");
StringBuffer str = new StringBuffer();
for(int  i =0 ; i < myTrack.getLengthOfId();i++){
    str.append(myTrack.byIndex(i));
}
%>
					<div class="col-xs-12">
						<table class="table table-bordered table-hover">
							<thead><tr>
                				<th> <sapn class="glyphicon glyphicon-transfer"></sapn> User Track</th>
            				</tr></thead>
							<tbody>
					                <%
					               out.println(str);
					               %>
					        </tbody>
						
						</table>
					</div>
					                <%
}
					               %>






            		
            		


			</div><!-- end 左邊邊欄内部row -->
		</aside><!-- end 左邊邊欄 -->
		
		
	 	<!--右侧内容区，包括filter和图片结果显示-->
        <div class="col-sm-9 col-xs-12">
            <div class="row">
                <div class="col-xs-12">
                    <!--筛选器-->
                    <div class="panel panel-default">
                   
                        <div class="panel-heading">
                        	<span class="glyphicon glyphicon-envelope"></span> Unchecked Messages 
                        </div>
                  
                        <div class="panel-body">
                            <div id="images" class="row">
<% 
if(request.getAttribute("uncheckedMessageList") != null){
    for(int i = 0 ; i < users.size() ; i++){ 
    	TravelUser user = users.get(i);
    
%>
						<div class="col-xs-12">
							<article class="">
							        <div class="col-xs-9 user-description">
							
							            <h3><%= user.getUsername() %></h3>
							            <p> > Email: <%= user.getEmail() %> </p>
							            <p> > Register time: <%= user.getDateJoinedStr() %> </p>
							
							        </div>
							        <div class="col-xs-3" style="padding:10px;margin-top:20px">
							
										<p>
							            <a href="./userpics.pers?uid=<%= user.getUserID() %>" class="btn btn-default full-length">
							                <span class="glyphicon glyphicon-picture"></span> His/Her Pictures
							            </a>
										</p><p>
							           
							            <button class="btn btn-default full-length btn-danger" type="button" id="btReceive_<%= user.getUserID() %>"
							                onclick=receiver("<%=  user.getUserID() %>")>
							                <span class="glyphicon glyphicon-plus"></span> Receive
							            </button>
							            
							            <button class="btn btn-default full-length" type="button" id="btRefuse_<%= user.getUserID() %>"
							                onclick=refuser("<%=  user.getUserID() %>")>
							                <span class="glyphicon glyphicon-minus"></span> Refuse
							            </button>
							            </p>
							
							            <script>
							            var toUID = "<%= localuser.get("uid") %>";
							                $(function () {
							
							                });
							                function receiver(fromUID) {
							                    console.log("before post");
							                    $.post(
							                        "./receiver.do",
							                        { "fromUID": fromUID , "toUID": toUID },
							                        function (data) {
							                            //if state == 1//操作成功，成为了好友，变绿//变成查看对方的favourite，并删除refuser
							                            if(data == 1){
								                            var btReceive = document.getElementById("btReceive_" + fromUID);
								                            btReceive.innerHTML = "<span class='glyphicon glyphicon-ok-circle'></span> Reveived";
								                            btReceive.className = "btn btn-default full-length btn-success";
								                            btReceive.disabled = "disabled";//ok
								                            
							                            	
								                            var btRefuse = document.getElementById("btRefuse_" + fromUID);
								                            btRefuse.outerHTML = "";
							                            }
							                            else
							                            console.log("failed to receive!");
							                            console.log(data);
							                        }
							                    );
							                }
							                function refuser(fromUID) {
							                    console.log("before post");
							                    $.post(
							                        "./refuser.do",
							                        { "fromUID": fromUID , "toUID": toUID },
							                        function (data) {
							                            //if state == 1
							                            //操作成功,删除了信息，变绿
							                            //删除receiver 按钮，保留一个pic和disabled的,属性到button
							                            if(data == 1){
								                            var btRefuse = document.getElementById("btRefuse_" + fromUID);
								                            btRefuse.outerHTML = "<button class=\"btn btn-success full-length\" disabled type=\"button\">"+
											                "<span class=\"glyphicon glyphicon-ok-circle\"></span> Refuse</button>";
							                            	
								                            var btReceive = document.getElementById("btReceive_" + fromUID);
								                            btReceive.outerHTML = "";
								                           
							                            }
							                            else
							                            console.log("failed to refuse!");
							                            console.log(data);
							                        }
							                    );
							                }
							            </script>
							        </div>
							    </article>
							   </div>
<%
     }
 } %>
 
 
 
 <% 
if( users.size() == 0){
 %>
<div class="block-center">
<p> 没有新消息 </p>
</div>
	 
 <% } %>
                    
                            </div><!-- end images -->
                            
                            
                            <!-- 页码 -->
                   <% 
                   //int totalPage = (int)request.getAttribute("totalPage");
                   //int currentPage = (int)request.getAttribute("currentPage");

                   //int nextPage = (int)request.getAttribute("nextPage");
                   //int previousPage = (int)request.getAttribute("previousPage");
                   	//System.out.println(totalPage);
                   	//System.out.println(currentPage);
                   	//System.out.println(nextPage);
                   	//System.out.println(nextPage);
                   %>
                            <div class="page_number">
							    
							</div><!--  end page number -->

                        </div>
                    </div>
                </div>
                
                
            </div><!-- end row -->
        </div><!-- end pane -->
	</div><!-- end 全局row -->

		</section>
		
	

<!--普通页脚-->
<footer class="bottom_footer">
    <div class="row">
        <div class="col-xs-12">
            Copyright © 2020 lff, Inc.
        </div>
    </div>
</footer>

</body>
</html>