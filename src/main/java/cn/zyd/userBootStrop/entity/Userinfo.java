package cn.zyd.userBootStrop.entity;

/**
 * 实体类
 */
public class Userinfo {
    private int uid;            //用户id
    private String uname;       //用户姓名
    private String pwd;         //用户密码
    private String sex;         //用户性别
    private String birthday;      //用户生日
    private String cardid;      //身份证号
    private String addr;        //地址

    public Userinfo() {

    }

    public Userinfo(int uid, String uname, String pwd, String sex, String birthday, String cardid, String addr) {
        this.uid = uid;
        this.uname = uname;
        this.pwd = pwd;
        this.sex = sex;
        this.birthday = birthday;
        this.cardid = cardid;
        this.addr = addr;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Override
    public String toString() {
        return "Userinfo{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", pwd='" + pwd + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", cardid='" + cardid + '\'' +
                ", addr='" + addr + '\'' +
                '}';
    }
}
