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
        
        try {
            String file = request.getParameter("cbx_x").split("\\|")[2];
            if (file != null) {
                files.add(file);
            }
        } catch (Exception e) {
        }
        
        try {
            String file2 = request.getParameter("cbx2_x").split("\\|")[2];
            String color2 = request.getParameter("color_x");
            if (file2 != null) {
                files2.add(file2+"|"+color2);
            }
        } catch (Exception e) {
        }
        
        // remove redundancy files1
        ArrayList<String> f1 = new ArrayList<String>();
        for (String temp: files) {
            boolean isNotExist = true;
            for (String temp2: f1) {
                if (temp.split(ReadFiles.START_PATH_SEPARATOR)[temp.split(ReadFiles.START_PATH_SEPARATOR).length-1].equals(temp2.split(ReadFiles.START_PATH_SEPARATOR)[temp2.split(ReadFiles.START_PATH_SEPARATOR).length-1])) {
                    isNotExist = false;
                }
            }
            if (isNotExist) {
                f1.add(temp);
            }
        }
        
        // remove redundancy files2
        ArrayList<String> f2 = new ArrayList<String>();
        for (String temp3: files2) {
            boolean isNotExist2 = true;
            for (String temp4: f2) {
                if (temp3.split(ReadFiles.START_PATH_SEPARATOR)[temp3.split(ReadFiles.START_PATH_SEPARATOR).length-1].equals(temp4.split(ReadFiles.START_PATH_SEPARATOR)[temp4.split(ReadFiles.START_PATH_SEPARATOR).length-1])) {
                    isNotExist2 = false;
                }
            }
            if (isNotExist2) {
                f2.add(temp3);
            }
        }
        
        if (f1.size() > 0 || f2.size() > 0) {
            ArrayList<ArrayList<String>> excels = new ArrayList<ArrayList<String>>();
            excels.add(f1);
            excels.add(f2);
            excels.add(others);
            session.setAttribute("fileExcel", excels);
        }
        
    } catch (Exception e) {
    }    
%>