/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import helpers.J;
import helpers.S;
import java.sql.ResultSet;
import models.DBConn;
import models.Query;
import models.User;

/**
 *
 * @author End User
 */
public class Login {
    public boolean isLogin(String username, String password) {
        boolean stat = false;
        DBConn dBConn = new DBConn();
        //SessionWIS.setLoggedIn(false);
        try {
            if(dBConn.getConn().isClosed()) {
                stat = false;
            } else {
                ActiveDirectory activeDirectory = new ActiveDirectory();
                boolean statAD = activeDirectory.authenticate(username, password);
                if (statAD) {
                    User user = new User();
                    ResultSet rs = user.getUser(username);
                    if (rs.next()) {
                        stat = true;
//                    SessionWIS.setuId(rs.getInt(1));
//                    SessionWIS.setStaffNo(rs.getString(2));
//                    SessionWIS.setFullname(rs.getString(3));
//                    SessionWIS.setUsername(rs.getString(4));
//                    SessionWIS.setPassword(rs.getString(5));
//                    SessionWIS.setStatus(rs.getInt(6));
//                    SessionWIS.setUtId(rs.getInt(7));
//                    SessionWIS.setUtDesc(rs.getString(8));
//                    SessionWIS.setLoggedIn(stat);
                    } else {
                        stat = false;
                    }
                } else {
                    stat = false;
                }
            }
        } catch (Exception e) {
            stat = false;
            System.out.println("Login 52: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public void setLogout() {
//        SessionWIS.setuId(0);
//        SessionWIS.setStaffNo("");
//        SessionWIS.setFullname("");
//        SessionWIS.setUsername("");
//        SessionWIS.setPassword("");
//        SessionWIS.setStatus(0);
//        SessionWIS.setUtId(0);
//        SessionWIS.setUtDesc("");
//        SessionWIS.setLoggedIn(false);
    }
    
    public int getUserType(String username, String password) {
        int utid;
        DBConn dBConn = new DBConn();
        try {
            if(dBConn.getConn().isClosed()) {
                utid = 0;
            } else {
                User user = new User();
                ResultSet rs = user.getUser(username);
                if(rs.next()) {
                    utid = rs.getInt("ut_id");
                } else {
                    utid = 0;
                }
            }
        } catch (Exception e) {
            utid = 0;
            System.out.println("Login 90: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Login 95: "+e.getMessage());
        }
        return utid;
    }
}
