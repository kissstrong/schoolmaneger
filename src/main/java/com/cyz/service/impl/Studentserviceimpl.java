package com.cyz.service.impl;

import com.cyz.dao.Studentdao;
import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.service.Studentservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Studentserviceimpl implements Studentservice {
    @Autowired
    private Studentdao studentdao;

    @Override
    public void updatePassword(Student student) {
    studentdao.updatePassword(student);
    }

    @Override
    public List<Stu_Course> findSelectedCourse(int sid) {
        return studentdao.findSelectedCourse(sid);
    }

    @Override
    public void chooseCourse(Stu_Course stu_course) {
       studentdao.chooseCourse(stu_course);
    }

    @Override
    public List<Course> findAllCourse() {
        return studentdao.findAllCourse();
    }

    @Override
    public Student findSelf(int sid) {
        return studentdao.findSelf(sid);
    }

    @Override
    public List<Student> checkLogin() {
        return studentdao.checkLogin();
    }

    @Override
    public Course findCourseByid(int cid) {
        return studentdao.findCourseByid(cid);
    }
}
