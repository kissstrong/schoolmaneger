package com.cyz.controller;

import com.cyz.domain.Admin;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import com.cyz.service.impl.Adminserviceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class Admincontroller {
    @Autowired
    private Adminserviceimpl adminserviceimpl;
    @ResponseBody
    @RequestMapping("/admin")
    public String get(String name, String password, HttpServletRequest request){
        List<Admin> admins = adminserviceimpl.checkLogin();
        for (Admin admin : admins) {
            if (admin.getAname().equals(name) && admin.getApassword().equals(password)){
                request.getSession().setAttribute("aid",admin.getAid());
                return "admin";
            }
        }
        return "error";
    }
    @ResponseBody
    @RequestMapping("/aupdatePassword")
    public String tupdatePassword(int aid,String password){
        Admin admin =new Admin();
        admin.setAid(aid);
        admin.setApassword(password);
        adminserviceimpl.updatePassword(admin);
        return "";
    }
    @ResponseBody
    @RequestMapping("/findAllteacher")
    public List<Teacher> findAllteacher(){
        List<Teacher> allTeacher = adminserviceimpl.findAllTeacher();
        return allTeacher;
    }
    @ResponseBody
    @RequestMapping("/afindSelf")
    public Admin findSelf(int aid){
        Admin selfMsg = adminserviceimpl.findSelfMsg(aid);
        return selfMsg;
    }
    @ResponseBody
    @RequestMapping("/addteacher")
    public String addteacher(String tname,String tpassword){
        Teacher teacher=new Teacher();
        teacher.setTname(tname);
        teacher.setTpassword(tpassword);
        adminserviceimpl.addTeacher(teacher);
        return "";
    }
    @ResponseBody
    @RequestMapping("/findAllstudent")
    public List<Student> findAllstudent(){
        List<Student> allStudent = adminserviceimpl.findAllStudent();
        return allStudent;
    }
    @ResponseBody
    @RequestMapping("/addstudent")
    public String addstudent(String sname,String spassword){
       Student student=new Student();
       student.setSname(sname);
       student.setSpassword(spassword);
       adminserviceimpl.addStudent(student);
        return "";
    }
}
