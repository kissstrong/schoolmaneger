package com.cyz.controller;
import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.service.impl.Studentserviceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class Studentcontroller {
    @Autowired
    private Studentserviceimpl studentserviceimpl;
    @ResponseBody
    @RequestMapping("/student")
    public String get(String name, String password, HttpServletRequest request){
        List<Student> students = studentserviceimpl.checkLogin();
        for (Student student : students) {
            if (student.getSname().equals(name)&&student.getSpassword().equals(password)){
                request.getSession().setAttribute("sid",student.getSid());
                return "student";
            }
        }
        return "error";
    }
    @ResponseBody
    @RequestMapping("/sfindSelf")
    public Student findSelf(int sid){
        Student self = studentserviceimpl.findSelf(sid);
        return self;
    }
    @ResponseBody
    @RequestMapping("/findSelectedCourse")
    public List<Stu_Course> findSelectedCourse(int sid){
        List<Stu_Course> selectedCourse = studentserviceimpl.findSelectedCourse(sid);
        return selectedCourse;
    }
    @ResponseBody
    @RequestMapping("/findCourse")
    public List<Course> findCourse(){
        List<Course> allCourse = studentserviceimpl.findAllCourse();
        return allCourse;
    }
    @ResponseBody
    @RequestMapping("/updatePassword")
    public void updatePassword(int sid,String password){
        Student student = new Student();
        student.setSid(sid);
        student.setSpassword(password);
        studentserviceimpl.updatePassword(student);
    }
    @ResponseBody
    @RequestMapping("/joinstudy")
    public String joinstudy(int sid,int cid){
        Student self = studentserviceimpl.findSelf(sid);
        Course courseByid = studentserviceimpl.findCourseByid(cid);
        Stu_Course stu_course=new Stu_Course();
        stu_course.setSid(self.getSid());
        stu_course.setSname(self.getSname());
        stu_course.setCid(courseByid.getCid());
        stu_course.setCname(courseByid.getCname());
        studentserviceimpl.chooseCourse(stu_course);
        return "";
    }
}
