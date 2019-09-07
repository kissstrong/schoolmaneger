package com.cyz.dao;

import com.cyz.domain.Admin;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface Admindao {
    @Update("update admin set apassword =#{apassword} where aid =#{aid}")
    public void updatePassword(Admin admin);
    @Select("select * from admin where aid=#{aid}")
    public Admin findSelfMsg(int aid);
    @Insert("insert into teacher values(null,#{tname},#{tpassword})")
    public void addTeacher(Teacher teacher);
    @Insert("insert into student values(null,#{sname},#{spassword})")
    public void addStudent(Student student);
    @Select("select * from student")
    public List<Student> findAllStudent();
    @Select("select * from teacher")
    public List<Teacher> findAllTeacher();
    @Select("select * from admin")
    public List<Admin> checkLogin();
}
