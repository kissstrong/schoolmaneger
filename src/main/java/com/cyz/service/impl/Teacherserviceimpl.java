package com.cyz.service.impl;

import com.cyz.dao.Teacherdao;
import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import com.cyz.service.Teacherservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Teacherserviceimpl implements Teacherservice {
    @Autowired
    private Teacherdao teacherdao;

    @Override
    public List<Stu_Course> findStuMsg(int sid) {
        return teacherdao.findStuMsg(sid);
    }

    @Override
    public List<Student> findAllStudent() {
        return teacherdao.findAllStudent();
    }

    @Override
    public List<Course> findAllCourse() {
        return teacherdao.findAllCourse();
    }

    @Override
    public void addCourse(Course course) {

       teacherdao.addCourse(course);

    }

    @Override
    public void updateGrade(Stu_Course stu_course) {
       teacherdao.updateGrade(stu_course);
    }

    @Override
    public void updatePassword(Teacher teacher) {
         teacherdao.updatePassword(teacher);
    }

    @Override
    public Teacher findSelfMsg(int tid) {
        return teacherdao.findSelfMsg(tid);
    }

    @Override
    public List<Teacher> checkLogin() {
        return teacherdao.checkLogin();
    }

    @Override
    public List<Stu_Course> findstudentcourse(int sid) {
        return teacherdao.findstudentcourse(sid);
    }
}
