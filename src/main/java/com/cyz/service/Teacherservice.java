package com.cyz.service;

import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;

import java.util.List;

public interface Teacherservice {
    /**
     * 查看学生信息
     * @param sid
     * @return
     */
    public List<Stu_Course> findStuMsg(int sid);

    /**
     * 查询所有学生
      * @return
     */
    public List<Student> findAllStudent();

    /**
     * 查询所有课程
     * @return
     */

    public List<Course> findAllCourse();

    /**
     * 添加课程
     * @param course
     */

    public void addCourse(Course course);

    /**
     * 更新成绩
     * @param stu_course
     */

    public void updateGrade(Stu_Course stu_course);

    /**
     * 改密码
     * @param teacher
     */

    public void updatePassword(Teacher teacher);

    /**
     * 查看自己信息
     * @param tid
     * @return
     */

    public Teacher findSelfMsg(int tid);

    /**
     * 检查登录
     * @return
     */
    public List<Teacher> checkLogin();

    /**
     * 查看学生选课情况
     * @param sid
     * @return
     */
    public List<Stu_Course> findstudentcourse(int sid);
}
