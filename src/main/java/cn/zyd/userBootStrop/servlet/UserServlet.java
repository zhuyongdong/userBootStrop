package cn.zyd.userBootStrop.servlet;

import cn.zyd.userBootStrop.entity.Userinfo;
import cn.zyd.userBootStrop.service.UserinfoService;
import cn.zyd.userBootStrop.service.impl.UserinfoServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private static UserinfoService userinfoService=new UserinfoServiceImpl();
    private  Userinfo userinfo=new Userinfo();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        //设置请求编码方式
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-Type", "text/html;charset=UTF-8");
        //获取请求参数
        String method=req.getParameter("method");
        List<Userinfo> list=null;
        //Map<String,Object> result=new HashMap<String, Object>();
        Userinfo userinfo=new Userinfo();
        ObjectMapper objectMapper=new ObjectMapper();
        switch (method){
            case ("findAll"):
                list=userinfoService.findAll();
                req.getSession().setAttribute("tempName",list);
                String jsonUser=objectMapper.writeValueAsString(list);
                resp.getWriter().write(jsonUser);
                break;
            case "query":
               /* Integer gt=0;
                String op=req.getParameter("uid");
                if(op.length()>0){
                    gt=Integer.parseInt(op);
                }
                userinfo.setUid(gt);
                String sex=req.getParameter("sex");
                if (sex.length()>0){
                    userinfo.setSex(sex);
                }
                String uname=req.getParameter("uname");
                if(uname.length()>0){
                    userinfo.setUname(uname);
                }
                //System.out.println(userinfo.getUid()+""+userinfo.getUname()+""+userinfo.getSex());
                list=userinfoService.queryByUser(userinfo);
                //System.out.println("list="+list);
                String jsonUsers=objectMapper.writeValueAsString(list);
                resp.getWriter().write(jsonUsers);*/
                break;
            case "insert":
                userinfo.setUname(req.getParameter("uname"));
                userinfo.setPwd(req.getParameter("pwd"));
                userinfo.setSex(req.getParameter("sex"));
                userinfo.setBirthday(req.getParameter("birthday"));
                userinfo.setCardid(req.getParameter("cardid"));
                userinfo.setAddr(req.getParameter("addr"));
                Integer insert=userinfoService.insert(userinfo);
                String ins=objectMapper.writeValueAsString(insert);
                resp.getWriter().write(ins);
                break;
            case "update":
                userinfo.setUid(Integer.parseInt(req.getParameter("uid")));
                userinfo.setUname(req.getParameter("uname"));
                userinfo.setPwd(req.getParameter("pwd"));
                userinfo.setSex(req.getParameter("sex"));
                userinfo.setBirthday(req.getParameter("birthday"));
                userinfo.setCardid(req.getParameter("cardid"));
                userinfo.setAddr(req.getParameter("addr"));
                Integer up=userinfoService.update(userinfo);
                String ups=objectMapper.writeValueAsString(up);
                resp.getWriter().write(ups);
                break;
            case "delete":
                String uts=req.getParameter("uids");
                System.out.println("uts="+uts);
                String [] ids=uts.split(",");
                Integer del=0;
                for (int i = 0; i < ids.length; i++) {
                    if(userinfoService.delete(Integer.parseInt(ids[i]))<=0){
                        del=1;
                    }
                }
                String dels=objectMapper.writeValueAsString(del);
                resp.getWriter().write(dels);
                break;
            case "queryByList":
                String op=req.getParameter("uid");
                userinfo.setUid(Integer.parseInt(op.length()==0?"0":op));
                String sex=req.getParameter("sex");
                if (sex.length()!=0){
                    userinfo.setSex(sex);
                }
                String uname=req.getParameter("uname");
                if(uname.length()!=0){
                    userinfo.setUname(uname);
                }
                String rows=req.getParameter("rows");
                String page=req.getParameter("page");
                Map<String,Object> ma=userinfoService.queryByList(userinfo,Integer.parseInt(rows),Integer.parseInt(page));
                String jsonUsers=objectMapper.writeValueAsString(ma);
                resp.getWriter().write(jsonUsers);
                break;
            default:
                System.out.println("method  erro");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
