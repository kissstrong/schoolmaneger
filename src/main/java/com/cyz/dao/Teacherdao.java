package com.cyz.dao;

import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import com.cyz.domain.Teacher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Teacherdao {
    @Select("select * from stu_course where sid =#{sid}")
    public List<Stu_Course> findStuMsg(int sid);
    @Select("select * from student")
    public List<Student> findAllStudent();
    @Select("select * from course")
    public List<Course> findAllCourse();
    @Insert("insert into course values(null,#{cname},#{cmsg},null)")
    public void addCourse(Course course);
    @Update("update stu_course set cgrade =#{cgrade} where sid =#{sid} and cid =#{cid}")
    public void updateGrade(Stu_Course stu_course);
    @Update("update teacher set tpassword = #{tpassword} where tid =#{tid}")
    public void updatePassword(Teacher teacher);
    @Select("select * from teacher where tid =#{tid}")
    public Teacher findSelfMsg(int tid);
    @Select("select * from teacher")
    public List<Teacher> checkLogin();
    @Select("select * from stu_course where sid=#{sid}")
    public List<Stu_Course> findstudentcourse(int sid);
}
