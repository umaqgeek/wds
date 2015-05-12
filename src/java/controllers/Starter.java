/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author End User
 */
public class Starter {
    private static String url_content;
    private static String url_menu;
    private static int url_stat = 1;
    private static String error = "";
    private static String success = "";

    public static String getUrl_content() {
        return url_content;
    }

    public static void setUrl_content(String aUrl_content) {
        url_content = aUrl_content;
    }

    public static String getUrl_menu() {
        return url_menu;
    }

    public static void setUrl_menu(String aUrl_menu) {
        switch(SessionWIS.getUtId()) {
            case 1:
                aUrl_menu = "menu/menuAdmin.jsp";
                break;
            case 2:
                aUrl_menu = "menu/menuQcInspector.jsp";
                break;
            default:
                aUrl_menu = "menu/menuAdmin.jsp";
                break;
        }
        url_menu = aUrl_menu;
    }

    public static int getUrl_stat() {
        return url_stat;
    }

    public static void setUrl_stat(int aUrl_stat) {
        url_stat = aUrl_stat;
    }

    public static String getError() {
        String e = error;
        Starter.setError("");
        return e;
    }

    public static void setError(String aError) {
        error = aError;
    }
    
    public static String getSuccess() {
        String s = success;
        Starter.setSucces("");
        return s;
    }

    public static void setSucces(String aSuccess) {
        success = aSuccess;
    } 
}
