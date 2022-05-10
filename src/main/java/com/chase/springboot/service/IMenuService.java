package com.chase.springboot.service;

import com.chase.springboot.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bin
 * @since 2022-05-08
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
