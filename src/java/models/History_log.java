/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import controllers.Starter;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author End User
 */
public class History_log {
    public ArrayList<ArrayList<String>> getAll() {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "hl.hl_id, " //0
                    + "hl.u_id, " //1
                    + "u.u_staffno, " //2
                    + "u.u_fullname, " //3
                    + "u.u_username, " //4
                    + "u.u_password, " //5
                    + "u.u_status, " //6
                    + "u.ut_id, " //7
                    + "hl.hl_action, " //8
                    + "hl.hl_remarks, " //9
                    + "hl.hl_date"); //10
            query.from(query, "history_log hl");
            query.join(query, "user u", "u.u_id = hl.u_id", "left");
            query.order_by(query, "hl.hl_id", "DESC");
            query.limit(query, "500");
            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), 0);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for (int i = 1; i <= 11; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("History_log 47: "+ex.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<String> get(int hl_id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "hl.hl_id, " //0
                    + "hl.u_id, " //1
                    + "u.u_staffno, " //2
                    + "u.u_fullname, " //3
                    + "u.u_username, " //4
                    + "u.u_password, " //5
                    + "u.u_status, " //6
                    + "u.ut_id, " //7
                    + "hl.hl_action, " //8
                    + "hl.hl_remarks, " //9
                    + "hl.hl_date"); //10
            query.from(query, "history_log");
            query.join(query, "user u", "u.u_id = hl.u_id", "left");
            query.where(query, "hl.hl_id = ?");
            query.order_by(query, "hl.hl_id", "DESC");
            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, hl_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for (int i = 1; i <= 11; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("History_log 86: "+ex.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
        return data;
    }

    public boolean delete(int hl_id, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "history_log");
            query.where(query, "hl_id = ?");
            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, hl_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("History_log 109: "+e.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean deleteAll(int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "history_log");
            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), u_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("History_log 130: "+e.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
        return stat;
    }

    public boolean edit(int hl_id, ArrayList<String> column,
            ArrayList<String> data, ArrayList<Integer> tanda, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.update(query, "hl_id", "history_log", column);
            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), u_id);
            for (int i = 0; i < data.size(); i++) {
                switch (tanda.get(i)) {
                    case 1:
                        query.getPs().setString((i + 1), data.get(i));
                        break;
                    case 2:
                        query.getPs().setInt((i + 1), Integer.parseInt(data.get(i)));
                        break;
                    default:
                        query.getPs().setString((i + 1), data.get(i));
                        break;
                }
            }
            query.getPs().setInt(data.size() + 1, hl_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("History_log 166: "+e.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
        return stat;
    }

//    public boolean add(ArrayList<String> column, ArrayList<String> data,
//            ArrayList<Integer> tanda) {
//        boolean stat = false;
//        Query query = new Query();
//        try {
//            DBConn dBConn = new DBConn();
//            query.insert(query, "history_log", column);
//            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()), 0);
//            for (int i = 0; i < data.size(); i++) {
//                switch (tanda.get(i)) {
//                    case 1:
//                        query.getPs().setString((i + 1), data.get(i));
//                        break;
//                    case 2:
//                        query.getPs().setInt((i + 1), Integer.parseInt(data.get(i)));
//                        break;
//                    default:
//                        query.getPs().setString((i + 1), data.get(i));
//                        break;
//                }
//            }
//            query.getPs().execute();
//            stat = true;
//        } catch (Exception e) {
//            stat = false;
//            Starter.setError(e.getMessage());
//            e.printStackTrace();
//        }
//        return stat;
//    }
    
//    public boolean regLog(String ) {
//        boolean stat = false;
//        Query query = new Query();
//        try {
//            DBConn dBConn = new DBConn();
//            query.insert(query, "history_log", column);
//            query.setPs(query, dBConn.getConn2().prepareStatement(query.getSql()));
//            for (int i = 0; i < data.size(); i++) {
//                switch (tanda.get(i)) {
//                    case 1:
//                        query.getPs().setString((i + 1), data.get(i));
//                        break;
//                    case 2:
//                        query.getPs().setInt((i + 1), Integer.parseInt(data.get(i)));
//                        break;
//                    default:
//                        query.getPs().setString((i + 1), data.get(i));
//                        break;
//                }
//            }
//            query.getPs().execute();
//            stat = true;
//        } catch (Exception e) {
//            stat = false;
//            Starter.setError(e.getMessage());
//            e.printStackTrace();
//        }
//        return stat;
//    }
}
