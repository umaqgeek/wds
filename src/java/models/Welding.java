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
public class Welding {
    public boolean delete(int w_id, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "welding");
            query.where(query, "w_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, w_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Welding 30: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean edit(int w_id, ArrayList<String> column, 
            ArrayList<String> data, ArrayList<Integer> tanda, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.update(query, "w_id", "welding", column);
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
            query.getPs().setInt(data.size()+1, w_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            String str_error = e.getMessage();
            if(str_error.contains("Duplicate")) {
                Starter.setError("Record of that SF Number, Fabrication Phase, and Machine has already exist!");
            }
            System.out.println("Welding 69: "+e.getMessage());
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
            query.insert(query, "welding", column);
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
                Starter.setError("Record of that SF Number, Fabrication Phase, and Machine has already exist!");
            }
            System.out.println("Welding 107: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public ArrayList<ArrayList<String>> getAll(int weld_status) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "w.w_id, " //1
                    + "w.w_sfnumber, " //2
                    + "w.w_structurenumber, " //3
                    + "w.fp_id, " //4
                    + "fp.fp_desc, " //5
                    + "w.w_qualityplannumber, " //6
                    + "w.w_projectname, " //7
                    + "w.m_id, " //8
                    + "m.m_desc, " //9
                    + "w.wsize_id, " //10
                    + "wsize.wsize_desc, " //11
                    + "w.sg_id, " //12
                    + "sg.sg_desc, " //13
                    + "w.wn_id, " //14
                    + "wn.wn_linkno, " //15
                    + "w.sup_id, " //16
                    + "sup.sup_desc, " //17
                    + "w.w_date, " //18
                    + "w.u_id, " //19
                    + "u.u_staffno, " //20
                    + "u.u_fullname, " //21
                    + "u.u_password, " //22
                    + "u.u_status, " //23
                    + "u.ut_id, " //24
                    + "w.w_status, " //25
                    + "w.cat_id, " //26
                    + "cat.cat_desc "); //27
            query.from(query, "welding w");
            query.join(query, "fabrication_phase fp", "w.fp_id = fp.fp_id", "left");
            query.join(query, "machine m", "w.m_id = m.m_id", "left");
            query.join(query, "wire_size wsize", "w.wsize_id = wsize.wsize_id", "left");
            query.join(query, "sta_grade sg", "w.sg_id = sg.sg_id", "left");
            query.join(query, "wps_number wn", "w.wn_id = wn.wn_id", "left");
            query.join(query, "supplier sup", "w.sup_id = sup.sup_id", "left");
            query.join(query, "user u", "w.u_id = u.u_id", "left");
            query.join(query, "category cat", "w.cat_id = cat.cat_id", "left");
            //Query.group_by("w.w_id");
            if(weld_status != -1) {
                query.where(query, "w.w_status = ?");
            }
            query.order_by(query, "w.w_id", "desc");
            query.limit(query, "500");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            if(weld_status != -1) {
                query.getPs().setInt(1, weld_status);
            }
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 1; i <= 27; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding 177: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<String> get(String w_sfnumber, 
            int fp_id, int m_id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "w.w_id, " //1
                    + "w.w_sfnumber, " //2
                    + "w.w_structurenumber, " //3
                    + "w.fp_id, " //4
                    + "fp.fp_desc, " //5
                    + "w.w_qualityplannumber, " //6
                    + "w.w_projectname, " //7
                    + "w.m_id, " //8
                    + "m.m_desc, " //9
                    + "w.wsize_id, " //10
                    + "wsize.wsize_desc, " //11
                    + "w.sg_id, " //12
                    + "sg.sg_desc, " //13
                    + "w.wn_id, " //14
                    + "wn.wn_linkno, " //15
                    + "w.sup_id, " //16
                    + "sup.sup_desc, " //17
                    + "w.w_date, " //18
                    + "w.u_id, " //19
                    + "u.u_staffno, " //20
                    + "u.u_fullname, " //21
                    + "u.u_password, " //22
                    + "u.u_status, " //23
                    + "u.ut_id, " //24
                    + "w.w_status, " //25
                    + "w.cat_id, " //26
                    + "cat.cat_desc "); //27
            query.from(query, "welding w");
            query.join(query, "fabrication_phase fp", "w.fp_id = fp.fp_id", "left");
            query.join(query, "machine m", "w.m_id = m.m_id", "left");
            query.join(query, "wire_size wsize", "w.wsize_id = wsize.wsize_id", "left");
            query.join(query, "sta_grade sg", "w.sg_id = sg.sg_id", "left");
            query.join(query, "wps_number wn", "w.wn_id = wn.wn_id", "left");
            query.join(query, "supplier sup", "w.sup_id = sup.sup_id", "left");
            query.join(query, "user u", "w.u_id = u.u_id", "left");
            query.join(query, "category cat", "w.cat_id = cat.cat_id", "left");
            query.where(query, "w.w_sfnumber = ?");
            query.where(query, "w.fp_id = ?");
            query.where(query, "w.m_id = ?");
            //Query.group_by("w.w_id");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setString(1, w_sfnumber);
            query.getPs().setInt(2, fp_id);
            query.getPs().setInt(3, m_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= 27; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding 244: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<String> getId(int w_id, int weld_status) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "w.w_id, " //1
                    + "w.w_sfnumber, " //2
                    + "w.w_structurenumber, " //3
                    + "w.fp_id, " //4
                    + "fp.fp_desc, " //5
                    + "w.w_qualityplannumber, " //6
                    + "w.w_projectname, " //7
                    + "w.m_id, " //8
                    + "m.m_desc, " //9
                    + "w.wsize_id, " //10
                    + "wsize.wsize_desc, " //11
                    + "w.sg_id, " //12
                    + "sg.sg_desc, " //13
                    + "w.wn_id, " //14
                    + "wn.wn_linkno, " //15
                    + "w.sup_id, " //16
                    + "sup.sup_desc, " //17
                    + "w.w_date, " //18
                    + "w.u_id, " //19
                    + "u.u_staffno, " //20
                    + "u.u_fullname, " //21
                    + "u.u_password, " //22
                    + "u.u_status, " //23
                    + "u.ut_id, " //24
                    + "w.w_status, " //25
                    + "w.cat_id, " //26
                    + "cat.cat_desc "); //27
            query.from(query, "welding w");
            query.join(query, "fabrication_phase fp", "w.fp_id = fp.fp_id", "left");
            query.join(query, "machine m", "w.m_id = m.m_id", "left");
            query.join(query, "wire_size wsize", "w.wsize_id = wsize.wsize_id", "left");
            query.join(query, "sta_grade sg", "w.sg_id = sg.sg_id", "left");
            query.join(query, "wps_number wn", "w.wn_id = wn.wn_id", "left");
            query.join(query, "supplier sup", "w.sup_id = sup.sup_id", "left");
            query.join(query, "user u", "w.u_id = u.u_id", "left");
            query.join(query, "category cat", "w.cat_id = cat.cat_id", "left");
            query.where(query, "w.w_id = ?");
            query.where(query, "w.w_status = ?");
            //Query.group_by("w.w_id");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, w_id);
            query.getPs().setInt(2, weld_status);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= 27; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding 308: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<String> getUnique(String col, int weld_status) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "DISTINCT(w."+col+")");
            query.from(query, "welding w");
            if(weld_status != -1) {
                query.where(query, "w.w_status = ?");
            }
            query.group_by(query, "w."+col);
            query.order_by(query, "w."+col, "ASC");
//            System.out.println("sql: "+query.getSql());
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            if(weld_status != -1) {
                query.getPs().setInt(1, weld_status);
            }
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                data.add(query.getRs().getString(1));
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding 340: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
}
