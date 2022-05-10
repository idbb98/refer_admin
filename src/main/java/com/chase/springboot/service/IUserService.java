package com.chase.springboot.service;

import com.chase.springboot.controller.dto.UserDTO;
import com.chase.springboot.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bin
 * @since 2022-05-03
 */
public interface IUserService extends IService<User> {

    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);
}
