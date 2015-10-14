<%@page import="controllers.ReadFiles"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.ArrayList"%>
<%
    String tolerance1 = "5";
    String tolerance2 = "5";
    String tolerance3 = "5";
    String tolerance4 = "5";
    String tolerance52 = "5";
    String tolerance51 = "5";
    try {
            tolerance1 = request.getParameter("tol1");
            tolerance2 = request.getParameter("tol2");
            tolerance3 = request.getParameter("tol3");
            tolerance4 = request.getParameter("tol4");
            tolerance51 = request.getParameter("tol51");
            tolerance52 = request.getParameter("tol52");
            String pageNext = request.getParameter("p");
            String path = request.getParameter("c");
            session.setAttribute("pageChoosen", path+""+pageNext+ReadFiles.START_PATH_SEPARATOR);
        } catch (Exception e) {
        }
    
    // choose multiple files
    try {
        ArrayList<String> files = new ArrayList<String>();
        ArrayList<String> files2 = new ArrayList<String>();
        for (int i = 0; i < ReadFiles.NUM_OF_FILES; i++) {
            try {
                String file = request.getParameter("cbx_"+i).split("\\|")[2];
                if (file != null) {
                    //System.out.println(file);
                    files.add(file);
                }
            } catch (Exception e) {
            }
            try {
                String file2 = request.getParameter("cbx2_"+i).split("\\|")[2];
                String color2 = request.getParameter("color_"+i);
                if (file2 != null) {
                    //System.out.println(file2+"|"+color2);
                    files2.add(file2+"|"+color2);
                }
            } catch (Exception e) {
            }
        }
        if (files.size() > 0 && files2.size() > 0) {
            ArrayList<ArrayList<String>> excels = new ArrayList<ArrayList<String>>();
            ArrayList<String> others = new ArrayList<String>();
            others.add(tolerance1);
            others.add(tolerance2);
            others.add(tolerance3);
            others.add(tolerance4);
            others.add(tolerance51);
            others.add(tolerance52);
            excels.add(files);
            excels.add(files2);
            excels.add(others);
            session.setAttribute("fileExcel", excels);
            session.setAttribute("url_content", "welding11/graph.jsp");
            session.setAttribute("url_menu", "menu/menuAdmin.jsp");
            session.setAttribute("url_stat", 2);
            response.sendRedirect("../index.jsp");
        } else {
            //session.setAttribute("fileExcel", "");
            session.setAttribute("url_content", "welding11/mainMenu.jsp");
            session.setAttribute("url_menu", "menu/menuAdmin.jsp");
            session.setAttribute("url_stat", 2);
            response.sendRedirect("../index.jsp");
        }
    } catch (Exception e) {
    }
    
//    try {
//        // terima fail
//        String file = request.getParameter("j");
//        if (file != null) {
//            session.setAttribute("fileExcel", file);
//            session.setAttribute("url_content", "welding11/graph.jsp");
//                session.setAttribute("url_menu", "menu/menuAdmin.jsp");
//                session.setAttribute("url_stat", 2);
//                response.sendRedirect("../index.jsp");
//        } else {
//            session.setAttribute("fileExcel", "");
//            session.setAttribute("url_content", "welding11/mainMenu.jsp");
//                session.setAttribute("url_menu", "menu/menuAdmin.jsp");
//                session.setAttribute("url_stat", 2);
//                response.sendRedirect("../index.jsp");
//        }
//    } catch (Exception e) {
//    }
    
    
    %>