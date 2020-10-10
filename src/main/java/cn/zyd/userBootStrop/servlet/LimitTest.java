package cn.zyd.userBootStrop.servlet;

public class LimitTest {
    public static void main(String[] args) {
        String str=" ,a,s,d,r, ,r,u,i";
        String [] spli=str.split(",",-1);
        System.out.println("分割后的字符串长度："+spli.length);
        for(String s:spli){
            System.out.print(s);
        }
    }
}
