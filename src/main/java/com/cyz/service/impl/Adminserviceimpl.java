package com.cyz.service.impl;

import com.cyz.dao.Admindao;
import com.cyz.domain.Admin;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import com.cyz.service.Adminservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class Adminserviceimpl implements Adminservice {
    @Autowired
    private Admindao admindao;
    @Override
    public void updatePassword(Admin admin) {
        admindao.updatePassword(admin);
    }

    @Override
    public Admin findSelfMsg(int aid) {
        return admindao.findSelfMsg(aid);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        admindao.addTeacher(teacher);
    }

    @Override
    public void addStudent(Student student) {
         admindao.addStudent(student);
    }

    @Override
    public List<Student> findAllStudent() {
        return admindao.findAllStudent();
    }

    @Override
    public List<Teacher> findAllTeacher() {
        return admindao.findAllTeacher();
    }

    @Override
    public List<Admin> checkLogin() {
        return admindao.checkLogin();
    }
}
