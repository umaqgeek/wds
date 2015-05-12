/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import beans.Expired_Lejer_Bean;
import beans.Expired_Type_Bean;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import models.Component;

/**
 *
 * @author End User
 */
public class Func {
    
    public static final int SECONDS_PER_MINUTE = 60;
    public static final int MINUTES_PER_HOUR = 60;
    public static final int HOUR_PER_DAY = 24;
    public static final int DAY_PER_MONTH = 30;
    public static final int MONTH_PER_YEAR = 12;
    public static final long ONE_MONTH = 60 * 60 * 24 * 30;
    
    private static long SIX_MONTH = ONE_MONTH * 6;
    public static final long FIVE_MONTH = ONE_MONTH * 5;
    public static final long TWO_YEARS = ONE_MONTH * 24;
    
    public static void setWarningMonth(long month) {
        SIX_MONTH = ONE_MONTH * month;
    }
    
    public static long getWarningMonth() {
        return SIX_MONTH;
    }
    
    public static void testLoad(int num) {
        for (int i = 0; i < num; i++) {
            String st = "haha";
        }
        System.out.println("Done!");
    }
    
    /**
     * Get wn_linkno from link
     */
    public static String getLinkNo(String link) {
        String str[] = link.split("\\.");
        String out = "";
        for (int l = 0; l < str.length - 1; l++) {
            out += str[l];
        }
        return out;
    }
    
    /**
     * Get family's name
     */
    public static String getFamily(int status) {
        String family = "";
        Component component = new Component();
        try {
            family = component.getListFamilies()[status-1][1];
        } catch (Exception e) {
            family = "";
//            System.out.println("Func 69: "+e.getMessage());
        }
        return family;
    }
    
    /**
     * Get today's date format yyyy-MM-dd HH:mm:ss
     * @return 
     */
    public static String getTodayDate() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get today's date format dd/MM/yyyy
     * @return 
     */
    public static String getTodayDate2() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String getDate(String date) {
        try {
            String str[] = date.split(" ");
            String str2[] = str[0].split("-");
            return str2[2]+"/"+str2[1]+"/"+str2[0];
        } catch (Exception e) {
            return "00/00/0000";
        }
    }
    
