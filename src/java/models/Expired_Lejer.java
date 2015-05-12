/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import beans.Expired_Lejer_Bean;
import beans.Expired_Type_Bean;
import controllers.Starter;

/**
 *
 * @author End User
 */
public class Expired_Lejer {
    public Expired_Lejer_Bean getExpiredLejer(int et_id) {
        Expired_Lejer_Bean elb = new Expired_Lejer_Bean();
        Query query = new Query();
        DBConn dBConn = new DBConn();
        try {
            query.select(query, "el.el_id,"
                    + "el.el_time");
            query.from(query, "expired_lejer el");
            query.where(query, "el.et_id = ?");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), 0);
            query.getPs().setInt(1, et_id);
            query.setRs(query.getPs().executeQuery());
            if (query.getRs().next()) {
                elb.setEl_id(query.getRs().getInt("el_id"));
                elb.setEl_time(query.getRs().getString("el_time"));
            }
        } catch (Exception e) {
            Starter.setError(e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return elb;
    }
    
    public boolean editExpiredLejer(Expired_Lejer_Bean elb, int u_id) {
        boolean status = false;
        DBConn dBConn = new DBConn();
        try {
            Query query = new Query();
            query.setSql("UPDATE expired_lejer SET el_time = ? WHERE el_id = ? ");
            query.setPs(query, dBConn.getConn().prepareStatement(query.getSql()), u_id);
            query.getPs().setString(1, elb.getEl_time());
            query.getPs().setInt(2, elb.getEl_id());
            query.getPs().execute();
            status = true;
        } catch (Exception e) {
            status = false;
            Starter.setError(e.getMessage());
            System.out.println("Expired_Lejer 58: "+e.getMessage());
        }
        try {
            dBConn.getConn().close();
        } catch (Exception e) {
        }
        return status;
    }
}
