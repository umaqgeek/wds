<%@page import="controllers.ReadFiles"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<ArrayList<String>> alldata = new ArrayList<ArrayList<String>>();
    ArrayList<String> files = new ArrayList<String>();
    ArrayList<String> files2 = new ArrayList<String>();
    ArrayList<String> others = new ArrayList<String>();
    
    try {
        alldata = (ArrayList<ArrayList<String>>) session.getAttribute("fileExcel");
        files = alldata.get(0);
        files2 = alldata.get(1);
        others = alldata.get(2);
    } catch (Exception e) {
    }
    
    try {
        String tt = request.getParameter("tt");
        for (int i = 0; i < files.size(); i++) {
            if (files.get(i).split(ReadFiles.START_PATH_SEPARATOR)[files.get(i).split(ReadFiles.START_PATH_SEPARATOR).length-1].equals(tt)) {
                files.remove(i);
            }
        }
    } catch (Exception e) {
    }
    
    try {
        String tt2 = request.getParameter("tt2");
        for (int i = 0; i < files2.size(); i++) {
            if (files2.get(i).split(ReadFiles.START_PATH_SEPARATOR)[files2.get(i).split(ReadFiles.START_PATH_SEPARATOR).length-1].equals(tt2)) {
                files2.remove(i);
            }
        }
    } catch (Exception e) {
    }
    
    try {
        String delete = request.getParameter("all");
        if (delete.equals("1") || delete.equals("2")) {
            if (delete.equals("1")) {
                files.removeAll(files);
            }
            if (delete.equals("2")) {
                files2.removeAll(files2);
            }
        }
    } catch (Exception e) {
    }
    
    try {   
        ArrayList<ArrayList<String>> excels = new ArrayList<ArrayList<String>>();
        excels.add(files);
        excels.add(files2);
        excels.add(others);
        session.setAttribute("fileExcel", excels);
    } catch (Exception e) {        
    }
%>