    /**
     * Get date format 00/00/0000 00:00:00
     * @return 
     */
    public static String getDateTime(String date) {
        String str[] = date.split(" ");
        String str2[] = str[0].split("-");
        String str3[] = str[1].split(":");
        return str2[2]+"/"+str2[1]+"/"+str2[0]+" "+str3[0]+":"+str3[1]+":"+str3[2];
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String sqlToDate(String date) {
        String str[] = date.split("-");
        return str[2]+"/"+str[1]+"/"+str[0];
    }
    
    public static boolean isWelderValid(String tarikh, String welddate) {
        boolean stat = false;
//        System.out.println("tarikh: "+tarikh);
//        System.out.println("welddate: "+welddate);
//        try {
//            int weld_day = Integer.parseInt(date.split("\\/")[0]);
//            int weld_month = Integer.parseInt(date.split("\\/")[1]);
//            int weld_year = Integer.parseInt(date.split("\\/")[2]);
//            String str[] = arini.split(" ");
//            int arini_day = Integer.parseInt(str[0].split("-")[2]);
//            int arini_month = Integer.parseInt(str[0].split("-")[1]);
//            int arini_year = Integer.parseInt(str[0].split("-")[0]);
//            if(arini_year < weld_year) {
//                stat = true;
//            } else if(arini_year == weld_year) {
//                if(arini_month < weld_month) {
//                    stat = true;
//                } else if(arini_month == weld_month) {
//                    if(arini_day <= weld_day) {
//                        stat = true;
//                    } else {
//                        stat = false;
//                    }
//                } else {
//                    stat = false;
//                }
//            } else {
//                stat = false;
//            }
//        } catch (Exception e) {
//            stat = false;
//            e.printStackTrace();
//        }
        try {
            String st = tarikh;
            String st2 = welddate;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = sdf.parse(st);
            Date date2 = sdf2.parse(st2);
            Timestamp timestamp = new Timestamp(date.getTime());
            Timestamp timestamp2 = new Timestamp(date2.getTime());
//            System.out.println(t2);
//            System.out.println(t22);
//            System.out.println(timestamp2.getTime() / 1000 - timestamp.getTime() / 1000);
            long saat = timestamp.getTime() / 1000 - timestamp2.getTime() / 1000;
//            System.out.println("saat: "+saat);
            if (saat > 0) {
                stat = true;
            } else {
                stat = false;
            }
        } catch (Exception e) {
            stat = false;
//            System.out.println("Func 182: "+e.getMessage());
        }
        return stat;
    }
    
    /**
     * change seconds to days or months.
     * 
     * @param type
     * @param seconds
     * @return 
     */
    public static int secondToDate(int type, int seconds) {
        int date = 0;
        try {
            switch (type) {
                case 1: // second to month
                    date = seconds / SECONDS_PER_MINUTE / MINUTES_PER_HOUR / HOUR_PER_DAY / DAY_PER_MONTH;
                    break;
                case 2: // second to days
                    date = seconds / SECONDS_PER_MINUTE / MINUTES_PER_HOUR / HOUR_PER_DAY;
                    break;
            }
        } catch (Exception e) {
//            System.out.println("Func 206: "+e.getMessage());
        }
        return date;
    }
    
    private long getMonth(int seconds) {
        try {
            return (seconds / Func.ONE_MONTH);
        } catch (Exception e) {
            return 0;
        }
    }
    
    public String expiredReason(String we_id, String arini, String tarikh, Expired_Lejer_Bean elb, String wc_date) {
        
        Expired_Type_Bean etb_3month = new Expired_Type_Bean();
        etb_3month.setEt_id(2); // 2 means warning type
        
        String stat = "";
        
        int warning = 0;
        
        try {
            
            warning = Integer.parseInt(elb.getEl_time());
            long month = getMonth(warning);
            String ss = (month > 1) ? ("s") : ("");
            
            String st2 = arini;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date2 = sdf2.parse(st2);
            Timestamp tarikh_arini = new Timestamp(date2.getTime());
//            System.out.println(t22);
            
            try {
                if (!wc_date.equals("") && wc_date.length() > 0) {
                    SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date date3 = sdf3.parse(wc_date);
                    Timestamp tarikh_lastjob = new Timestamp(date3.getTime());
                    long beza = (tarikh_arini.getTime() / 1000) - (tarikh_lastjob.getTime() / 1000);

                    if (beza >= SIX_MONTH) {
                        stat = "<span style='color:red;'>6 months expired</span>";
                    } else {
                        if ((beza < SIX_MONTH) && (beza >= (SIX_MONTH - warning))) {
                            stat = "<span style='color:orange;'>" + month + " month" + ss + " warning</span>"; // orange
                        } else {
                            stat = ""; // black
                        }
                    }
                }
            } catch (Exception ee) {
//                System.out.println("Func 259: "+ee.getMessage());
            }
            
            if (!tarikh.equals("-")) {
                String st1 = tarikh;
                Date date1 = sdf.parse(st1);
                Timestamp tarikh1 = new Timestamp(date1.getTime());
                
                long saat = tarikh1.getTime() / 1000 - tarikh_arini.getTime() / 1000;
                if (saat <= 0) {
                    stat = "<span style='color:red;'>Certificate Expired</span>";
                } else if (saat > 0 && saat <= warning) {
                    stat = "<span style='color:orange;'>Certificate Warning</span>";
                }
            }
            
        } catch (Exception e) {
            //stat += e.getMessage();
//            System.out.println("Func 277: "+e.getMessage());
        }
        
        return stat;
    }
    
    public String getDateAfter(String we_id, long seconds, String wc_date) {
        String str;
        try {
            
            if (!wc_date.equals("") && wc_date.length() > 0) {
                SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date3 = sdf3.parse(wc_date);
                Timestamp timestamp3 = new Timestamp(date3.getTime());
                long dateAfter = timestamp3.getTime() + (seconds * 1000);
                
                Date date4 = new Date(dateAfter);
                SimpleDateFormat df2 = new SimpleDateFormat("dd/MM/yyyy");
                str = df2.format(date4);
            } else {
                str = "No latest welding job.";
            }
        } catch (Exception e) {
            str = "No latest welding job.";
            //str = e.getMessage();
        }
        return str;
    }
    
    public String colorValid(String we_id, String tarikh, String arini, Expired_Lejer_Bean elb, String wc_date) {
        
        int warning = 0;
        
        String stat = "color:#000;";
        boolean ifRed1 = false;
        boolean ifRed2 = false;
        
        try {
            warning = Integer.parseInt(elb.getEl_time());
            
            String st = tarikh;
            String st2 = arini;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = sdf.parse(st);
            Date date2 = sdf2.parse(st2);
            Timestamp tarikh_expired = new Timestamp(date.getTime());
            Timestamp tarikh_arini = new Timestamp(date2.getTime());
//            System.out.println(t2);
//            System.out.println(t22);
//            System.out.println(timestamp2.getTime() / 1000 - timestamp.getTime() / 1000);
            long saat = (tarikh_expired.getTime() / 1000) - (tarikh_arini.getTime() / 1000);
//            System.out.println("saat: "+saat);
            
            if (saat > 0) { // valid, more than today
                if (saat <= warning) { // in the warning period
                    stat = "color:orange;"; // orange
                } else { // out from warning period
                    stat = "color:#000;"; // black
                }
            } else { // expired, less than today
                stat = "color:#f00;"; // red
                ifRed1 = true;
            }
            
            if (!wc_date.equals("") && wc_date.length() > 0) {
                SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date3 = sdf3.parse(wc_date);
                Timestamp tarikh_lastjob = new Timestamp(date3.getTime());
                long beza = (tarikh_arini.getTime() / 1000) - (tarikh_lastjob.getTime() / 1000);

                if (beza >= SIX_MONTH) {
                    stat = "color:#f00;"; // red
                    ifRed2 = true;
                } else {                    
                    if ((beza < SIX_MONTH) && (beza >= (SIX_MONTH - warning))) {
                        stat = "color:orange;"; // orange
                    } else {
                        stat = "color:#000;"; // black
                    }
                }
            }
            
        } catch (Exception e) {
//            System.out.println("Func 361: "+e.getMessage());
            //stat = "color:#000;";
            //System.out.println("Error Func ColorValid: "+e.getMessage());
        }
        
        if (ifRed1 || ifRed2) {
            stat = "color:#f00;"; // red
        }
        
        return stat;
    }
}
