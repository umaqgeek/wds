/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import controllers.Starter;
import helpers.Func;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author End User
 */
public class Query {
    private ResultSet rs;
    private PreparedStatement ps;
    private String sql = "";
    private int where = 0;
    private String action = "";
    
    public Query() {
        
    }
    
    public void select(Query query, String s) {
        action = "SELECT";
        query.setSql("SELECT "+s);
    }
    public void from(Query query, String f) {
        query.setSql(query.getSql()+" FROM "+f);
    }
    public void where(Query query, String w) {
        where += 1;
        if(where == 1) {
            query.setSql(query.getSql()+" WHERE "+w);
        } else {
            query.setSql(query.getSql()+" AND "+w);
        }
    }
    public void or_where(Query query, String w) {
        where += 1;
        if(where == 1) {
            query.setSql(query.getSql()+" WHERE "+w);
        } else {
            query.setSql(query.getSql()+" OR "+w);
        }
    }
    public void order_by(Query query, String col, String val) {
        query.setSql(query.getSql()+" ORDER BY "+col+" "+val);
    }
    public void limit(Query query, String l) {
        query.setSql(query.getSql()+" LIMIT "+l);
    }
    public void group_by(Query query, String g) {
        query.setSql(query.getSql()+" GROUP BY "+g);
    }
    public void insert(Query query, String table, ArrayList<String> column) {
        try {
            action = "INSERT "+table;
            query.setSql("INSERT INTO " + table + "(");
            for (int i = 0; i < column.size(); i++) {
                query.setSql(query.getSql() + column.get(i));
                if (i != column.size() - 1) {
                    query.setSql(query.getSql() + ",");
                }
            }
            query.setSql(query.getSql() + ") VALUES(");
            for (int i = 0; i < column.size(); i++) {
                query.setSql(query.getSql() + "?");
                if (i != column.size() - 1) {
                    query.setSql(query.getSql() + ",");
                }
            }
            query.setSql(query.getSql() + ") ");
        } catch (Exception e) {
            System.out.println("Query 85: "+e.getMessage());
        }
    }
    public void update(Query query, String id, String table, ArrayList<String> column) {
        try {
            action = "UPDATE "+table;
            query.setSql("UPDATE " + table + " SET ");
            for (int i = 0; i < column.size(); i++) {
                query.setSql(query.getSql() + column.get(i) + "=?");
                if (i != column.size() - 1) {
                    query.setSql(query.getSql() + ",");
                }
            }
            query.setSql(query.getSql() + " WHERE " + id + "=?");
        } catch (Exception e) {
            System.out.println("Query 100: "+e.getMessage());
        }
    }
    public void delete(Query query, String table) {
        try {
            action = "DELETE "+table;
            query.setSql("DELETE FROM " + table);
        } catch (Exception e) {
//            e.printStackTrace();
        }
    }
    public void truncate(Query query, String table) {
        try {
            action = "TRUNCATE "+table;
            query.setSql("TRUNCATE " + table);
        } catch (Exception e) {
            System.out.println("Query 116: "+e.getMessage());
        }
    }
    public void join(Query query, String table, String data, String stat) {
        query.setSql(query.getSql()+" "+stat+" JOIN "+table+" ON "+data);
    }
    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet aRs) {
        rs = aRs;
    }

    public PreparedStatement getPs() {
        return ps;
    }

    public void setPs(Query query, PreparedStatement aPs, int u_id) {
        if(!query.getSql().contains("SELECT")) {
            addLog(query, u_id);
        }
        ps = aPs;
        query.setSql("");
        where = 0;
        action = "";
    }
    
    public void addLog(Query query, int u_id) {
        DBConn dBConn = new DBConn();
        try {
//            int u_id = Integer.parseInt(httpSession.getAttribute("u_id").toString());
            String hl_action = action;
            String hl_remarks = query.getSql();
            String hl_date = Func.getTodayDate();
            String sql = "INSERT INTO history_log(u_id, hl_action, hl_remarks, hl_date) "
                    + "VALUES(?, ?, ?, ?)";
            PreparedStatement ps_temp = dBConn.getConn2().prepareStatement(sql);
            ps_temp.setInt(1, u_id);
            ps_temp.setString(2, hl_action);
            ps_temp.setString(3, hl_remarks);
            ps_temp.setString(4, hl_date);
            ps_temp.execute();
        } catch (Exception e) {
            Starter.setError(e.getMessage());
        }
        try {
            dBConn.getConn2().close();
        } catch (Exception e) {
        }
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String aSql) {
        sql = aSql;
    }
}
