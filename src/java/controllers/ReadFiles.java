/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

/**
 *
 * @author umarmukhtar
 */
public class ReadFiles {
    
    public static final int START_PATH_NUM = 4;
//    public static final String START_PATH = "/Applications/XAMPP/htdocs/wds_1";
    public static final String START_PATH = "\\\\10.154.35.29\\Getsoud_Excel";
    
    public static ArrayList<String> read(String path) {
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();

        ArrayList<String> f = new ArrayList<String>();
        int status = 1;
        
        try {
            for (File file : listOfFiles) {
                boolean stat = true;
                if (file.isFile()) {
                    status = 1;
                    stat = file.getName().substring(0, 2).equals("S_");
                } else if (file.isDirectory()) {
                    status = 2;
                }
                if (stat) {
                    f.add(status + "|" + file.getName());
                }
            }
        } catch (Exception e) {
        }
        
        // sort by folder and then files
        Collections.sort(f, Collections.reverseOrder());
        
        return f;
    }
    
    public static void main(String[] args) {
        System.out.println(ReadFiles.read(START_PATH));
    }
}
