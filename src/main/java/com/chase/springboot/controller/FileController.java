package com.chase.springboot.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chase.springboot.common.Result;
import com.chase.springboot.entity.Files;
import com.chase.springboot.entity.User;
import com.chase.springboot.mapper.FileMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>
 * 文件上传接口
 * </p>
 *
 * @author bin
 * @since 2022-05-05
 */
@RestController
@RequestMapping("/file")
public class FileController {

    @Resource
    private FileMapper fileMapper;

    @Value("${files.upload.path}")
    private String fileUploadPath;

    /**
     * 文件上传接口
     *
     * @param file
     * @return
     * @throws IOException
     */
    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename);
        long size = file.getSize();

        //定义文件唯一的标识码
        String uuid = IdUtil.fastSimpleUUID();
        String fileUuid = uuid + StrUtil.DOT + type;
        //文件路径
        File uploadFile = new File(fileUploadPath + fileUuid);
        //判断配置文件目录是否存在，若不存在创建一个新的目录
        File parentFile = uploadFile.getParentFile();
        if (!parentFile.exists()) {
            parentFile.mkdirs();
        }

        //把获取的文件存储到磁盘目录
        file.transferTo(uploadFile);
        //获取文件MD5  注意文件要先上传才能获取到MD5，或者前端获取MD5可不上传
        String md5 = SecureUtil.md5(uploadFile);
        Files dbFiles = getFileByMd5(md5);
        String url;
        if(dbFiles != null) {
            url = dbFiles.getUrl();
            //数据库已存在，删除上传的文件
            uploadFile.delete();
        } else {
            url = "http://localhost:9090/file/" + fileUuid;
        }

        // 存储数据库
        Files saveFile = new Files();
        saveFile.setName(originalFilename);
        saveFile.setType(type);
        saveFile.setSize(size / 1024);
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        fileMapper.insert(saveFile);
        return url;
    }

    /**
     * 文件下载接口
     *
     * @param fileUuid "http://localhost:9090/file/{fileUuid}"
     * @param response
     * @throws IOException
     */
    @GetMapping("/{fileUuid}")
    public void download(@PathVariable String fileUuid, HttpServletResponse response) throws IOException {
        //根据文件唯一标识码获取文件
        File uploadFile = new File(fileUploadPath + fileUuid);
        //设置输出流格式
        ServletOutputStream outputStream = response.getOutputStream();
        response.addHeader("Content-Disposition", "attachment;filename" + URLEncoder.encode(fileUuid, "UTF-8"));// 下载后的文件名称
        response.setContentType("application/octet-stream");

        //读取文件的字节流
        outputStream.write(FileUtil.readBytes(uploadFile));
        outputStream.flush();
        outputStream.close();
    }

    /**
     * 查询文件的MD5是否存在
     * @param md5
     * @return
     */
    private Files getFileByMd5(String md5){
        //查询文件的MD5是否存在
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("md5",md5);
        List<Files> filesList = fileMapper.selectList(queryWrapper);
        return filesList.size() == 0 ? null : filesList.get(0);
    }

    @PostMapping("/update")
    public Result save(@RequestBody Files files) {
        return Result.success(fileMapper.updateById(files));
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        Files files = fileMapper.selectById(id);
        files.setIsDelete(true);
        fileMapper.updateById(files);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {    //[1,2,3]
        //select * from sys_file where id in (id,id,id...)
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("id",ids);
        List<Files> files = fileMapper.selectList(queryWrapper);
        for (Files file : files) {
            file.setIsDelete(true);
            fileMapper.updateById(file);
        }
        return Result.success();
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        //查询未删除记录
        queryWrapper.eq("is_delete",false);
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        return Result.success(fileMapper.selectPage(new Page<>(pageNum, pageSize), queryWrapper));
    }

}
