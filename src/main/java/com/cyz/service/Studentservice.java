package com.cyz.service;

import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;

import java.util.List;

public interface Studentservice {
    /**
     * 改密码
     * @param student
     */
    public void updatePassword(Student student);

    /**
     * 查看已选课程
     * @param sid
     * @return
     */
    public List<Stu_Course> findSelectedCourse(int sid);

    /**
     * 选课
     * @param stu_course
     */

    public void chooseCourse(Stu_Course stu_course);

    /**
     * 查看所有课程
     * @return
     */

    public List<Course> findAllCourse();

    /**
     * 查看自己信息
     * @param sid
     * @return
     */

    public Student findSelf(int sid);

    /**
     * 检查登录
     * @return
     */
    public List<Student> checkLogin();

    /**
     * 按课程查找课程
     * @param cid
     * @return
     */
    public Course findCourseByid(int cid);
}
