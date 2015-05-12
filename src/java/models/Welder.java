/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import beans.WelderBean;
import controllers.Starter;

/**
 *
 * @author End User
 */
public class Welder {
    
    public WelderBean getWelder(WelderBean wb) {
        DBConn dBConn = new DBConn();
        Query query = new Query();
        try {
            query.select(query, "*");
            query.from(query, "welder");
            query.where(query, "we_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, wb.getWe_id());
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                wb.setWe_staffno(query.getRs().getString("we_staffno"));
                wb.setWe_expireddate(query.getRs().getString("we_expireddate"));
                wb.setWe_fullname(query.getRs().getString("we_fullname"));
                wb.setWe_link(query.getRs().getString("we_link"));
                wb.setWe_status(query.getRs().getInt("we_status"));
            }
        } catch (Exception e) {
            Starter.setError(e.getMessage());
            System.out.println("Welder 37: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return wb;
    }
    
    public boolean updateWelder(WelderBean wb, int u_id) {
        boolean status = false;
        DBConn dBConn = new DBConn();
        Query query = new Query();
        try {
            query.setSql("UPDATE welder SET we_status = ? WHERE we_id = ? ");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setInt(1, wb.getWe_status());
            query.getPs().setInt(2, wb.getWe_id());
            query.getPs().execute();
            status = true;
        } catch (Exception e) {
            status = false;
            Starter.setError(e.getMessage());
            System.out.println("Welder 60: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return status;
    }
}
