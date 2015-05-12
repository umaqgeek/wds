/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import java.io.File;
import java.util.ArrayList;

/**
 *
 * @author End User
 */
public class ListFilesUtil {
    
    public static String PATH_FOLDER = "\\\\UMAR-MUKHTAR\\Journalv3.0";
//    public static String PATH_FOLDER = "C://";
    
    /**
     * List all the files and folders from a directory
     *
     * @param directoryName to be listed
     */
    public void listFilesAndFolders(String directoryName) {

        File directory = new File(directoryName);

        //get all the files from a directory
        File[] fList = directory.listFiles();

        for (File file : fList) {
            System.out.println(file.getName());
        }
    }

    /**
     * List all the files under a directory
     *
     * @param directoryName to be listed
     */
    public void listFiles(String directoryName) {

        File directory = new File(directoryName);

        //get all the files from a directory
        File[] fList = directory.listFiles();

        for (File file : fList) {
            if (file.isFile()) {
                System.out.println(file.getName());
            }
        }
    }
    
    public ArrayList<String> listFiles2(String directoryName) {

        ArrayList<String> data = new ArrayList<String>();
        
        File directory = new File(directoryName);

        //get all the files from a directory
        File[] fList = directory.listFiles();

        for (File file : fList) {
            if (file.isFile()) {
                //System.out.println(file.getName());
                data.add(file.getName());
            }
        }
        
        return data;
    }

    /**
     * List all the folder under a directory
     *
     * @param directoryName to be listed
     */
    public void listFolders(String directoryName) {

        File directory = new File(directoryName);

        //get all the files from a directory
        File[] fList = directory.listFiles();

        for (File file : fList) {
            if (file.isDirectory()) {
                System.out.println(file.getName());
            }
        }
    }

    /**
     * List all files from a directory and its subdirectories
     *
     * @param directoryName to be listed
     */
    public void listFilesAndFilesSubDirectories(String directoryName) {

        File directory = new File(directoryName);

        //get all the files from a directory
        File[] fList = directory.listFiles();

        for (File file : fList) {
            if (file.isFile()) {
                System.out.println(file.getAbsolutePath());
            } else if (file.isDirectory()) {
                listFilesAndFilesSubDirectories(file.getAbsolutePath());
            }
        }
    }

    public static void main(String[] args) {

        ListFilesUtil listFilesUtil = new ListFilesUtil();

        //Windows directory example
        final String directoryWindows = "C://";

        listFilesUtil.listFiles(directoryWindows);
    }
}
