<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.File,java.util.*" %>

<%@ page import="java.net.*" %>


<%
//checkout if is login
boolean isLogin = false;
Cookie cookie = null;
Cookie[] cookies = null;
// 获取cookies的数据,是一个数组
cookies = request.getCookies();
if( cookies != null ){
  for (int i = 0; i < cookies.length; i++){
     cookie = cookies[i];
            if(cookie.getName().equals("name")){ //要用equals  坑坑坑。。。。。printDebug很蠢！！！！！
                  isLogin = true;
          }
     } 
}

//如果没有登录，就跳转到登录页面
if(!isLogin)
  {
     String site = new String("http://localhost:8080/cloud/login.html");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
     response.setHeader("Location", site);
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <title>login</title>
  <style>

      li span{
      color: dodgerblue;
      }
      li span:hover{
      color:steelblue;
      }
  </style>
</head>
<body>

<div class="container">
    <form>
        <div class="form-group">
          <label for="exampleInputFile">File input</label>
          <input type="file" id="exampleInputFile">
        </div>
        <button type="submit" class="btn btn-default">上传文件</button>
    </form>

    <div class="container">
        <%
        String pathName ="/usr/local/apache-tomcat-8.5.29/webapps/cloud/files";

        File dirFile = new File(pathName);

        String[] fileList = dirFile.list();

        for (int i = 0; i < fileList.length; i++) {

             out.println("<li>" + fileList[i] + "<span>下载</span></li>");

        };
        %>
    </div>
</div>

</body>
</html>