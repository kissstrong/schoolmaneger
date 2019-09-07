package com.cyz.dao;


import com.cyz.domain.Course;
import com.cyz.domain.Stu_Course;
import com.cyz.domain.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Studentdao {
    @Update("update student set spassword = #{spassword} where sid = #{sid}")
    public void updatePassword(Student student);
    @Select("select * from stu_course where sid = #{sid}")
    public List<Stu_Course> findSelectedCourse(int sid);
    @Insert("insert into stu_course values(null,#{sid},#{sname},#{cid},#{cname},null)")
    public void chooseCourse(Stu_Course stu_course);
    @Select("select * from course")
    public List<Course> findAllCourse();
    @Select("select * from student where sid =#{sid}")
    public Student findSelf(int sid);
    @Select("select * from student")
    public List<Student> checkLogin();
    @Select("select * from course where cid=#{cid}")
    public Course findCourseByid(int cid);
}
