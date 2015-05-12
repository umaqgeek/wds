/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

/**
 *
 * @author End User
 */
public class FileUpload {
    public static boolean processFile(String path, FileItemStream item) {
        try {
            File f = new File(path+File.separator+"assets"+File.separator+"uploads");
            if(!f.exists()) {
                f.mkdir();
            }
            File savedFile = new File(f.getAbsolutePath()+File.separator+item.getName());
            FileOutputStream fos = new FileOutputStream(savedFile);
            InputStream is = item.openStream();
            int x = 0;
            byte[] b = new byte[1024];
            while((x=is.read(b))!=-1) {
                fos.write(b, 0, x);
            }
            fos.flush();
            fos.close();
            return true;
        } catch (Exception e) {
            System.out.println("FileUpload 35: "+e.getMessage());
        }
        return false;
    }
}
