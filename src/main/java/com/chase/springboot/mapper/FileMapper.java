package com.chase.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chase.springboot.entity.Files;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author bin
 * @since 2022-05-05
 */
@Mapper
public interface FileMapper extends BaseMapper<Files> {

}
