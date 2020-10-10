package cn.zyd.userBootStrop.service;

import cn.zyd.userBootStrop.entity.Userinfo;

import java.util.List;
import java.util.Map;

public interface UserinfoService {
    //显示
    public List<Userinfo> findAll();
    //模糊查询
    public List<Userinfo> queryByUser(Userinfo userinfo);
    //添加
    public Integer insert(Userinfo userinfo);
    //修改
    public Integer update(Userinfo userinfo);
    //删除
    public Integer delete(Integer uid);
    //分页显示
    public Map<String,Object> queryByList(Userinfo user,Integer offset,Integer pagesize);
}
