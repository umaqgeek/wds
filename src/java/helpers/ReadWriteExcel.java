/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

/**
 *
 * @author umarmukhtar
 */
public class ReadWriteExcel {
    
    public Properties read(String filename) {
        
        Properties prop = new Properties();
        
        try {
            
            Workbook workbook = Workbook.getWorkbook(new File(filename));
            Sheet sheet = workbook.getSheet(0);
            
            /**
             * a) Voltage versus Time (Column O) // (14,7) -> (14, null)
             * b) Current versus Time (Column M) // (12,7) -> (12, null)
             * c) Power versus Time (Volt X Current) 
             * d) Jaw displacement versus Time (Column K) // (10,7) -> (10, null) 
             * e) Pressure, P1 and P2 versus Time (Column Q & S)  // (16 & 18,7)->(16 & 18,null)
             * f) Time (Column F) // (5,7) -> (5, null)
             */
            
            ArrayList<String> a1 = new ArrayList<String>();
            ArrayList<String> b1 = new ArrayList<String>();
            
            String a = "";
            String b = "";
            String d = "";
            String e1 = "";
            String e2 = "";
            String t = "";
            for (int i = 7; i < Func.LIMIT_ROW_SIZE; i++) {
                try {
                    Cell cella = sheet.getCell(14, i);
                    if (cella.getContents() != null && !cella.getContents().equals("")) {
                        a += cella.getContents() + "|";
                        a1.add(cella.getContents());
                    }
                    Cell cellb = sheet.getCell(12, i);
                    if (cellb.getContents() != null && !cellb.getContents().equals("")) {
                        b += cellb.getContents() + "|";
                        b1.add(cellb.getContents());
                    }
                    Cell celld = sheet.getCell(10, i);
                    if (celld.getContents() != null && !celld.getContents().equals("")) {
                        d += celld.getContents() + "|";
                    }
                    Cell celle1 = sheet.getCell(16, i);
                    if (celle1.getContents() != null && !celle1.getContents().equals("")) {
                        e1 += celle1.getContents() + "|";
                    }
                    Cell celle2 = sheet.getCell(18, i);
                    if (celle2.getContents() != null && !celle2.getContents().equals("")) {
                        e2 += celle2.getContents() + "|";
                    }
                    Cell cellt = sheet.getCell(5, i);
                    if (cellt.getContents() != null && !cellt.getContents().equals("")) {
                        t += cellt.getContents() + "|";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            prop.setProperty("a", a);
            prop.setProperty("b", b);
            prop.setProperty("d", d);
            prop.setProperty("e1", e1);
            prop.setProperty("e2", e2);
            prop.setProperty("t", t);
            
            String c = "";
            int sizeab = (a1.size() > b1.size()) ? (b1.size()) : (a1.size());
            for (int i = 0; i < sizeab; i++) {
                String ctemp = "";
                try {
                    ctemp = ( Integer.parseInt(a1.get(i)) * Integer.parseInt(b1.get(i)) ) + "|";
                } catch (Exception e) {
                    ctemp = "0|";
                }
                c += ctemp;
            }
            prop.setProperty("c", c);
            
            workbook.close();
            
        } catch (IOException ex) {
            
            ex.printStackTrace();
            Logger.getLogger(ReadWriteExcel.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (BiffException ex) {
            
            ex.printStackTrace();
            Logger.getLogger(ReadWriteExcel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return prop;
    } 
}
