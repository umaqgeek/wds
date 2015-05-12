/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import controllers.Starter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author End User
 */
public class User {
    public ResultSet getUser(String username) {
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "u.u_id, u.u_staffno, u.u_fullname, u.u_username, "
                    + "u.u_password, u.u_status, ut.ut_id, ut.ut_desc");
            query.from(query, "user u, user_type ut");
            query.where(query, "ut.ut_id = u.ut_id "
                    + "AND u.u_username = ? ");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setString(1, username);
            query.setRs(query.getPs().executeQuery());
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("User 31: "+ex.getMessage());
        }
//        try {
//            dBConn.getConn().close();
//        } catch (Exception e) {
//            System.out.println("User 36: "+e.getMessage());
//        }
        return query.getRs();
    }
    
    public ArrayList<ArrayList<String>> getAll() {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "u.u_id, " //0
                    + "u.u_staffno, " //1
                    + "u.u_fullname, " //2
                    + "u.u_username, " //3
                    + "u.u_password, " //4
                    + "u.u_status, " //5
                    + "ut.ut_id, " //6
                    + "ut.ut_desc"); //7
            query.from(query, "user u");
            query.join(query, "user_type ut", "ut.ut_id = u.ut_id", "left");
            query.order_by(query, "u.u_fullname", "ASC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 1; i <= 8; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("User 68: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("User 73: "+e.getMessage());
        }
        return data;
    }
    
    public ArrayList<String> get(int u_id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "u.u_id, " //0
                    + "u.u_staffno, " //1
                    + "u.u_fullname, " //2
                    + "u.u_username, " //3
                    + "u.u_password, " //4
                    + "u.u_status, " //5
                    + "ut.ut_id, " //6
                    + "ut.ut_desc"); //7
            query.from(query, "user u");
            query.join(query, "user_type ut", "ut.ut_id = u.ut_id", "left");
            query.where(query, "u.u_id = ?");
            query.order_by(query, "u.u_fullname", "ASC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, u_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= 8; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("User 105: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public boolean delete(int u_id, int uu_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "user");
            query.where(query, "u_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), uu_id);
            query.getPs().setInt(1, u_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("User 128: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean edit(int u_id, ArrayList<String> column, 
            ArrayList<String> data, ArrayList<Integer> tanda, int uu_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.update(query, "u_id", "user", column);
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), uu_id);
            for(int i = 0; i < data.size(); i++) {
                switch(tanda.get(i)) {
                    case 1:
                        query.getPs().setString((i+1), data.get(i));
                        break;
                    case 2:
                        query.getPs().setInt((i+1), Integer.parseInt(data.get(i)));
                        break;
                    default:
                        query.getPs().setString((i+1), data.get(i));
                        break;
                }
            }
            query.getPs().setInt(data.size()+1, u_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            String str_error = e.getMessage();
            if(str_error.contains("Duplicate")) {
                Starter.setError("That username has already exist!");
            }
            System.out.println("User 167: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean add(ArrayList<String> column, ArrayList<String> data, 
            ArrayList<Integer> tanda, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.insert(query, "user", column);
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            for(int i = 0; i < data.size(); i++) {
                switch(tanda.get(i)) {
                    case 1:
                        query.getPs().setString((i+1), data.get(i));
                        break;
                    case 2:
                        query.getPs().setInt((i+1), Integer.parseInt(data.get(i)));
                        break;
                    default:
                        query.getPs().setString((i+1), data.get(i));
                        break;
                }
            }
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            String str_error = e.getMessage();
            if (str_error.contains("Duplicate")) {
                Starter.setError("That username has already exist!");
            }
            System.out.println("User 205: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
}
