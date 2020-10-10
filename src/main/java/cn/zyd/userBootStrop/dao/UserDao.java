package cn.zyd.userBootStrop.dao;

import cn.zyd.userBootStrop.entity.Userinfo;
import cn.zyd.userBootStrop.utils.DruidUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDao {
    private static JdbcTemplate jdbcTemplate=new JdbcTemplate(DruidUtils.getDs());

    //显示所有
    public List<Userinfo> findAll(){
        String sql="select * from usersinfo";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Userinfo>(Userinfo.class));
    }
    //分页查询
    public List<Userinfo> queryByUserId(Userinfo userinfo){
        List<Object> list=new ArrayList<>();
        String sql = "select * from usersinfo where 1=1 ";
        if(userinfo.getUid()!=0){
            sql+=" and uid = ? ";
            list.add(userinfo.getUid());
        }
        if(userinfo.getUname()!=null&&!"".equals(userinfo.getUname().trim())){
            sql+=" and uname like ? ";
            list.add("%"+userinfo.getUname()+"%");
        }
        if(userinfo.getSex()!=null&&!"".equals(userinfo.getSex().trim())){
            sql+=" and sex = ? ";
            list.add(userinfo.getSex());
        }
        System.out.println("sql="+sql);
        List<Userinfo> query;
        query=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Userinfo>(Userinfo.class),list.toArray());
        return query;
    }
    //添加
    public Integer insert(Userinfo userinfo){
        String sql = "insert into usersinfo values(null,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, userinfo.getUname(), userinfo.getPwd(), userinfo.getSex(), userinfo.getBirthday(), userinfo.getCardid(), userinfo.getAddr());
    }
    //修改
    public Integer updateUser(Userinfo userinfo) {
        String sql = "update usersinfo set uname=?,pwd=?,sex=?,birthday=?,cardid=?,addr=? where uid=?";
        return jdbcTemplate.update(sql, userinfo.getUname(), userinfo.getPwd(), userinfo.getSex(), userinfo.getBirthday(), userinfo.getCardid(), userinfo.getAddr(), userinfo.getUid());
    }
    //删除
    public Integer delete(Integer uid){
        String sql = "delete from usersinfo where uid=?";
        return jdbcTemplate.update(sql,uid);
    }
    //分页显示
    public Map<String,Object> queryByList(Userinfo user,Integer offset,Integer pagesize){
        System.out.println("queryByList BY Parme="+user.toString());
        Map<String,Object> result=new HashMap<String, Object>();
        List<Object> parmeList=new ArrayList<>();
        String sql="select * from usersinfo where 1=1 ";
        if (user.getUid()!=0){
            sql+="and uid=? ";
            parmeList.add(user.getUid());
        }
        if (user.getUname()!=null&&!"".equals(user.getUname().trim())){
            sql+="and uname like ? ";
            parmeList.add("%"+user.getUname().trim()+"%");
        }
        if (user.getSex()!=null&&!"".equals(user.getSex().trim())){
            sql+="and sex=? ";
            parmeList.add(user.getSex().trim());
        }
        String sqlLimit=sql;
        sqlLimit+=" limit "+offset+","+pagesize;
        List<Userinfo> count=jdbcTemplate.query(sql,parmeList.toArray(),new BeanPropertyRowMapper<Userinfo>(Userinfo.class));
        result.put("total",count.size());
        List<Userinfo> rows=jdbcTemplate.query(sqlLimit,parmeList.toArray(),new BeanPropertyRowMapper<Userinfo>(Userinfo.class));
        result.put("rows",rows);
        return result;
    }
}
