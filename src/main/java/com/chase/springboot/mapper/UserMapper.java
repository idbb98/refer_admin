package com.chase.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chase.springboot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author bin
 * @since 2022-05-03
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    Page<User> findPage(Page<User> page, @Param("username") String username,@Param("email") String email,@Param("address") String address);
}
