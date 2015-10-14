/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.DirectoryStream;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author umarmukhtar
 */
public class ReadFiles {
    
    public static final int START_PATH_NUM = 4;
//    public static final String START_PATH = "/Applications/XAMPP/htdocs/wds_1";
    public static final String START_PATH = "\\\\10.154.35.29\\Getsoud_Excel";
    public static final String START_PATH_SEPARATOR = "/";
    public static int NUM_OF_FILES = 0;
    public static final int NUM_MAX_FILES = 100000;
    
    public static ArrayList<String> read1(String path1) {
        ArrayList<String> f = new ArrayList<String>();
        
//        try {
//            int i = 1;
//            Path dir = FileSystems.getDefault().getPath(path1);
//            DirectoryStream stream = Files.newDirectoryStream(dir);
//            for (Path path : stream) {
//                System.out.println("" + i + ": " + path.getFileName());
//                if (++i > NUM_MAX_FILES) {
//                    break;
//                }
//            }
//            stream.close();
//        } catch (IOException ex) {
//            Logger.getLogger(ReadFiles.class.getName()).log(Level.SEVERE, null, ex);
//        }
        
        return f;
    }
    
    public static ArrayList<String> read(String path, int start, int count, String carian) {
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();

        ArrayList<String> f = new ArrayList<String>();
        int status = 1;
        
        try {
            ReadFiles.NUM_OF_FILES = 0;
            for (int i = start; i < start+count; i++) {
                File file = listOfFiles[i];
                boolean stat = true;
                if (file.isFile()) {
                    status = 1;
                    stat = file.getName().substring(0, 2).equals("S_");
                    
                    if (carian != null && carian != "") {
//                        int sizeFile = file.getName().length();
//                        int sizeCarian = carian.length();
//                        int sizeMatch = (sizeFile < sizeCarian) ? (sizeFile) : (sizeCarian);
//                        stat = file.getName().substring(0, sizeMatch).equals(carian);
                        stat = file.getName().toUpperCase().contains(carian.toUpperCase());
                    }
                    
                } else if (file.isDirectory()) {
                    status = 2;
                }
                
                System.out.println("data "+i+" start "+start);
                if (stat && i>=start) {
                    f.add(status + "|" + file.getName());
                    ReadFiles.NUM_OF_FILES += 1;
                }
                
//                if (count-- == 0) {
//                    break;
//                }
            }
            
            for (int i = 0; i < listOfFiles.length; i++) {
                File file = listOfFiles[i];
                boolean stat = false;
                if (carian != null && carian != "") {
                    if (file.isFile()) {
                        status = 1;
                    } else if (file.isDirectory()) {
                        status = 2;
                    }
//                    int sizeFile = file.getName().length();
//                    int sizeCarian = carian.length();
//                    int sizeMatch = (sizeFile < sizeCarian) ? (sizeFile) : (sizeCarian);
//                    stat = file.getName().substring(0, sizeMatch).equals(carian);
                    stat = file.getName().toUpperCase().contains(carian.toUpperCase());
                }
                if (stat) {
                    f.add(status + "|" + file.getName());
                    ReadFiles.NUM_OF_FILES += 1;
                }
            }
            
        } catch (Exception e) {
        }
        
        // sort by folder and then files
        Collections.sort(f, Collections.reverseOrder());
        
        return f;
    }
    
    public static void main(String[] args) {
        System.out.println(ReadFiles.read(START_PATH, 0, 10000, ""));
    }
}
