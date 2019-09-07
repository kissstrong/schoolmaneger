package com.cyz.controller;

import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import com.cyz.service.impl.Teacherserviceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class Teachercontroller {
    @Autowired
    private Teacherserviceimpl teacherserviceimpl;
    @ResponseBody
    @RequestMapping("/teacher")
    public String get(String name, String password, HttpServletRequest request){
        List<Teacher> teachers = teacherserviceimpl.checkLogin();
        for (Teacher teacher : teachers) {
            if (teacher.getTname().equals(name)&&teacher.getTpassword().equals(password)){
                request.getSession().setAttribute("tid",teacher.getTid());
                return "teacher";
            }
        }
        return "error";
    }
    @ResponseBody
    @RequestMapping("/tfindSelf")
    public Teacher findSelf(int tid){
        Teacher self = teacherserviceimpl.findSelfMsg(tid);
        return self;
    }
    @ResponseBody
    @RequestMapping("/tupdatePassword")
    public void updatePassword(int tid,String password){
        Teacher teacher =new Teacher();
        teacher.setTid(tid);
        teacher.setTpassword(password);
        teacherserviceimpl.updatePassword(teacher);
    }
    @ResponseBody
    @RequestMapping("/tfindAllCourse")
    public List<Course> tfindAllCourse(){
        List<Course> allCourse = teacherserviceimpl.findAllCourse();
        return allCourse;
    }
    @ResponseBody
    @RequestMapping("/addCourse")
    public String addCourse(String cname,String cmsg){
        Course course =new Course();
        course.setCname(cname);
        course.setCmsg(cmsg);

        teacherserviceimpl.addCourse(course);


        return "";
    }
    @ResponseBody
    @RequestMapping("/tfindallstudent")
    public List<Student> tfindallstudent(){
        List<Student> allStudent = teacherserviceimpl.findAllStudent();
        return allStudent;
    }
    @ResponseBody
    @RequestMapping("/showstudentcourse")
    public List<Stu_Course> showstudentcourse(int sid){
        List<Stu_Course> findstudentcourse = teacherserviceimpl.findstudentcourse(sid);
        return findstudentcourse;
    }
    @ResponseBody
    @RequestMapping("/updategrade")
    public String updategrade(int sid,int cid,int cgrade){
        Stu_Course stu_course = new Stu_Course();
        stu_course.setCid(cid);
        stu_course.setSid(sid);
        stu_course.setCgrade(cgrade);
        teacherserviceimpl.updateGrade(stu_course);
        return "";
    }
}
