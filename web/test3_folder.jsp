<%@page import="controllers.ListFilesUtil"%>
<%@page import="java.util.ArrayList"%>
<%
  
    ListFilesUtil lfu = new ListFilesUtil();
    ArrayList<String> files = lfu.listFiles2(ListFilesUtil.PATH_FOLDER);
    
    for (int i = 0; i < files.size(); i++) {
        out.print( files.get(i) + "<br />" );
    }
    
%>
