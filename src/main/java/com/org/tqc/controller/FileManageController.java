package com.org.tqc.controller;

import com.org.tqc.entity.User;
import com.org.tqc.entity.uploadFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * Created by 唐全成 on 2016/11/8.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/fileManage")
public class FileManageController {

    @RequestMapping(value = "/getImages")
    @ResponseBody
    public ModelAndView getImages(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("userinfo");
        String userFile;
        if (user == null) {
            userFile = "public";
        } else {
            userFile = "" + user.getUser_id();
        }

        ModelAndView md = new ModelAndView("/gallery");
        String path = request.getRealPath("/static/uploadImage/" + userFile + "/image/");

        ArrayList<String> imgs = new ArrayList<String>(20);
        getAllFileName(path, imgs);
        md.addObject("allImages", imgs);

        return md;
    }

    public static void getAllFileName(String path, ArrayList<String> fileName) {
        File file = new File(path);
        File[] files = file.listFiles();
        if (files != null && files.length != 0) {
            for (File a : files) {
                if (a.isDirectory()) {
                    getAllFileName(a.getAbsolutePath(), fileName);
                } else {
                    fileName.add(replaceString(a.getPath()));
                }
            }
        }
    }

    public static String replaceString(String str) {
        str = str.replace("\\", "/");
        String[] strs = str.split("uploadImage");
        if (strs != null && strs.length > 0) {
            return strs[1];
        } else {
            return null;
        }
    }


    @RequestMapping(value = "/getAllFiles")
    @ResponseBody
    public ModelAndView getAllFiles(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("userinfo");
        String userFile;
        if (user == null) {
            userFile = "public";
        } else {
            userFile = "" + user.getUser_id();
        }
        ModelAndView md = new ModelAndView("/fileManager");
        String path = request.getRealPath("/static/uploadImage/" + userFile + "/");
        ArrayList<String> files = new ArrayList<String>(20);
        getAllFileName(path, files);

        makeFilesObject(files);

        md.addObject("allFiles", makeFilesObject(files));

        return md;
    }

    private static List<uploadFile> makeFilesObject(ArrayList<String> files) {

        List<uploadFile> list = new ArrayList<>(20);
        String[] str = new String[2];
        String extName = null;
        // 定义允许上传的文件扩展名
        HashMap<Integer, String> extMap = new HashMap<Integer, String>();
        extMap.put(1, "gif,jpg,jpeg,png,bmp");
        extMap.put(2, "swf,flv");
        extMap.put(3, "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put(4, "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        for (String s : files) {
            uploadFile file = new uploadFile();
            // 检查扩展名
            file.setFullName(s);
            extName = s.substring(s.lastIndexOf(".") + 1).toLowerCase();
            s = s.substring(s.lastIndexOf("/") + 1);
            Iterator iterator = extMap.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                Integer key = (Integer) entry.getKey();
                String value = (String) entry.getValue();

                if (Arrays.<String>asList(value.split(","))
                        .contains(extName)) {
                    file.setType(key);
                    break;
                }
            }
            str = s.split("--");

            if (str.length > 1) {
                file.setName(str[1]);
                file.setDate(str[0]);
            } else {
                file.setName(s);
                file.setDate(s.substring(0, 13));
            }

            list.add(file);
        }

        return list;
    }
}
