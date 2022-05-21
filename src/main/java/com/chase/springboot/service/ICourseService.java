package com.chase.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chase.springboot.entity.Course;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bin
 * @since 2022-05-14
 */
public interface ICourseService extends IService<Course> {


    Page<Course> findPage(Page<Course> page, String name);


    void setStudentCourse(Integer courseId, Integer studentId);
}

