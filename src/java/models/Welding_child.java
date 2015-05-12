/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import controllers.Starter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author End User
 */
public class Welding_child {
    public boolean delete(int wc_id, int u_id) {
        Query query = new Query();
        boolean stat = false;
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "welding_child");
            query.where(query, "wc_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, wc_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Welding_child 32: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean deleteChild(int w_id, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.delete(query, "welding_child");
            query.where(query, "w_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, w_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Welding_child 55: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public boolean edit(int wc_id, ArrayList<String> column, 
            ArrayList<String> data, ArrayList<Integer> tanda, int u_id) {
        boolean stat = false;
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.update(query, "wc_id", "welding_child", column);
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
            query.getPs().setInt(data.size()+1, wc_id);
            query.getPs().execute();
            stat = true;
        } catch (Exception e) {
            stat = false;
            Starter.setError(e.getMessage());
            System.out.println("Welding_child 91: "+e.getMessage());
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
            query.insert(query, "welding_child", column);
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
            System.out.println("Welding_child 126: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return stat;
    }
    
    public ArrayList<ArrayList<String>> getSearchAll(String sfnumber, 
            int fp_id, int m_id, int wsize_id, int sup_id, int sg_id, 
            int we_id, int wm_id, String date_from, String date_to, 
            int ws_id, int fc_id, int w_status, int welder_status, 
            int cat_id) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "w.w_id, " //0
                    + "w.w_sfnumber, " //1
                    + "w.fp_id, " //2
                    + "fp.fp_desc, " //3
                    + "w.m_id, " //4
                    + "m.m_desc, " //5
                    + "w.wsize_id, " //6
                    + "wsize.wsize_desc, " //7
                    + "w.sup_id, " //8
                    + "sup.sup_desc, " //9
                    + "w.sg_id, " //10
                    + "sg.sg_desc, " //11
                    + "wc.we_id, " //12
                    + "we.we_staffno, " //13
                    + "we.we_fullname, " //14
                    + "we.we_status, " //15
                    + "we.we_expireddate, " //16
                    + "we.we_link, " //17
                    + "wc.wm_id, " //18
                    + "wm.wm_desc, " //19
                    + "wc.wc_date, " //20
                    + "wc.ws_id, " //21
                    + "ws.ws_desc, " //22
                    + "wc.fc_id, " //23
                    + "fc.fc_desc, " //24
                    + "w.w_status, " //25
                    + "w.cat_id, " //26
                    + "cat.cat_desc, " //27
                    + "wc.wc_weldduration, " //28
                    + "wc.wc_spoolnumber, " //29
                    + "wc.wc_bobbinnumber "); //30
            query.from(query, "welding_child wc");
            query.join(query, "welding w", "w.w_id = wc.w_id", "left");
            query.join(query, "welder we", "wc.we_id = we.we_id", "left");
            query.join(query, "welding_machine wm", "wc.wm_id = wm.wm_id", "left");
            query.join(query, "welding_status ws", "wc.ws_id = ws.ws_id", "left");
            query.join(query, "failure_caused fc", "wc.fc_id = fc.fc_id", "left");
            query.join(query, "fabrication_phase fp", "w.fp_id = fp.fp_id", "left");
            query.join(query, "machine m", "w.m_id = m.m_id", "left");
            query.join(query, "wire_size wsize", "w.wsize_id = wsize.wsize_id", "left");
            query.join(query, "sta_grade sg", "w.sg_id = sg.sg_id", "left");
            query.join(query, "wps_number wn", "w.wn_id = wn.wn_id", "left");
            query.join(query, "supplier sup", "w.sup_id = sup.sup_id", "left");
            query.join(query, "user u", "w.u_id = u.u_id", "left");
            query.join(query, "category cat", "w.cat_id = cat.cat_id", "left");
            //Query.group_by("w.w_id");
            int simpan_ii[] = new int[15];
            int ii = 0;
            try {
                if (!sfnumber.equals("")) {
                    query.where(query, "w.w_sfnumber LIKE ?");
                    simpan_ii[ii] = ii++;
                }
            } catch (Exception e) {
            }
            if (fp_id != 0) {
                query.where(query, "w.fp_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (m_id != 0) {
                query.where(query, "w.m_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (wsize_id != 0) {
                query.where(query, "w.wsize_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (sup_id != 0) {
                query.where(query, "w.sup_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (sg_id != 0) {
                query.where(query, "w.sg_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (we_id != 0) {
                query.where(query, "wc.we_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (wm_id != 0) {
                query.where(query, "wc.wm_id = ?");
                simpan_ii[ii] = ii++;
            }
            try {
                if (!date_from.equals("") && !date_to.equals("")) {
                    query.where(query, "wc.wc_date BETWEEN DATE(?) AND DATE(?)+1");
                    simpan_ii[ii] = ii++;
                    simpan_ii[ii] = ii++;
                }
            } catch (Exception e) {
            }
            if (ws_id != 0) {
                query.where(query, "wc.ws_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (fc_id != 0) {
                query.where(query, "wc.fc_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (w_status != 0) {
                query.where(query, "w.w_status = ?");
                simpan_ii[ii] = ii++;
            }
            if (cat_id != 0) {
                query.where(query, "w.cat_id = ?");
                simpan_ii[ii] = ii++;
            }
            if (welder_status != 0) {
                if (welder_status == 1) {
                    query.where(query, "str_to_date(we.we_expireddate, \"%d/%m/%Y\") > NOW()");
                } else {
                    query.where(query, "str_to_date(we.we_expireddate, \"%d/%m/%Y\") < NOW()");
                }
                simpan_ii[ii] = ii++;
            }
            int jj = 0;
            //Query.order_by("wc.wc_id", "desc");
            query.limit(query, "500000");
//            System.out.println("sql: "+query.getSql());
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            try {
                if (!sfnumber.equals("")) {
                    query.getPs().setString(simpan_ii[jj++]+1, sfnumber+"%");
                }
            } catch (Exception e) {
            }
            if (fp_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, fp_id);
            }
            if (m_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, m_id);
            }
            if (wsize_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, wsize_id);
            }
            if (sup_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, sup_id);
            }
            if (sg_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, sg_id);
            }
            if (we_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, we_id);
            }
            if (wm_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, wm_id);
            }
            try {
                if (!date_from.equals("") && !date_to.equals("")) {
                    String from = date_from.split("/")[2]+"-"+date_from.split("/")[1]+"-"+date_from.split("/")[0];
                    String to = date_to.split("/")[2]+"-"+date_to.split("/")[1]+"-"+date_to.split("/")[0];
                    query.getPs().setString(simpan_ii[jj++]+1, from);
                    query.getPs().setString(simpan_ii[jj++]+1, to);
                }
            } catch (Exception e) {
            }
            if (ws_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, ws_id);
            }
            if (fc_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, fc_id);
            }
            if (w_status != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, w_status);
            }
            if (cat_id != 0) {
                query.getPs().setInt(simpan_ii[jj++]+1, cat_id);
            }
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 1; i <= 31; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding_child 322: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<ArrayList<String>> getAll() {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "wc.wc_id, " //1
                    + "wc.w_id, " //2
                    + "wc.t_id, " //3
                    + "t.t_desc, " //4
                    + "wc.we_id, " //5
                    + "we.we_staffno, " //6
                    + "we.we_fullname, " //7
                    + "we.we_status, " //8
                    + "we.we_expireddate, " //9
                    + "we.we_link, " //10
                    + "wc.wm_id, " //11
                    + "wm.wm_desc, " //12
                    + "wc.wc_weldingnumber, " //13
                    + "wc.wc_weldlength, " //14
                    + "wc.ws_id, " //15
                    + "ws.ws_desc, " //16
                    + "wc.fc_id, " //17
                    + "fc.fc_desc, " //18
                    + "wc.wc_failuretensile, " //19
                    + "wc.wc_weldduration, " //20
                    + "wc.wc_spoolnumber, " //21
                    + "wc.wc_bobbinnumber, " //22
                    + "wc.wc_coilnumber, " //23
                    + "wc.wp_id, " //24
                    + "wp.wp_desc, " //25
                    + "wc.wc_efposition, " //26
                    + "wc.wc_status, " //27
                    + "wc.wc_date, " //28
                    + "wc.u_id, " //29
                    + "u.u_staffno, " //30
                    + "u.u_fullname, " //31
                    + "u.u_username, " //32
                    + "u.u_password, " //33
                    + "u.u_status, " //34
                    + "u.ut_id"); //35
            query.from(query, "welding_child wc");
            query.join(query, "welding w", "wc.w_id = w.w_id", "left");
            query.join(query, "team t", "wc.t_id = t.t_id", "left");
            query.join(query, "welder we", "wc.we_id = we.we_id", "left");
            query.join(query, "welding_machine wm", "wc.wm_id = wm.wm_id", "left");
            query.join(query, "welding_status ws", "wc.ws_id = ws.ws_id", "left");
            query.join(query, "failure_caused fc", "wc.fc_id = fc.fc_id", "left");
            query.join(query, "welding_process wp", "wc.wp_id = wp.wp_id", "left");
            query.join(query, "user u", "wc.u_id = u.u_id", "left");
            //Query.group_by("w.w_id");
            query.order_by(query, "wc.wc_id", "desc");
            query.limit(query, "500");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 1; i <= 35; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding_child 394: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<ArrayList<String>> getAll(int w_id) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "wc.wc_id, " //1
                    + "wc.w_id, " //2
                    + "wc.t_id, " //3
                    + "t.t_desc, " //4
                    + "wc.we_id, " //5
                    + "we.we_staffno, " //6
                    + "we.we_fullname, " //7
                    + "we.we_status, " //8
                    + "we.we_expireddate, " //9
                    + "we.we_link, " //10
                    + "wc.wm_id, " //11
                    + "wm.wm_desc, " //12
                    + "wc.wc_weldingnumber, " //13
                    + "wc.wc_weldlength, " //14
                    + "wc.ws_id, " //15
                    + "ws.ws_desc, " //16
                    + "wc.fc_id, " //17
                    + "fc.fc_desc, " //18
                    + "wc.wc_failuretensile, " //19
                    + "wc.wc_weldduration, " //20
                    + "wc.wc_spoolnumber, " //21
                    + "wc.wc_bobbinnumber, " //22
                    + "wc.wc_coilnumber, " //23
                    + "wc.wp_id, " //24
                    + "wp.wp_desc, " //25
                    + "wc.wc_efposition, " //26
                    + "wc.wc_status, " //27
                    + "wc.wc_date, " //28
                    + "wc.u_id, " //29
                    + "u.u_staffno, " //30
                    + "u.u_fullname, " //31
                    + "u.u_username, " //32
                    + "u.u_password, " //33
                    + "u.u_status, " //34
                    + "u.ut_id, " //35
                    + "wc.wc_comments"); //36
            query.from(query, "welding_child wc");
            query.join(query, "welding w", "wc.w_id = w.w_id", "left");
            query.join(query, "team t", "wc.t_id = t.t_id", "left");
            query.join(query, "welder we", "wc.we_id = we.we_id", "left");
            query.join(query, "welding_machine wm", "wc.wm_id = wm.wm_id", "left");
            query.join(query, "welding_status ws", "wc.ws_id = ws.ws_id", "left");
            query.join(query, "failure_caused fc", "wc.fc_id = fc.fc_id", "left");
            query.join(query, "welding_process wp", "wc.wp_id = wp.wp_id", "left");
            query.join(query, "user u", "wc.u_id = u.u_id", "left");
            //Query.group_by("w.w_id");
            query.where(query, "wc.w_id = ?");
            query.order_by(query, "wc.wc_id", "desc");
            query.limit(query, "500");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, w_id);
            query.setRs(query.getPs().executeQuery());
            while (query.getRs().next()) {
                ArrayList<String> d = new ArrayList<String>();
                for(int i = 1; i <= 36; i++) {
                    d.add(query.getRs().getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding_child 469: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<String> getId(int wc_id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "wc.wc_id, " //1
                    + "wc.w_id, " //2
                    + "wc.t_id, " //3
                    + "t.t_desc, " //4
                    + "wc.we_id, " //5
                    + "we.we_staffno, " //6
                    + "we.we_fullname, " //7
                    + "we.we_status, " //8
                    + "we.we_expireddate, " //9
                    + "we.we_link, " //10
                    + "wc.wm_id, " //11
                    + "wm.wm_desc, " //12
                    + "wc.wc_weldingnumber, " //13
                    + "wc.wc_weldlength, " //14
                    + "wc.ws_id, " //15
                    + "ws.ws_desc, " //16
                    + "wc.fc_id, " //17
                    + "fc.fc_desc, " //18
                    + "wc.wc_failuretensile, " //19
                    + "wc.wc_weldduration, " //20
                    + "wc.wc_spoolnumber, " //21
                    + "wc.wc_bobbinnumber, " //22
                    + "wc.wc_coilnumber, " //23
                    + "wc.wp_id, " //24
                    + "wp.wp_desc, " //25
                    + "wc.wc_efposition, " //26
                    + "wc.wc_status, " //27
                    + "wc.wc_date, " //28
                    + "wc.u_id, " //29
                    + "u.u_staffno, " //30
                    + "u.u_fullname, " //31
                    + "u.u_username, " //32
                    + "u.u_password, " //33
                    + "u.u_status, " //34
                    + "u.ut_id, " //35
                    + "wc.wc_comments"); //36
            query.from(query, "welding_child wc");
            query.join(query, "welding w", "wc.w_id = w.w_id", "left");
            query.join(query, "team t", "wc.t_id = t.t_id", "left");
            query.join(query, "welder we", "wc.we_id = we.we_id", "left");
            query.join(query, "welding_machine wm", "wc.wm_id = wm.wm_id", "left");
            query.join(query, "welding_status ws", "wc.ws_id = ws.ws_id", "left");
            query.join(query, "failure_caused fc", "wc.fc_id = fc.fc_id", "left");
            query.join(query, "welding_process wp", "wc.wp_id = wp.wp_id", "left");
            query.join(query, "user u", "wc.u_id = u.u_id", "left");
            query.where(query, "wc.wc_id = ?");
            //Query.group_by("w.w_id");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, wc_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= 36; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding_child 540: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public String getWelderWCDate(int we_id) {
        /**
         * SELECT w.*, wc.wc_date
            FROM welder w
            LEFT JOIN welding_child wc ON w.we_id = wc.we_id
            WHERE w.we_id = 14
            ORDER BY w.we_id ASC , wc.wc_date DESC
         */
        String data = "";
        DBConn dBConn = new DBConn();
        try {
            String sql = "SELECT w.*, wc.wc_date "
                    + "FROM welder w "
                    + "LEFT JOIN welding_child wc ON w.we_id = wc.we_id "
                    + "WHERE w.we_id = ? "
                    + "ORDER BY w.we_id ASC , wc.wc_date DESC "
                    + "LIMIT 1 ";
            PreparedStatement ps = dBConn.getConn().prepareStatement(sql);
            ps.setInt(1, we_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data = rs.getString("wc_date");
            }
        } catch (Exception e) {
//            System.out.println("Error getWelderWCDate: " + e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
    
    public ArrayList<String> getWelder(int we_id) {
        ArrayList<String> data = new ArrayList<String>();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "wc.wc_id, " //1
                    + "wc.w_id, " //2
                    + "wc.t_id, " //3
                    + "t.t_desc, " //4
                    + "wc.we_id, " //5
                    + "we.we_staffno, " //6
                    + "we.we_fullname, " //7
                    + "we.we_status, " //8
                    + "we.we_expireddate, " //9
                    + "we.we_link, " //10
                    + "wc.wm_id, " //11
                    + "wm.wm_desc, " //12
                    + "wc.wc_weldingnumber, " //13
                    + "wc.wc_weldlength, " //14
                    + "wc.ws_id, " //15
                    + "ws.ws_desc, " //16
                    + "wc.fc_id, " //17
                    + "fc.fc_desc, " //18
                    + "wc.wc_failuretensile, " //19
                    + "wc.wc_weldduration, " //20
                    + "wc.wc_spoolnumber, " //21
                    + "wc.wc_bobbinnumber, " //22
                    + "wc.wc_coilnumber, " //23
                    + "wc.wp_id, " //24
                    + "wp.wp_desc, " //25
                    + "wc.wc_efposition, " //26
                    + "wc.wc_status, " //27
                    + "wc.wc_date, " //28
                    + "wc.u_id, " //29
                    + "u.u_staffno, " //30
                    + "u.u_fullname, " //31
                    + "u.u_username, " //32
                    + "u.u_password, " //33
                    + "u.u_status, " //34
                    + "u.ut_id, " //35
                    + "wc.wc_comments"); //36
            query.from(query, "welding_child wc");
            query.join(query, "welding w", "wc.w_id = w.w_id", "left");
            query.join(query, "team t", "wc.t_id = t.t_id", "left");
            query.join(query, "welder we", "wc.we_id = we.we_id", "left");
            query.join(query, "welding_machine wm", "wc.wm_id = wm.wm_id", "left");
            query.join(query, "welding_status ws", "wc.ws_id = ws.ws_id", "left");
            query.join(query, "failure_caused fc", "wc.fc_id = fc.fc_id", "left");
            query.join(query, "welding_process wp", "wc.wp_id = wp.wp_id", "left");
            query.join(query, "user u", "wc.u_id = u.u_id", "left");
            query.where(query, "wc.we_id = ?");
            
//            System.out.println("we_id:"+we_id);
//            System.out.println("sql:"+query.getSql());
            
            //Query.group_by("w.w_id");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, we_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                for(int i = 1; i <= 36; i++) {
                    data.add(query.getRs().getString(i));
                }
            }
        } catch (SQLException ex) {
            Starter.setError(ex.getMessage());
            System.out.println("Welding_child 648: "+ex.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return data;
    }
}
