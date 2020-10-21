package com.geekbang.hwork.week01;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;

/**
 * <p>
 *
 * </p>
 *
 * @author
 * @since
 */
public class CustomClassLoader {
    public static void main(String[] args) {
        String path = "C:\\Users\\dell\\Desktop\\hwork\\01\\";
        String pathWithProtocal = "file:\\"+path;
        convertXlass(path);

        URLClassLoader urlClassLoader = (URLClassLoader) CustomClassLoader.class.getClassLoader();
        try {
            Method method = URLClassLoader.class.getDeclaredMethod("addURL", URL.class);
            method.setAccessible(true);
            URL url = new URL(pathWithProtocal);
            method.invoke(urlClassLoader, url);
            Method helloMethod = Class.forName("Hello").getDeclaredMethod("hello");
            helloMethod.invoke(Class.forName("Hello").newInstance());
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
    }


    private static void convertXlass(String path) {
        if(path != null && path.length() == 0) {
            return;
        }

        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }

        try(FileInputStream fis = new FileInputStream(new File(path + "Hello.xlass"));
            FileOutputStream fos = new FileOutputStream(new File(path + "Hello.class"))) {

            byte[] byteArr = new byte[1024];
            int n = 0;
            while((n=fis.read(byteArr))!=-1) {
                fis.read(byteArr);
                for(int i=0; i<byteArr.length; i++) {
                    byteArr[i] = (byte)(255 - byteArr[i]);
                }
                fos.write(byteArr, 0, n);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
