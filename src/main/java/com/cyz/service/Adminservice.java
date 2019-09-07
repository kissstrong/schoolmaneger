package com.cyz.service;

import com.cyz.domain.Admin;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;

import java.util.List;

public interface Adminservice {
    /**
     * 改密码
     * @param admin
     */
    public void updatePassword(Admin admin);

    /**
     * 查看自己信息
     * @param aid
     * @return
     */

    public Admin findSelfMsg(int aid);

    /**
     * 添加教师
     * @param teacher
     */

    public void addTeacher(Teacher teacher);

    /**
     * 添加学生
     * @param student
     */

    public void addStudent(Student student);

    /**
     * 查询所有学生
     * @return
     */

    public List<Student> findAllStudent();

    /**
     * 查询所有老师
     * @return
     */

    public List<Teacher> findAllTeacher();

    /**
     * 登录检查
     * @return
     */
    public List<Admin> checkLogin();
}
