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
public class Component {
    
    public String[][] getListFamilies() {
        String weld_family[][] = {
            {"1", "Strip Welding"}, 
            {"2", "Wire Welding"}, 
            {"3", "Raboutage"}, 
            {"4", "Carcass Stop Ring"}
        };
        return weld_family;
    }
    
    public String[][] getListComponents() {
        String w[][] = {
            {"Fabrication Phase", "fp", "fabrication_phase"},
            {"Failure Caused", "fc", "failure_caused"},
            {"Manuf. Machine", "m", "machine"},
            {"STA Grade", "sg", "sta_grade"},
            {"Team", "t", "team"},
            {"Welding Machine", "wm", "welding_machine"},
            {"Welding Status", "ws", "welding_status"},
            {"Wire Size", "wsize", "wire_size"},
            {"Supplier", "sup", "supplier"},
            {"Welding Process", "wp", "welding_process"},
            {"Category", "cat", "category"},
            {"WPS Number", "wn", "wps_number"},
            {"Welders", "we", "welder"}
        };
        return w;
    }
    
    public ArrayList<ArrayList<String>> getComponent(String table, int numcol) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "*");
            query.from(query, table);
            if (table.equals("wps_number")) {
                query.join(query, "sta_grade sg", "wps_number.sg_id = sg.sg_id", "LEFT");
                query.join(query, "supplier sup", "wps_number.sup_id = sup.sup_id", "LEFT");
                query.order_by(query, "wn_linkno", "ASC");
            }
            if (table.equals("welder")) {
                query.order_by(query, "we_staffno", "ASC");
            }
//            System.out.println("sql: "+query.getSql());
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 0; i < numcol; i++) {
                    d.add(query.getRs().getString(i+1));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Component 73: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 78: "+e.getMessage());
        }
        return data;
    }
    
    public ArrayList<String> get(String idcol, String table, int id, 
            int numcol) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "*");
            query.from(query, table);
            if (table.equals("wps_number")) {
                query.join(query, "sta_grade sg", "wps_number.sg_id = sg.sg_id", "LEFT");
                query.join(query, "supplier sup", "wps_number.sup_id = sup.sup_id", "LEFT");
            }
            query.where(query, idcol+" = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= numcol; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Component 106: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 111: "+e.getMessage());
        }
        return data;
    }
    
    public ArrayList<String> getWeCat(String idcol, String table, int id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "*");
            query.from(query, table);
            query.where(query, idcol+" = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, id);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                data.add(query.getRs().getString("cat_id"));
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Component 132: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 137: "+e.getMessage());
        }
        return data;
    }
    
    public boolean delete(String idcol, String table, int id, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, table);
            query.where(query, idcol+" = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Component 156: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 161: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean edit(String idcol, String table, int u_id, 
            ArrayList<String> column, ArrayList<String> data, 
            ArrayList<Integer> tanda, int uu_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.update(query, idcol, table, column);
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
            Starter.setError(e.getMessage());
            System.out.println("Component 194: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 199: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean add(String table, ArrayList<String> column, 
            ArrayList<String> data, ArrayList<Integer> tanda, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.insert(query, table, column);
//            System.out.println("sql: "+query.getSql());
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
            Starter.setError(e.getMessage());
            System.out.println("Component 231: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 236: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean addWeCat(ArrayList<String> val, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "we_id");
            query.from(query, "welder");
            query.order_by(query, "we_id", "DESC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                int we_id = query.getRs().getInt("we_id");
                for (int i = 0; i < val.size(); i++) {
                    ArrayList<String> column = new ArrayList<String>();
                    ArrayList<String> data = new ArrayList<String>();
                    ArrayList<Integer> tanda = new ArrayList<Integer>();
                    column.add("cat_id"); data.add(val.get(i)); tanda.add(2);
                    column.add("we_id"); data.add(we_id+""); tanda.add(2);
                    query.insert(query, "welder_category", column);
                    query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
                    for (int j = 0; j < data.size(); j++) {
                        switch (tanda.get(j)) {
                            case 1:
                                query.getPs().setString((j + 1), data.get(j));
                                break;
                            case 2:
                                query.getPs().setInt((j + 1), Integer.parseInt(data.get(j)));
                                break;
                            default:
                                query.getPs().setString((j + 1), data.get(j));
                                break;
                        }
                    }
                    query.getPs().execute();
                }
            }
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Component 281: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 286: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean addWnCat(ArrayList<String> val, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "wn_id");
            query.from(query, "wps_number");
            query.order_by(query, "wn_id", "DESC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                int wn_id = query.getRs().getInt("wn_id");
                for (int i = 0; i < val.size(); i++) {
                    ArrayList<String> column = new ArrayList<String>();
                    ArrayList<String> data = new ArrayList<String>();
                    ArrayList<Integer> tanda = new ArrayList<Integer>();
                    column.add("cat_id"); data.add(val.get(i)); tanda.add(2);
                    column.add("wn_id"); data.add(wn_id+""); tanda.add(2);
                    query.insert(query, "wps_number_category", column);
                    query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
                    for (int j = 0; j < data.size(); j++) {
                        switch (tanda.get(j)) {
                            case 1:
                                query.getPs().setString((j + 1), data.get(j));
                                break;
                            case 2:
                                query.getPs().setInt((j + 1), Integer.parseInt(data.get(j)));
                                break;
                            default:
                                query.getPs().setString((j + 1), data.get(j));
                                break;
                        }
                    }
                    query.getPs().execute();
                }
            }
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Component 331: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 336: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean editWeCat(int we_id, ArrayList<String> val, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "welder_category");
            query.where(query, "we_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, we_id);
            query.getPs().execute();
            for (int i = 0; i < val.size(); i++) {
                ArrayList<String> column = new ArrayList<String>();
                ArrayList<String> data = new ArrayList<String>();
                ArrayList<Integer> tanda = new ArrayList<Integer>();
                column.add("cat_id"); data.add(val.get(i)); tanda.add(2);
                column.add("we_id"); data.add(we_id + ""); tanda.add(2);
                query.insert(query, "welder_category", column);
                query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
                for (int j = 0; j < data.size(); j++) {
                    switch (tanda.get(j)) {
                        case 1:
                            query.getPs().setString((j + 1), data.get(j));
                            break;
                        case 2:
                            query.getPs().setInt((j + 1), Integer.parseInt(data.get(j)));
                            break;
                        default:
                            query.getPs().setString((j + 1), data.get(j));
                            break;
                    }
                }
                query.getPs().execute();
            }
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Component 378: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 383: "+e.getMessage());
        }
        return stat;
    }
    
    public boolean editWnCat(int wn_id, ArrayList<String> val, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "wps_number_category");
            query.where(query, "wn_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, wn_id);
            query.getPs().execute();
            for (int i = 0; i < val.size(); i++) {
                ArrayList<String> column = new ArrayList<String>();
                ArrayList<String> data = new ArrayList<String>();
                ArrayList<Integer> tanda = new ArrayList<Integer>();
                column.add("cat_id"); data.add(val.get(i)); tanda.add(2);
                column.add("wn_id"); data.add(wn_id + ""); tanda.add(2);
                query.insert(query, "wps_number_category", column);
                query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
                for (int j = 0; j < data.size(); j++) {
                    switch (tanda.get(j)) {
                        case 1:
                            query.getPs().setString((j + 1), data.get(j));
                            break;
                        case 2:
                            query.getPs().setInt((j + 1), Integer.parseInt(data.get(j)));
                            break;
                        default:
                            query.getPs().setString((j + 1), data.get(j));
                            break;
                    }
                }
                query.getPs().execute();
            }
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Component 425: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 430: "+e.getMessage());
        }
        return stat;
    }
    
    public ArrayList<String> getWeCat_list(int we_id) {
        ArrayList<String> val = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "cat.cat_desc");
            query.from(query, "category cat");
            query.join(query, "welder_category wecat", "wecat.cat_id = cat.cat_id", "LEFT");
            query.where(query, "wecat.we_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, we_id);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                val.add(query.getRs().getString("cat_desc"));
            }
        } catch (Exception e) {
            Starter.setError(e.getMessage());
            System.out.println("Component 452: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 457: "+e.getMessage());
        }
        return val;
    }
    
    public ArrayList<String> getWnCat_list(int wn_id) {
        ArrayList<String> val = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "cat.cat_desc");
            query.from(query, "category cat");
            query.join(query, "wps_number_category wncat", "wncat.cat_id = cat.cat_id", "LEFT");
            query.where(query, "wncat.wn_id = ?");
