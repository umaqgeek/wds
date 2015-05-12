/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

/**
 *
 * @author End User
 */
public class Expired_Lejer_Bean {
    private int el_id;
    private String el_time;
    private Expired_Type_Bean expired_type;

    public int getEl_id() {
        return el_id;
    }

    public void setEl_id(int el_id) {
        this.el_id = el_id;
    }

    public String getEl_time() {
        return el_time;
    }

    public void setEl_time(String el_time) {
        this.el_time = el_time;
    }

    public Expired_Type_Bean getExpired_type() {
        return expired_type;
    }

    public void setExpired_type(Expired_Type_Bean expired_type) {
        this.expired_type = expired_type;
    }
}
