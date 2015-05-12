/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author End User
 */
public class SessionWIS {
    private static int uId;
    private static String staffNo;
    private static String fullname;
    private static String username;
    private static String password;
    private static int status;
    private static int utId;
    private static String utDesc;
    private static boolean loggedIn;

    public static int getuId() {
        return uId;
    }

    public static void setuId(int auId) {
        uId = auId;
    }

    public static String getStaffNo() {
        return staffNo;
    }

    public static void setStaffNo(String aStaffNo) {
        staffNo = aStaffNo;
    }

    public static String getFullname() {
        return fullname;
    }

    public static void setFullname(String aFullname) {
        fullname = aFullname;
    }

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String aUsername) {
        username = aUsername;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String aPassword) {
        password = aPassword;
    }

    public static int getStatus() {
        return status;
    }

    public static void setStatus(int aStatus) {
        status = aStatus;
    }

    public static int getUtId() {
        return utId;
    }

    public static void setUtId(int aUtId) {
        utId = aUtId;
    }

    public static String getUtDesc() {
        return utDesc;
    }

    public static void setUtDesc(String aUtDesc) {
        utDesc = aUtDesc;
    }

    public static boolean isLoggedIn() {
        return loggedIn;
    }

    public static void setLoggedIn(boolean aLoggedIn) {
        loggedIn = aLoggedIn;
    }
}