//            System.out.println("sql: "+query.getSql());
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, wn_id);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                val.add(query.getRs().getString("cat_desc"));
            }
        } catch (Exception e) {
            Starter.setError(e.getMessage());
            System.out.println("Component 480: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 485: "+e.getMessage());
        }
        return val;
    }
    
    /**
     * SELECT fp.fp_id AS fp_id, fp.fp_desc AS fp_desc FROM fabrication_phase
     * fp, welding w WHERE fp.fp_id = w.fp_id AND w.w_status = ? GROUP BY
     * fp.fp_id ORDER BY fp.fp_desc ASC
     */
    public ArrayList<ArrayList<String>> getUniqueFP(int weld_status) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "fp.fp_id AS fp_id, fp.fp_desc AS fp_desc");
            query.from(query, "fabrication_phase fp, welding w");
            query.where(query, "fp.fp_id = w.fp_id");
            query.where(query, "w.w_status = ?");
            query.group_by(query, "fp.fp_id");
            query.order_by(query, "fp.fp_desc", "ASC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, weld_status);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 0; i < 2; i++) {
                    d.add(query.getRs().getString(i+1));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Component 518: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 523: "+e.getMessage());
        }
        return data;
    }
    
    /**
     * SELECT m.m_id AS m_id, m.m_desc AS m_desc FROM machine m, welding w WHERE
     * m.m_id = w.m_id AND w.w_status = ? GROUP BY m.m_id ORDER BY m.m_desc ASC
     */
    public ArrayList<ArrayList<String>> getUniqueM(int weld_status) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "m.m_id AS m_id, m.m_desc AS m_desc");
            query.from(query, "machine m, welding w");
            query.where(query, "m.m_id = w.m_id");
            query.where(query, "w.w_status = ?");
            query.group_by(query, "m.m_id");
            query.order_by(query, "m.m_desc", "ASC");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, weld_status);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 0; i < 2; i++) {
                    d.add(query.getRs().getString(i+1));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Component 555: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
            System.out.println("Component 560: "+e.getMessage());
        }
        return data;
    }
}
